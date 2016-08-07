#!/bin/bash
# Generated by prepare_analyses.sh with arguments threads: 8, command file: commands_t8.sh, root: $ATROPOS_ROOT unused args: 
for prog in atropos seqpurge skewer ; do mkdir -p $prog ; done
echo Atropos 8_001_q0_writercomp
/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 0 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_001_q0_writercomp_writer.report.txt -o atropos/8_001_q0_writercomp.1.fq.gz -p atropos/8_001_q0_writercomp.2.fq.gz --log-level ERROR --quiet --compression writer $ATROPOS_ROOT/data/simulated/sim_001.1.fq $ATROPOS_ROOT/data/simulated/sim_001.2.fq
#echo Atropos 8_001_q0_workercomp
#/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 0 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_001_q0_workercomp_nowriter.report.txt -o atropos/8_001_q0_workercomp.1.fq.gz -p atropos/8_001_q0_workercomp.2.fq.gz --log-level ERROR --quiet --compression worker $ATROPOS_ROOT/data/simulated/sim_001.1.fq $ATROPOS_ROOT/data/simulated/sim_001.2.fq
echo Atropos 8_001_q0_nowriter
/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 0 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_001_q0_nowriter_nowriter.report.txt -o atropos/8_001_q0_nowriter.1.fq.gz -p atropos/8_001_q0_nowriter.2.fq.gz --log-level ERROR --quiet --no-writer-process $ATROPOS_ROOT/data/simulated/sim_001.1.fq $ATROPOS_ROOT/data/simulated/sim_001.2.fq
echo SeqPurge 8_001_q0
/usr/bin/time -p $ATROPOS_ROOT/software/bin/SeqPurge -in1 $ATROPOS_ROOT/data/simulated/sim_001.1.fq -in2 $ATROPOS_ROOT/data/simulated/sim_001.2.fq -out1 seqpurge/8_001_q0.1.fq.gz -out2 seqpurge/8_001_q0.2.fq.gz -a1 AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -threads 8 -qcut 0 -ncut 0 -min_len 25 -prefetch 5000 -match_perc 0.9 -summary seqpurge/8_001_q0.summary
echo Skewer 8_001_q0
/usr/bin/time -p $ATROPOS_ROOT/software/bin/skewer -m pe -l 25 -k 7 -o skewer/8_001_q0 -z -x AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -y AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -t 8 -q 0  $ATROPOS_ROOT/data/simulated/sim_001.1.fq $ATROPOS_ROOT/data/simulated/sim_001.2.fq >> skewer/8_001_q0.summary.txt
echo Atropos 8_001_q20_writercomp
/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 20 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_001_q20_writercomp_writer.report.txt -o atropos/8_001_q20_writercomp.1.fq.gz -p atropos/8_001_q20_writercomp.2.fq.gz --log-level ERROR --quiet --compression writer $ATROPOS_ROOT/data/simulated/sim_001.1.fq $ATROPOS_ROOT/data/simulated/sim_001.2.fq
#echo Atropos 8_001_q20_workercomp
#/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 20 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_001_q20_workercomp_nowriter.report.txt -o atropos/8_001_q20_workercomp.1.fq.gz -p atropos/8_001_q20_workercomp.2.fq.gz --log-level ERROR --quiet --compression worker $ATROPOS_ROOT/data/simulated/sim_001.1.fq $ATROPOS_ROOT/data/simulated/sim_001.2.fq
echo Atropos 8_001_q20_nowriter
/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 20 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_001_q20_nowriter_nowriter.report.txt -o atropos/8_001_q20_nowriter.1.fq.gz -p atropos/8_001_q20_nowriter.2.fq.gz --log-level ERROR --quiet --no-writer-process $ATROPOS_ROOT/data/simulated/sim_001.1.fq $ATROPOS_ROOT/data/simulated/sim_001.2.fq
echo SeqPurge 8_001_q20
/usr/bin/time -p $ATROPOS_ROOT/software/bin/SeqPurge -in1 $ATROPOS_ROOT/data/simulated/sim_001.1.fq -in2 $ATROPOS_ROOT/data/simulated/sim_001.2.fq -out1 seqpurge/8_001_q20.1.fq.gz -out2 seqpurge/8_001_q20.2.fq.gz -a1 AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -threads 8 -qcut 20 -ncut 7 -min_len 25 -prefetch 5000 -match_perc 0.9 -summary seqpurge/8_001_q20.summary
echo Skewer 8_001_q20
/usr/bin/time -p $ATROPOS_ROOT/software/bin/skewer -m pe -l 25 -k 7 -o skewer/8_001_q20 -z -x AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -y AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -t 8 -q 20 -n $ATROPOS_ROOT/data/simulated/sim_001.1.fq $ATROPOS_ROOT/data/simulated/sim_001.2.fq >> skewer/8_001_q20.summary.txt
echo Atropos 8_005_q0_writercomp
/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 0 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_005_q0_writercomp_writer.report.txt -o atropos/8_005_q0_writercomp.1.fq.gz -p atropos/8_005_q0_writercomp.2.fq.gz --log-level ERROR --quiet --compression writer $ATROPOS_ROOT/data/simulated/sim_005.1.fq $ATROPOS_ROOT/data/simulated/sim_005.2.fq
#echo Atropos 8_005_q0_workercomp
#/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 0 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_005_q0_workercomp_nowriter.report.txt -o atropos/8_005_q0_workercomp.1.fq.gz -p atropos/8_005_q0_workercomp.2.fq.gz --log-level ERROR --quiet --compression worker $ATROPOS_ROOT/data/simulated/sim_005.1.fq $ATROPOS_ROOT/data/simulated/sim_005.2.fq
echo Atropos 8_005_q0_nowriter
/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 0 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_005_q0_nowriter_nowriter.report.txt -o atropos/8_005_q0_nowriter.1.fq.gz -p atropos/8_005_q0_nowriter.2.fq.gz --log-level ERROR --quiet --no-writer-process $ATROPOS_ROOT/data/simulated/sim_005.1.fq $ATROPOS_ROOT/data/simulated/sim_005.2.fq
echo SeqPurge 8_005_q0
/usr/bin/time -p $ATROPOS_ROOT/software/bin/SeqPurge -in1 $ATROPOS_ROOT/data/simulated/sim_005.1.fq -in2 $ATROPOS_ROOT/data/simulated/sim_005.2.fq -out1 seqpurge/8_005_q0.1.fq.gz -out2 seqpurge/8_005_q0.2.fq.gz -a1 AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -threads 8 -qcut 0 -ncut 0 -min_len 25 -prefetch 5000 -match_perc 0.9 -summary seqpurge/8_005_q0.summary
echo Skewer 8_005_q0
/usr/bin/time -p $ATROPOS_ROOT/software/bin/skewer -m pe -l 25 -k 7 -o skewer/8_005_q0 -z -x AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -y AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -t 8 -q 0  $ATROPOS_ROOT/data/simulated/sim_005.1.fq $ATROPOS_ROOT/data/simulated/sim_005.2.fq >> skewer/8_005_q0.summary.txt
echo Atropos 8_005_q20_writercomp
/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 20 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_005_q20_writercomp_writer.report.txt -o atropos/8_005_q20_writercomp.1.fq.gz -p atropos/8_005_q20_writercomp.2.fq.gz --log-level ERROR --quiet --compression writer $ATROPOS_ROOT/data/simulated/sim_005.1.fq $ATROPOS_ROOT/data/simulated/sim_005.2.fq
#echo Atropos 8_005_q20_workercomp
#/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 20 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_005_q20_workercomp_nowriter.report.txt -o atropos/8_005_q20_workercomp.1.fq.gz -p atropos/8_005_q20_workercomp.2.fq.gz --log-level ERROR --quiet --compression worker $ATROPOS_ROOT/data/simulated/sim_005.1.fq $ATROPOS_ROOT/data/simulated/sim_005.2.fq
echo Atropos 8_005_q20_nowriter
/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 20 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_005_q20_nowriter_nowriter.report.txt -o atropos/8_005_q20_nowriter.1.fq.gz -p atropos/8_005_q20_nowriter.2.fq.gz --log-level ERROR --quiet --no-writer-process $ATROPOS_ROOT/data/simulated/sim_005.1.fq $ATROPOS_ROOT/data/simulated/sim_005.2.fq
echo SeqPurge 8_005_q20
/usr/bin/time -p $ATROPOS_ROOT/software/bin/SeqPurge -in1 $ATROPOS_ROOT/data/simulated/sim_005.1.fq -in2 $ATROPOS_ROOT/data/simulated/sim_005.2.fq -out1 seqpurge/8_005_q20.1.fq.gz -out2 seqpurge/8_005_q20.2.fq.gz -a1 AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -threads 8 -qcut 20 -ncut 7 -min_len 25 -prefetch 5000 -match_perc 0.9 -summary seqpurge/8_005_q20.summary
echo Skewer 8_005_q20
/usr/bin/time -p $ATROPOS_ROOT/software/bin/skewer -m pe -l 25 -k 7 -o skewer/8_005_q20 -z -x AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -y AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -t 8 -q 20 -n $ATROPOS_ROOT/data/simulated/sim_005.1.fq $ATROPOS_ROOT/data/simulated/sim_005.2.fq >> skewer/8_005_q20.summary.txt
echo Atropos 8_01_q0_writercomp
/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 0 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_01_q0_writercomp_writer.report.txt -o atropos/8_01_q0_writercomp.1.fq.gz -p atropos/8_01_q0_writercomp.2.fq.gz --log-level ERROR --quiet --compression writer $ATROPOS_ROOT/data/simulated/sim_01.1.fq $ATROPOS_ROOT/data/simulated/sim_01.2.fq
#echo Atropos 8_01_q0_workercomp
#/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 0 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_01_q0_workercomp_nowriter.report.txt -o atropos/8_01_q0_workercomp.1.fq.gz -p atropos/8_01_q0_workercomp.2.fq.gz --log-level ERROR --quiet --compression worker $ATROPOS_ROOT/data/simulated/sim_01.1.fq $ATROPOS_ROOT/data/simulated/sim_01.2.fq
echo Atropos 8_01_q0_nowriter
/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 0 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_01_q0_nowriter_nowriter.report.txt -o atropos/8_01_q0_nowriter.1.fq.gz -p atropos/8_01_q0_nowriter.2.fq.gz --log-level ERROR --quiet --no-writer-process $ATROPOS_ROOT/data/simulated/sim_01.1.fq $ATROPOS_ROOT/data/simulated/sim_01.2.fq
echo SeqPurge 8_01_q0
/usr/bin/time -p $ATROPOS_ROOT/software/bin/SeqPurge -in1 $ATROPOS_ROOT/data/simulated/sim_01.1.fq -in2 $ATROPOS_ROOT/data/simulated/sim_01.2.fq -out1 seqpurge/8_01_q0.1.fq.gz -out2 seqpurge/8_01_q0.2.fq.gz -a1 AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -threads 8 -qcut 0 -ncut 0 -min_len 25 -prefetch 5000 -match_perc 0.9 -summary seqpurge/8_01_q0.summary
echo Skewer 8_01_q0
/usr/bin/time -p $ATROPOS_ROOT/software/bin/skewer -m pe -l 25 -k 7 -o skewer/8_01_q0 -z -x AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -y AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -t 8 -q 0  $ATROPOS_ROOT/data/simulated/sim_01.1.fq $ATROPOS_ROOT/data/simulated/sim_01.2.fq >> skewer/8_01_q0.summary.txt
echo Atropos 8_01_q20_writercomp
/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 20 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_01_q20_writercomp_writer.report.txt -o atropos/8_01_q20_writercomp.1.fq.gz -p atropos/8_01_q20_writercomp.2.fq.gz --log-level ERROR --quiet --compression writer $ATROPOS_ROOT/data/simulated/sim_01.1.fq $ATROPOS_ROOT/data/simulated/sim_01.2.fq
#echo Atropos 8_01_q20_workercomp
#/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 20 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_01_q20_workercomp_nowriter.report.txt -o atropos/8_01_q20_workercomp.1.fq.gz -p atropos/8_01_q20_workercomp.2.fq.gz --log-level ERROR --quiet --compression worker $ATROPOS_ROOT/data/simulated/sim_01.1.fq $ATROPOS_ROOT/data/simulated/sim_01.2.fq
echo Atropos 8_01_q20_nowriter
/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 20 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_01_q20_nowriter_nowriter.report.txt -o atropos/8_01_q20_nowriter.1.fq.gz -p atropos/8_01_q20_nowriter.2.fq.gz --log-level ERROR --quiet --no-writer-process $ATROPOS_ROOT/data/simulated/sim_01.1.fq $ATROPOS_ROOT/data/simulated/sim_01.2.fq
echo SeqPurge 8_01_q20
/usr/bin/time -p $ATROPOS_ROOT/software/bin/SeqPurge -in1 $ATROPOS_ROOT/data/simulated/sim_01.1.fq -in2 $ATROPOS_ROOT/data/simulated/sim_01.2.fq -out1 seqpurge/8_01_q20.1.fq.gz -out2 seqpurge/8_01_q20.2.fq.gz -a1 AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -threads 8 -qcut 20 -ncut 7 -min_len 25 -prefetch 5000 -match_perc 0.9 -summary seqpurge/8_01_q20.summary
echo Skewer 8_01_q20
/usr/bin/time -p $ATROPOS_ROOT/software/bin/skewer -m pe -l 25 -k 7 -o skewer/8_01_q20 -z -x AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -y AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -t 8 -q 20 -n $ATROPOS_ROOT/data/simulated/sim_01.1.fq $ATROPOS_ROOT/data/simulated/sim_01.2.fq >> skewer/8_01_q20.summary.txt
echo Atropos 8_real_q0_writercomp
/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 0 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_real_q0_writercomp_writer.report.txt -o atropos/8_real_q0_writercomp.1.fq.gz -p atropos/8_real_q0_writercomp.2.fq.gz --log-level ERROR --quiet --compression writer $ATROPOS_ROOT/data/real/NA12878_03_AACGTGAT_L001_R1_001.fastq.gz $ATROPOS_ROOT/data/real/NA12878_03_AACGTGAT_L001_R2_001.fastq.gz
#echo Atropos 8_real_q0_workercomp
#/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 0 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_real_q0_workercomp_nowriter.report.txt -o atropos/8_real_q0_workercomp.1.fq.gz -p atropos/8_real_q0_workercomp.2.fq.gz --log-level ERROR --quiet --compression worker $ATROPOS_ROOT/data/real/NA12878_03_AACGTGAT_L001_R1_001.fastq.gz $ATROPOS_ROOT/data/real/NA12878_03_AACGTGAT_L001_R2_001.fastq.gz
echo Atropos 8_real_q0_nowriter
/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 0 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_real_q0_nowriter_nowriter.report.txt -o atropos/8_real_q0_nowriter.1.fq.gz -p atropos/8_real_q0_nowriter.2.fq.gz --log-level ERROR --quiet --no-writer-process $ATROPOS_ROOT/data/real/NA12878_03_AACGTGAT_L001_R1_001.fastq.gz $ATROPOS_ROOT/data/real/NA12878_03_AACGTGAT_L001_R2_001.fastq.gz
echo SeqPurge 8_real_q0
/usr/bin/time -p $ATROPOS_ROOT/software/bin/SeqPurge -in1 $ATROPOS_ROOT/data/real/NA12878_03_AACGTGAT_L001_R1_001.fastq.gz -in2 $ATROPOS_ROOT/data/real/NA12878_03_AACGTGAT_L001_R2_001.fastq.gz -out1 seqpurge/8_real_q0.1.fq.gz -out2 seqpurge/8_real_q0.2.fq.gz -a1 AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -threads 8 -qcut 0 -ncut 0 -min_len 25 -prefetch 5000 -match_perc 0.9 -summary seqpurge/8_real_q0.summary
echo Skewer 8_real_q0
/usr/bin/time -p $ATROPOS_ROOT/software/bin/skewer -m pe -l 25 -k 7 -o skewer/8_real_q0 -z -x AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -y AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -t 8 -q 0  $ATROPOS_ROOT/data/real/NA12878_03_AACGTGAT_L001_R1_001.fastq.gz $ATROPOS_ROOT/data/real/NA12878_03_AACGTGAT_L001_R2_001.fastq.gz >> skewer/8_real_q0.summary.txt
echo Atropos 8_real_q20_writercomp
/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 20 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_real_q20_writercomp_writer.report.txt -o atropos/8_real_q20_writercomp.1.fq.gz -p atropos/8_real_q20_writercomp.2.fq.gz --log-level ERROR --quiet --compression writer $ATROPOS_ROOT/data/real/NA12878_03_AACGTGAT_L001_R1_001.fastq.gz $ATROPOS_ROOT/data/real/NA12878_03_AACGTGAT_L001_R2_001.fastq.gz
#echo Atropos 8_real_q20_workercomp
#/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 20 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_real_q20_workercomp_nowriter.report.txt -o atropos/8_real_q20_workercomp.1.fq.gz -p atropos/8_real_q20_workercomp.2.fq.gz --log-level ERROR --quiet --compression worker $ATROPOS_ROOT/data/real/NA12878_03_AACGTGAT_L001_R1_001.fastq.gz $ATROPOS_ROOT/data/real/NA12878_03_AACGTGAT_L001_R2_001.fastq.gz
echo Atropos 8_real_q20_nowriter
/usr/bin/time -p atropos -T 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -O 7 -q 20 --trim-n -m 25 --batch-size 5000  --report-file atropos/8_real_q20_nowriter_nowriter.report.txt -o atropos/8_real_q20_nowriter.1.fq.gz -p atropos/8_real_q20_nowriter.2.fq.gz --log-level ERROR --quiet --no-writer-process $ATROPOS_ROOT/data/real/NA12878_03_AACGTGAT_L001_R1_001.fastq.gz $ATROPOS_ROOT/data/real/NA12878_03_AACGTGAT_L001_R2_001.fastq.gz
echo SeqPurge 8_real_q20
/usr/bin/time -p $ATROPOS_ROOT/software/bin/SeqPurge -in1 $ATROPOS_ROOT/data/real/NA12878_03_AACGTGAT_L001_R1_001.fastq.gz -in2 $ATROPOS_ROOT/data/real/NA12878_03_AACGTGAT_L001_R2_001.fastq.gz -out1 seqpurge/8_real_q20.1.fq.gz -out2 seqpurge/8_real_q20.2.fq.gz -a1 AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -threads 8 -qcut 20 -ncut 7 -min_len 25 -prefetch 5000 -match_perc 0.9 -summary seqpurge/8_real_q20.summary
echo Skewer 8_real_q20
/usr/bin/time -p $ATROPOS_ROOT/software/bin/skewer -m pe -l 25 -k 7 -o skewer/8_real_q20 -z -x AGATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -y AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -t 8 -q 20 -n $ATROPOS_ROOT/data/real/NA12878_03_AACGTGAT_L001_R1_001.fastq.gz $ATROPOS_ROOT/data/real/NA12878_03_AACGTGAT_L001_R2_001.fastq.gz >> skewer/8_real_q20.summary.txt
