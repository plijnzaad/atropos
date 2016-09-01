#!/bin/bash

# This script will generate the commands to run the analyses for the
# Atropos paper.
#
# For each error profile, we run Atropos, SeqPurge, and Skewer using
# equivalent (or as similar as possible) arguments. The tests are run
# both locally (Late 2013 Mac Pro, 3.7 GHz quad-core Xeon E5, 32 GB
# memory) and on a cluster (SL6, ???, connected to Isilon NAS over
# InfiniBand??). Atropos is run both with and without a separate Writer
# process. The tests are run on 1) simulated data (see simulate_reads.sh)
# and 2) real data (from the SeqPurge paper, Sturm et al. 2016,
# ftp://ftp.sra.ebi.ac.uk/vol1/ERA494/ERA494451/).
#
# Call: prepare_simulated_analyses.sh -t <threads> -r <root dir> -o <output dir>
#
# TODO: Add SeqPrep and Scythe to the benchmarks

# A POSIX variable; reset in case getopts has been used
# previously in the shell.
OPTIND=1

# Set default values
threads=8
script_dir=`pwd`
root=`dirname $script_dir`
outdir='results'
# reference genome (for mapping real reads)
genome=$root/data/ref.fa

while getopts "t:r:o:g:" opt; do
    case "$opt" in
    t)
        threads=$OPTARG
        ;;
    r)
        root=$OPTARG
        ;;
    o)
        outdir=$OPTARG
        ;;
    g)
        genome=$OPTARG
        ;;
    esac
done

shift $((OPTIND-1))

[ "$1" = "--" ] && shift

commands="commands_t$threads.sh"
rm -f $commands

echo "#!/bin/bash" >> $commands
echo "# Generated by prepare_simulated_analyses.sh with arguments" \
     "threads: $threads, command file: $commands, root: $root, results: $outdir" \
     "unused args: $@" >> $commands

## Constants

# binaries
ATROPOS=atropos
SEQPURGE=$root/software/bin/SeqPurge
SKEWER=$root/software/bin/skewer
BWAMETH=bwameth.py
SAMTOOLS=samtools
# minimum read length after trimming
MIN_LEN=25
# number of reads to process in a batch
# (also used as prefetch size for SeqPurge)
BATCH_SIZE=5000

## simulated reads

