#!/bin/bash
set -euo pipefail

# QIIME Tutorial 2 https://github.com/edamame-course/Amplicon_Analysis/blob/master/final/2016-07-13-QIIME2.md
## 2.1 Summarize an OTU table
cd EDAMAME_16S/uclust_openref/
biom summarize-table -i otu_table_mc2_w_tax.biom -o summary_otu_table_mc2_w_tax.txt
#less summary_otu_table_mc2_w_tax.txt
## 2.2 Rarefaction (subsampling)
single_rarefaction.py -i otu_table_mc2_w_tax.biom -o otu_table_mc2_w_tax_even5196.biom -d 5196
biom summarize-table -i otu_table_mc2_w_tax_even5196.biom -o summary_otu_table_mc2_w_tax_even5196.txt
head summary_otu_table_mc2_w_tax_even5196.txt
## 2.3 Calculating within-sample (alpha) diversity
mkdir WS_aDiversity_even5196
alpha_diversity.py -i otu_table_mc2_w_tax_even5196.biom -m observed_species,PD_whole_tree -o WS_aDiversity_even5196/WS_aDiversity_even5196.txt -t rep_set.tre
head WS_aDiversity_even5196/WS_aDiversity_even5196.txt
alpha_diversity.py -s
## 2.4 Visualizing within-sample diversity
summarize_taxa_through_plots.py -o WS_aDiversity_even5196/taxa_summary5196/ -i otu_table_mc2_w_tax_even5196.biom  

# Print operating system characteristics
uname -a
python -V # python --version

echo "[$(date)] $0 has been successfully completed."

: <<'#__COMMENT_OUT__'

(time bash run.2016-07-13-QIIME2.sh &) >& log.2016-07-13-QIIME2.txt

#__COMMENT_OUT__
