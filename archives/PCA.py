import numpy as np
import pandas as pd
import hicstraw
from sklearn.decomposition import PCA
from numpy import dot
from numpy.linalg import norm

hic_path = "/home/jordan990301/PCA_Experiments/data/Rao2014/GM12878/MAPQGE30/GSE63525_GM12878_insitu_primary_replicate_combined_30.hic"
input_path = "/home/jordan990301/PCA_Experiments/outputs/juicer/origin"
output_path = "/home/jordan990301/PCA_Experiments/outputs/juicer"

hic = hicstraw.HiCFile(hic_path)
chrom_list= []

chrom_info = {
    "Chromosome": [],
    "Explained_Variance_PC1": [],
    "Explained_Variance_PC2": [],
    "Explained_Variance_PC3": [],
    "Sum_PC1_PC2": [],
    "Cosine_Similarity": []
}
output_df = pd.DataFrame(chrom_info)

for chrom in hic.getChromosomes():
    if (chrom.name != "All" and chrom.name != "MT"):
        chrom_list.append(chrom.name)

for chrom in chrom_list:
    # print("=================================")
    # print(f"chrom{chrom}")

    ### Calculate from juicer_tools
    pearson_df = pd.read_table(f"{input_path}/origin_pearson_chrom{chrom}.txt", header=None, sep=" ")
    pearson_df.pop(pearson_df.columns[-1])

    pearson_df = pearson_df.dropna(axis=0, how="all").reset_index(drop=True)
    pearson_df = pearson_df.dropna(axis=1, how="all")

    numpy_pearson_df = pearson_df.values
    pearson_df = pd.DataFrame(numpy_pearson_df)

    # ### Calc PCA
    pca = PCA(n_components=len(pearson_df[0]))
    pca.fit(pearson_df)

    # Percentage of variance explained by each of the selected components.
    # print(f"Percentage of variance explained (PC1~PC3)")
    # print(pca.explained_variance_ratio_[0]) 
    # print(pca.explained_variance_ratio_[1]) 
    # print(pca.explained_variance_ratio_[2])

    My_PC1 = pca.components_[0]
    np.savetxt(f'{output_path}/My_PC1/My_PC1_chrom{chrom}.txt', My_PC1, delimiter='\n', fmt='%1.4f')

    Juicer_PC1 = pd.read_table(f"{input_path}/origin_pc1_chrom{chrom}.txt", header=None, sep=" ")
    Juicer_PC1 = Juicer_PC1.dropna(axis=0, how="all").reset_index(drop=True)
    Juicer_PC1 = Juicer_PC1[0]
    Juicer_PC1 = Juicer_PC1.to_numpy()
    np.savetxt(f'{output_path}/origin_dropna/origin_dropna_PC1_chrom{chrom}.txt', Juicer_PC1, delimiter='\n', fmt='%1.4f')

    cos_sim = dot(My_PC1, Juicer_PC1) / (norm(My_PC1) * norm(Juicer_PC1))
    corr_coef = np.corrcoef(My_PC1, Juicer_PC1)
    # print("\ncos_sim:")
    # print(cos_sim)
    # print("\ncorr_coef:")
    # print(corr_coef)

    My_PC1_Pos = My_PC1 > 0
    Juicer_PC1_Pos = Juicer_PC1 > 0

    PC1_Difference_Count = 0
    for i in range(My_PC1_Pos.shape[0]):
        # print(i, My_PC1_Pos[i])
        if(My_PC1_Pos[i] != Juicer_PC1_Pos[i]):
            PC1_Difference_Count += 1

    if(cos_sim < 0):
        PC1_Difference_Count = My_PC1_Pos.shape[0] - PC1_Difference_Count

    # print("\nTotal entries")
    # print(My_PC1_Pos.shape[0])
    # print("\nPC1_Difference_Count")
    # print(PC1_Difference_Count)

    output_df.loc[len(output_df.index)] = [
        chrom, 
        pca.explained_variance_ratio_[0],
        pca.explained_variance_ratio_[1],
        pca.explained_variance_ratio_[2],
        pca.explained_variance_ratio_[0] + pca.explained_variance_ratio_[1],
        cos_sim
    ] 

print(output_df)

