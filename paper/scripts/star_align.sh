name=$1
base=$2
threads=$3
fq1=${base}.1.fq.gz
fq2=${base}.2.fq.gz
mkdir $name
cd $name
mkfifo Read1 Read2
export TMPDIR='.'
echo "Aligning $fq1 $fq2"
/usr/bin/gzip -cd $fq1 > Read1 &
/usr/bin/gzip -cd $fq2 > Read2 &
# Don't exclude multi-mappers, just randomly select one
STAR --runThreadN $threads --genomeDir /cluster/ifs/projects/star/genomes/hg19_ercc_Ens74_50bp_STARv2.3.1x --readFilesIn Read1 Read2 \
  --outMultimapperOrder Random --outFilterMultimapNmax 100000 --outSAMmultNmax 1 \
  --outFileNamePrefix /cluster/ifs/projects/collins/jdidion/atropos/paper/scripts/results/rnaseq/${name}_rna \
  --outSAMtype BAM Unsorted --outSAMunmapped Within KeepPairs
rm Read1 Read2
cd ..
rm -Rf $name

