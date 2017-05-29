#!/bin/bash
set -euo pipefail

# Intro to QIIME for amplicon analysis https://github.com/edamame-course/Amplicon_Analysis/blob/master/final/2016-07-13-QIIME1.md
## 1.1 Getting started
wget https://s3.amazonaws.com/edamame/EDAMAME_16S.tar.gz
tar -zxvf EDAMAME_16S.tar.gz
cd EDAMAME_16S/Fastq
## 1.2 Assembling Illumina paired-end sequences
### 1.2.3 Automate paired-end merging with a shell script.
curl -O https://raw.githubusercontent.com/edamame-course/Amplicon_Analysis/master/resources/Merged_Reads_Script.sh
curl -O https://raw.githubusercontent.com/edamame-course/Amplicon_Analysis/master/resources/list.txt
mkdir Merged_Reads
chmod 755 Merged_Reads_Script.sh
date
./Merged_Reads_Script.sh # 15m
date
### 1.2.4 Sanity check #2.
ls -1 Merged_Reads | wc -l
mv Merged_Reads ..
## 1.3 Understanding the QIIME mapping file
cd ../MappingFiles/
head -n 2 Centralia_Full_Map.txt
## 1.4 Getting assembled reads into the one big ol' data file, and extracting summary information
cd ..
add_qiime_labels.py -i Merged_Reads/ -m MappingFiles/Centralia_Full_Map.txt -c InputFastaFileName -n 1
head combined_seqs.fna
count_seqs.py -i combined_seqs.fna
#mothur
#mothur > summary.seqs(fasta=combined_seqs.fna)
#mothur > quit()
## 1.5 Picking Operational Taxonomic Units, OTUs.
### 1.5.1 Preamble
### 1.5.2 OTU picking
echo -n "[`date`] "; pwd
pick_open_reference_otus.py -i combined_seqs.fna -o uclust_openref/ -f
date
### 1.5.3 Exploring results from OTU picking workflow
cd uclust_openref/
#find . -name "rep_set_failures.fasta" | xargs -I{} count_seqs.py -i {}
count_seqs.py -i pynast_aligned_seqs/rep_set_failures.fasta
#less uclust_assigned_taxonomy/rep_set_tax_assignments.txt
#less final_otu_map.txt
#less rep_set.fna
#less rep_set.tre

# Print operating system characteristics
uname -a
python -V # python --version

echo "[$(date)] $0 has been successfully completed."

: <<'#__COMMENT_OUT__'

### 1.2.1 Assembling paired-end reads.
join_paired_ends.py -f C01D01F_sub.fastq -r C01D01R_sub.fastq -o C01D01
### 1.2.2 Sanity check and file inspection. 
cd C01D01
ls -lah
head fastqjoin.join.fastq
grep  '@HWI' fastqjoin.join.fastq | wc -l
grep '@HWI' ../C01D01F_sub.fastq | wc -l
grep '@HWI' fastqjoin.join.fastq > C01D01_MergedHeaders.txt
head C01D01_MergedHeaders.txt
wc -l C01D01_MergedHeaders.txt
cd ..
rm -r C01D01

(time bash run.2016-07-13-QIIME1.sh &) >& log.2016-07-13-QIIME1.txt

#__COMMENT_OUT__
