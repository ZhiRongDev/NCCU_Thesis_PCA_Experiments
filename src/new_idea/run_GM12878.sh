# #!/usr/bin/bash

# CELL_LINE="GM12878"
# NORM="KR"
# TYPE="BP"
# RESOLUTION=25000
# HIC_PATH="/media/jordan990301/Samsung_T5/HiC_Datasets/Rao_2014/GM12878/MAPQGE30/GSE63525_GM12878_insitu_primary_replicate_combined_30.hic"
# OUTPUT_PATH="/media/jordan990301/Samsung_T5/HiC_Datasets/juicer_outputs/$CELL_LINE/25Kb"
# JUICER_TOOLS_PATH="/home/jordan990301/PCA_Experiments/juicer/juicer_tools.jar"

# # mkdir -p "/media/jordan990301/Samsung_T5/HiC_Datasets/juicer_outputs/$CELL_LINE/25Kb"

# for CHROM in 1
# do
# echo "====== $CELL_LINE $RESOLUTION Chr$CHROM Pearson start ======"
# java -Xmx13824m -Xms13824m -jar $JUICER_TOOLS_PATH pearsons $NORM $HIC_PATH $CHROM $TYPE $RESOLUTION $OUTPUT_PATH/pearson_chr$CHROM.txt -p
# echo "====== $CELL_LINE $RESOLUTION Chr$CHROM PC1 start ======"
# java -Xmx13824m -Xms13824m -jar $JUICER_TOOLS_PATH eigenvector $NORM $HIC_PATH $CHROM $TYPE $RESOLUTION $OUTPUT_PATH/pc1_chr$CHROM.txt -p
# echo "====== End ======"
# done

# ### Notes: 2024/01/11 Accidentaly overwrite the results of chr1 by chr4.
# ### Notes: 2024/01/12 All Chromosome in GM12878 done.

