HIC_PATH="/home/jordan990301/PCA_Experiments/data/Rao2014/samples/GSM1551550_HIC001.hic"
OUTPUT_PATH="/home/jordan990301/PCA_Experiments/data/outputs/juicer"
JUICER_TOOLS_PATH="/home/jordan990301/PCA_Experiments/juicer/juicer_tools.jar"

java -jar $JUICER_TOOLS_PATH pearsons KR $HIC_PATH 1 BP 1000000 $OUTPUT_PATH/pearsons.txt
java -jar $JUICER_TOOLS_PATH eigenvector KR $HIC_PATH 1 BP 1000000 $OUTPUT_PATH/eigen.txt
