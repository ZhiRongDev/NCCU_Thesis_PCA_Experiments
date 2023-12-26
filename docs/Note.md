# Meeting 2023/12/06

## Discussion

* 把 PCA 實驗整理成 xlsx, 使用 Rao 2014 提供的 GM12878, K562 這兩個 Cell line 的 .hic

  理由:
  * Lieberman-Aiden 2009, GSE18199_readme_v4.txt 提到:
  > For GM12878 cells at 1 Mb resolution, the first eigenvector corresponds to the compartmental structure for all chromosomes except 4 and 5, where the second eigenvector is used. At 100 Kb resolution, the first eigenvector is used for all but chomosomes 2 and 10. For K562 cells, the first eigenvector is always used.
  * MOSAIC, 2022 也是測 GM12878, K562, 它是延伸 Victor Corces, 2021 的實驗, 研究 PC1, PC2 以及 H3K27ac, H3K27me3, H3K9me3 的關係 (Victor Corces 比較探討 inactive H3K9me3 的影響)

  Victor Corces, 2021
  > H3K27ac, which is correlated with transcriptional activity, H3K27me3, which is correlated with transcriptional silencing, and H3K9me3, which is also correlated with transcriptionally inactive sequences.

  MOSAIC, 2022
  > While EV1 showed the strongest correlation with active histone marks as known, we found that the second EV (EV2) strongly correlated with H3K27me3.

* 表格: MAPQGE30, Resolution 1Mb, 100Kb (GSE63525_GM12878_insitu_primary+replicate_combined_30.hic, GSE63525_K562_combined_30.hic)

Rao 2014 提出 in situ Hi-C, 我理解的 combined 是指把相關實驗的 hic library samples 合併成一份 (根據各資料的 .rtf 說明, HICxxx)。另外 GM12878 in situ 實驗有分成 primary map 和 replicate map 做對比，但不是很確定為什麼可以 combined 成一份。

* 實驗結果 1Mb
  * GM12878 的 PC1 explained variance, 使用 HIC001 sample 和完整的 combined_30.hic 相比結果沒有差太多(Chr4, Chr5)
  * K562 explained variance 看不出來 Chr2, Chr10 的 PC1 explained variance 有比較小(都蠻高的)。
* 實驗結果 100Kb
  * 提高 Resolution 後不管是 GM12878 或 K562，它們的 PC1 explained variance 都變高

* 結論
  * K562 從 explained variance 看不出來 Chr2, Chr10 問題
  * Juicebox 無法在 100Kb 顯示 Eigenvectors track 對應 compartment pattern
  * 還沒搞懂要怎麼看 PC1 是表示 A/B Compartments, 或是表示 p/q chromosome arms

## Notes

### Rao 2014 (GSE63525)

======================
'''
Human * 8
B-lymphoblastoid cells(GM12878)
germ layers (IMR90, HMEC, NHEK, K562, HUVEC, HeLa, KBM7)

mouse * 1
B-lymphoblasts (CH12-LX)
'''

* Read the Rao_2014-Supplement.pdf page 18

> In this paper, we report the results of 201 Hi-C experiments. To produce most of the libraries reported in this paper, we employed in situ Hi-C. Several additional libraries were generated using variants of in situ Hi-C. Still other libraries were generated using the original “dilution” Hi-C protocol (Lieberman-Aiden et al., 2009). The contact maps produced by Hi-C are extremely robust to changes in the protocol, except as described below and in the main text (see Data S1.I.A).

======================

### Rao 2017 (GSE104333)

GM12878_combined_30 = HIC001~HIC029 (primary + replicate)

======================

### Lieberman-Aiden 2009

GSE18199_readme_v4.txt

> For GM12878 cells at 1 Mb resolution, the first eigenvector corresponds to the compartmental structure for all chromosomes except 4 and 5, where the second eigenvector is used. At 100 Kb resolution, the first eigenvector is used for all but chomosomes 2 and 10. For K562 cells, the first eigenvector is always used.

https://ftp.ncbi.nlm.nih.gov/geo/series/GSE18nnn/GSE18199/suppl/GSE18199%5Freadme%5Fv4.txt



### Todo

* Use the IGB Visualization tools to check whether we can check the relationship between EV and contact map under the resolution of 100Kb.
* It seems that the explained variance in different resilution can't always be used to explain the reason why we have to use different PC signal the distinguish chromosome compartment. 
* 
* Master thesis: By intuition, the compartmentantal pattern should be same in different resolution. Find out the reason why we sometimes need to use different signal to distinguish AB compartments.