for err in 001 005 01 real
do
  # In the simulated data, we don't do error correction in Atropos
  # or SeqPurge because it shouldn't affect the outcome of adapter
  # trimming and increases the processing time of the benchmarking
  # scripts (error correction can't be turned off in Skewer). Also,
  # the simulated data has a lower max error rate than the real data.
  
  if [ "$err" == "real" ]
  then
      fq1=$root/data/real/GM12878_WGBS.1.fq.gz
      fq2=$root/data/real/GM12878_WGBS.2.fq.gz
      quals='0 20'
      aligners='insert'
      atropos_extra='--correct-mismatches best -e 0.3'
      seqpurge_extra='-ec -match_perc 70'
      skewer_extra='-r 0.3'
      err_rate='0.3' # real data has fairly high error
      ADAPTER1="AGATCGGAAGAGCACACGTCTGAACTCCAGTCACCAGATCATCTCGTATGCCGTCTTCTGCTTG" # TruSeq index 7
      ADAPTER2="AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT" # TruSeq universal
      # download data
      if [ ! -f $fq1 ]
      then
        mkdir -p $root/data/real
        wget -S -O https://www.encodeproject.org/files/ENCFF798RSS/@@download/ENCFF798RSS.fastq.gz | gunzip | head -4000000 | gzip > $fq1
        wget -S -O https://www.encodeproject.org/files/ENCFF113KRQ/@@download/ENCFF113KRQ.fastq.gz | gunzip | head -4000000 | gzip > $fq2
      fi
  else
      fq1=$root/data/simulated/sim_${err}.1.fq
      fq2=$root/data/simulated/sim_${err}.2.fq
      quals='0'
      atropos_extra='-e 0.15'
      seqpurge_extra='-match_perc 85'
      skewer_extra='-r 0.15'
      aligners='adapter insert'
      ADAPTER1="AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG"
      ADAPTER2="AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT"
  fi
 
  # Other data sets:
  # Amplicon data from SeqPurge paper uses a TruSeq indexed adapter
  # with custom 8 bp index:
  # ADAPTER1="GATCGGAAGAGCACACGTCTGAACTCCAGTCACAACGTGATATCTCGTATGCCGTCTTCTGCTTG"
  # ADAPTER2="AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT" # TruSeq universal
  # err=0.15
  # Accel-NGS Methyl (i.e. Swift) data:
  # ADAPTER1="AGATCGGAAGAGCACACGTCTGAACTCCAGTCACCGCTCATTATCTCGTATGCCGTCTTCTGCTTG"
  # ADAPTER2="AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGGCTATAGTGTAGATCTCGGTGGTCGCCGTATC"
  # err=0.2
              
  for qcut in $quals
  do
    for aligner in $aligners
    do
        # For Atropos, we provide the -O 7 argument, which requires
        # a minimum overlap between adapter and read of 7 bp
        # *only when performing adapter-match*. This is different than
        # the skewer -k arg, which places an absolute minimum threshold
        # on the adapter-read overlap, which Atropos currently does
        # not do. It is unclear how to set this parameter in skewer for
        # a fair comparison, so I just leave it as the default. SeqPurge
        # does not provide any parameter for setting the minimum overlap.
        
        profile="atropos_${threads}_${err}_q${qcut}_${aligner}_writercomp"
        echo ">&2 echo $profile && /usr/bin/time -p" \
        "$ATROPOS -T $threads --aligner $aligner" \
        "-a $ADAPTER1 -A $ADAPTER2" \
        "-O 7 -q $qcut --trim-n -e $err_rate" \
        "-m $MIN_LEN --batch-size $BATCH_SIZE " \
        "--report-file ${outdir}/${profile}_writer.report.txt" \
        "-o ${outdir}/${profile}.1.fq.gz" \
        "-p ${outdir}/${profile}.2.fq.gz" \
        "--log-level ERROR --quiet $atropos_extra" \
        "--compression writer -pe1 $fq1 -pe2 $fq2" >> $commands
        
        profile="atropos_${threads}_${err}_q${qcut}_${aligner}_workercomp"
        echo ">&2 echo $profile && /usr/bin/time -p" \
        "$ATROPOS -T $threads --aligner $aligner" \
        "-a $ADAPTER1 -A $ADAPTER2" \
        "-O 7 -q $qcut --trim-n -e $err_rate" \
        "-m $MIN_LEN --batch-size $BATCH_SIZE " \
        "--report-file ${outdir}/${profile}_nowriter.report.txt" \
        "-o ${outdir}/${profile}.1.fq.gz" \
        "-p ${outdir}/${profile}.2.fq.gz" \
        "--log-level ERROR --quiet $atropos_extra" \
        "--compression worker -pe1 $fq1 -pe2 $fq2" >> $commands
        
        profile="atropos_${threads}_${err}_q${qcut}_${aligner}_nowriter"
        echo ">&2 echo $profile && /usr/bin/time -p" \
        "$ATROPOS -T $threads --aligner $aligner" \
        "-a $ADAPTER1 -A $ADAPTER2" \
        "-O 7 -q $qcut --trim-n -e $err_rate" \
        "-m $MIN_LEN --batch-size $BATCH_SIZE " \
        "--report-file ${outdir}/${profile}_nowriter.report.txt" \
        "-o ${outdir}/${profile}.1.fq.gz" \
        "-p ${outdir}/${profile}.2.fq.gz" \
        "--log-level ERROR --quiet $atropos_extra" \
        "--no-writer-process -pe1 $fq1 -pe2 $fq2" >> $commands
    done
    
    if [ "$qcut" -eq "0" ]
    then
      n=''
      ncut=0
    else
      n='-n'
      ncut=7
    fi
    
    profile="seqpurge_${threads}_${err}_q${qcut}"
    echo ">&2 echo $profile && /usr/bin/time -p" \
    "$SEQPURGE -in1 $fq1 -in2 $fq2" \
    "-out1 ${outdir}/${profile}.1.fq.gz" \
    "-out2 ${outdir}/${profile}.2.fq.gz" \
    "-a1 $ADAPTER1 -a2 $ADAPTER2" \
    "-qcut $qcut -ncut $ncut -min_len $MIN_LEN" \
    "-threads $threads -prefetch $BATCH_SIZE" \
    "$seqpurge_extra" \
    "-summary ${outdir}/${profile}.summary" >> $commands
    
    profile="skewer_${threads}_${err}_q${qcut}"
    echo ">&2 echo $profile && /usr/bin/time -p" \
    "$SKEWER -m pe -l $MIN_LEN $skewer_extra" \
    "-o ${outdir}/${profile} -z --quiet" \
    "-x $ADAPTER1 -y $ADAPTER2 -t $threads" \
    "-q $qcut $n $fq1 $fq2 > ${outdir}/${profile}.summary.txt" >> $commands
  done
done

chmod +x $commands

# Now generate commands to map reads
if [ "$err" == "real" ]
then
    bwameth_commands="bwameth_commands_t${threads}.sh"
    rm -f $bwameth_commands
    sort_commands="sort_commands_t${threads}.sh"
    rm -f $sort_commands
    if [ ! -f $genome.bwameth.c2t ]
    then
      echo "$BWAMETH index $genome" >> $bwameth_commands
    fi

    rg="@RG\tID:untrimmed\tSM:untrimmed\tLB:untrimmed\tPL:ILLUMINA"
    fq1=$root/data/real/GM12878_WGBS.1.fq.gz
    fq2=$root/data/real/GM12878_WGBS.2.fq.gz
    echo "$BWAMETH -z -t ${threads} -o ${outdir}/untrimmed.bam --read-group '$rg'" \
    "--reference $genome $fq1 $fq2" >> $bwameth_commands
    echo "$SAMTOOLS sort -n -O bam -@ $threads -o $outdir/untrimmed.sorted.bam $outdir/untrimmed.bam" >> $sort_commands
  
    for qcut in 0 20
    do
      # map the untrimmed reads
      for profile in \
        atropos_${threads}_real_q${qcut}_insert_workercomp \
        seqpurge_${threads}_real_q${qcut} \
        skewer_${threads}_real_q${qcut}
      do
          rg="@RG\tID:${profile}\tSM:${profile}\tLB:${profile}\tPL:ILLUMINA"
          fq1=$outdir/${profile}.1.fq.gz
          fq2=$outdir/${profile}.2.fq.gz
          echo "$BWAMETH -z -t ${threads} -o ${outdir}/$profile.bam --read-group '$rg'" \
          "--reference $genome $fq1 $fq2" >> $bwameth_commands
          echo "$SAMTOOLS sort -n -O bam -@ $threads -o $outdir/$profile.sorted.bam $outdir/$profile.bam" >> $sort_commands
      done
    done
    chmod +x $bwameth_commands
    chmod +x $sort_commands
fi
