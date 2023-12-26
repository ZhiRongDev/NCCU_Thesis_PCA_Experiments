#!/usr/bin/bash

NORM="KR"
TYPE="BP"
RESOLUTION=100000
HIC_PATH="/media/jordan990301/Samsung_T5/HiC_Datasets/Rao_2014/K562/MAPQGE30/GSE63525_K562_combined_30.hic"
OUTPUT_PATH="/home/jordan990301/PCA_Experiments/outputs/K562/100Kb"
JUICER_TOOLS_PATH="/home/jordan990301/PCA_Experiments/juicer/juicer_tools.jar"

mkdir -p /home/jordan990301/PCA_Experiments/outputs/K562/100Kb/origin
mkdir -p /home/jordan990301/PCA_Experiments/outputs/K562/100Kb/origin_dropna
mkdir -p /home/jordan990301/PCA_Experiments/outputs/K562/100Kb/My_PC1

for CHROM in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 "X" "Y"
do
java -jar $JUICER_TOOLS_PATH pearsons $NORM $HIC_PATH $CHROM $TYPE $RESOLUTION $OUTPUT_PATH/origin/origin_pearson_chrom$CHROM.txt -p
java -jar $JUICER_TOOLS_PATH eigenvector $NORM $HIC_PATH $CHROM $TYPE $RESOLUTION $OUTPUT_PATH/origin/origin_pc1_chrom$CHROM.txt -p
done