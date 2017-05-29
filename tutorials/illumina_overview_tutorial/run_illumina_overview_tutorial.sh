#!/bin/bash
set -e
set -u
#set -o pipefail

# Illumina Overview Tutorial IPython Notebook http://nbviewer.jupyter.org/github/biocore/qiime/blob/1.9.1/examples/ipynb/illumina_overview_tutorial.ipynb

echo "# Getting started"
(wget ftp://ftp.microbio.me/qiime/tutorial_files/moving_pictures_tutorial-1.9.0.tgz || curl -O ftp://ftp.microbio.me/qiime/tutorial_files/moving_pictures_tutorial-1.9.0.tgz)
tar -xzf moving_pictures_tutorial-1.9.0.tgz
cd moving_pictures_tutorial-1.9.0/illumina/

echo "# Check our mapping file for errors"
validate_mapping_file.py -o vmf-map/ -m map.tsv
validate_mapping_file.py -o vmf-map-bad/ -m map-bad.tsv

echo "# Demultiplexing and quality filtering sequences"
split_libraries_fastq.py -o slout/ -i forward_reads.fastq.gz -b barcodes.fastq.gz -m map.tsv
count_seqs.py -i slout/seqs.fna

echo "# OTU picking: using an open-reference OTU picking protocol by searching reads against the Greengenes database."
# This step can take about 10 minutes to complete.
pick_open_reference_otus.py -o otus/ -i slout/seqs.fna -p ../uc_fast_params.txt
biom summarize-table -i otus/otu_table_mc2_w_tax_no_pynast_failures.biom

echo "# Run diversity analyses"
# The commands in this section (combined) can take about 15 minutes to complete.
core_diversity_analyses.py -o cdout/ -i otus/otu_table_mc2_w_tax_no_pynast_failures.biom -m map.tsv -t otus/rep_set.tre -e 1114
core_diversity_analyses.py -o cdout/ --recover_from_failure -c "SampleType,DaysSinceExperimentStart" -i otus/otu_table_mc2_w_tax_no_pynast_failures.biom -m map.tsv -t otus/rep_set.tre -e 1114
make_emperor.py -i cdout/bdiv_even1114/weighted_unifrac_pc.txt -o cdout/bdiv_even1114/weighted_unifrac_emperor_pcoa_plot -m map.tsv --custom_axes DaysSinceExperimentStart 
make_emperor.py -i cdout/bdiv_even1114/unweighted_unifrac_pc.txt -o cdout/bdiv_even1114/unweighted_unifrac_emperor_pcoa_plot -m map.tsv --custom_axes DaysSinceExperimentStart 

# Print operating system characteristics
uname -a

echo "[$(date)] $0 has been successfully completed."

: <<'#__COMMENT_OUT__'
set -euo pipefail

(time bash run_illumina_overview_tutorial.sh &) >& log.illumina_overview_tutorial.txt

#__COMMENT_OUT__
