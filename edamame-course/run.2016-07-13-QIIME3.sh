#!/bin/bash
set -euo pipefail

# QIIME Tutorial 3: Comparative diversity https://github.com/edamame-course/Amplicon_Analysis/blob/master/final/2016-07-13-QIIME3.md
## 3.1 Make resemblance matrices to analyze comparative (beta) diversity
cd EDAMAME_16S/uclust_openref/
#curl -O https://raw.githubusercontent.com/edamame-course/Amplicon_Analysis/master/resources/otu_table_mc2_w_tax_even5196.biom
beta_diversity.py -s
beta_diversity.py -i otu_table_mc2_w_tax_even5196.biom -m unweighted_unifrac,weighted_unifrac,binary_sorensen_dice,bray_curtis -o compar_div_even5196/ -t rep_set.tre
ls compar_div_even5196/
## 3.2 Using QIIME for visualization: Ordination
principal_coordinates.py -i compar_div_even5196/ -o compar_div_even5196_PCoA/
ls compar_div_even5196_PCoA/
make_2d_plots.py -i compar_div_even5196_PCoA/pcoa_weighted_unifrac_otu_table_mc2_w_tax_even5196.txt -m ../MappingFiles/Centralia_Full_Map.txt -o PCoA_2D_plot/
## 3.3 Other visualizations in QIIME
mkdir NMDS_Plot
nmds.py -i compar_div_even5196/bray_curtis_otu_table_mc2_w_tax_even5196.txt -o NMDS_Plot/mc2_even5196_braycurtis_NMDS_coords.txt
head NMDS_Plot/mc2_even5196_braycurtis_NMDS_coords.txt
make_otu_heatmap.py -i WS_aDiversity_even5196/taxa_summary5196/otu_table_mc2_w_tax_even5196_L2.biom -o heatmap_L2_even5196.pdf
## 3.4 "Collapse" the biom table across DNA extraction replicates
collapse_samples.py -b otu_table_mc2_w_tax_even5196.biom -m ../MappingFiles/Centralia_Full_Map.txt --collapse_fields Sample --collapse_mode mean --output_biom_fp otu_table_mc2_w_tax_even5196_CollapseReps.biom --output_mapping_fp map_collapsed_reps.txt
## 3.5 Exporting the QIIME-created biom table for use in other software (R, Primer, Phinch, etc)
biom convert -i otu_table_mc2_w_tax_even5196_CollapseReps.biom -o otu_table_mc2_w_tax_even5196_CollapseReps.txt --table-type "OTU table" --to-tsv --header-key taxonomy --output-metadata-id "ConsensusLineage"

# YOU DID IT! HOLIDAY! CELEBRATE!

# Print operating system characteristics
uname -a
python -V # python --version

echo "[$(date)] $0 has been successfully completed."

: <<'#__COMMENT_OUT__'

(time bash run.2016-07-13-QIIME3.sh &) >& log.2016-07-13-QIIME3.txt

#__COMMENT_OUT__
