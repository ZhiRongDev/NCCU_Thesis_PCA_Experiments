# #!/usr/bin/bash
# CELL_LINE="GM12878"
# NORM="KR"
# TYPE="BP"
# RESOLUTION=25000
# HIC_PATH="/media/jordan990301/Samsung_T5/HiC_Datasets/Rao_2014/GM12878/MAPQGE30/GSE63525_GM12878_insitu_primary_replicate_combined_30.hic"
# OUTPUT_PATH="/media/jordan990301/Samsung_T5/HiC_Datasets/juicer_outputs/$CELL_LINE/25Kb"
# JUICER_TOOLS_PATH="/home/jordan990301/PCA_Experiments/juicer/juicer_tools.jar"

# mkdir -p "/media/jordan990301/Samsung_T5/HiC_Datasets/juicer_outputs/$CELL_LINE/25Kb"

# CHROM=1
# java -jar $JUICER_TOOLS_PATH eigenvector $NORM $HIC_PATH $CHROM $TYPE $RESOLUTION $OUTPUT_PATH/pc1_chr$CHROM.txt -p