#!/usr/bin/bash

CELL_LINE="K562"
NORM="KR"
TYPE="BP"
RESOLUTION=25000
HIC_PATH="/media/jordan990301/Samsung_T5/HiC_Datasets/Rao_2014/K562/MAPQGE30/GSE63525_K562_combined_30.hic"
OUTPUT_PATH="/media/jordan990301/Samsung_T5/HiC_Datasets/juicer_outputs/$CELL_LINE/25Kb"
JUICER_TOOLS_PATH="/home/jordan990301/PCA_Experiments/juicer/juicer_tools.jar"

mkdir -p "/media/jordan990301/Samsung_T5/HiC_Datasets/juicer_outputs/$CELL_LINE/25Kb"

for CHROM in 5 4 3 2 1 
do
echo "====== $CELL_LINE $RESOLUTION Chr$CHROM Pearson start ======" 2>&1 | tee -a /home/jordan990301/PCA_Experiments/outputs/run_K562.log
java -Xmx13824m -Xms13824m -jar $JUICER_TOOLS_PATH pearsons $NORM $HIC_PATH $CHROM $TYPE $RESOLUTION $OUTPUT_PATH/pearson_chr$CHROM.txt -p 2>&1 | tee -a /home/jordan990301/PCA_Experiments/outputs/run_K562.log
echo "====== Pearson End ======" 2>&1 | tee -a /home/jordan990301/PCA_Experiments/outputs/run_K562.log

echo "====== $CELL_LINE $RESOLUTION Chr$CHROM PC1 start ======" 2>&1 | tee -a /home/jordan990301/PCA_Experiments/outputs/run_K562.log
java -Xmx13824m -Xms13824m -jar $JUICER_TOOLS_PATH eigenvector $NORM $HIC_PATH $CHROM $TYPE $RESOLUTION $OUTPUT_PATH/pc1_chr$CHROM.txt -p 2>&1 | tee -a /home/jordan990301/PCA_Experiments/outputs/run_K562.log
echo "====== PC1 End ======" 2>&1 | tee -a /home/jordan990301/PCA_Experiments/outputs/run_K562.log
done