# rm -rf /home/jordan990301/PCA_Experiments/data/outputs/juicer
# mkdir /home/jordan990301/PCA_Experiments/data/outputs/juicer
# mkdir /home/jordan990301/PCA_Experiments/data/outputs/juicer/origin

# HIC_PATH="/home/jordan990301/PCA_Experiments/data/Rao2014/samples/GSM1551550_HIC001.hic"
# OUTPUT_PATH="/home/jordan990301/PCA_Experiments/data/outputs/juicer"
# JUICER_TOOLS_PATH="/home/jordan990301/PCA_Experiments/juicer/juicer_tools.jar"
# NORM="KR"
# TYPE="BP"
# RESOLUTION=1000000

# for CHROM in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 "X" "Y"
# do
# java -jar $JUICER_TOOLS_PATH pearsons $NORM $HIC_PATH $CHROM $TYPE $RESOLUTION $OUTPUT_PATH/origin/origin_pearson_chrom$CHROM.txt -p
# java -jar $JUICER_TOOLS_PATH eigenvector $NORM $HIC_PATH $CHROM $TYPE $RESOLUTION $OUTPUT_PATH/origin/origin_pc1_chrom$CHROM.txt -p
# done