# ITR 4: Clustering/Dimension Reduction
### Large-Scale Data Mining for Social and Cultural Knowledge Discovery  
**Author:** Amrita Pathak  
**Course:** MACS 40123  

---

## Overview  

This builds up on the previously submitted ITR (ITR 1 and ITR-3). Please refer to the `itr4.py` jupyter notebook for the methodology, outcome and analysis.

---

## 1. Literature Review: Recent Advances in Clustering/Dimension Reduction

The following three works show that clustering and dimensionality reduction are key to analysing complex and high dimensional financial data and behaviour.

### Risk Measures-Based Cluster Methods for Finance (Guedes et al., 2023)

This study compares five different clustering techniques using US Equity data across various tasks such as portfolio optimisation, capital determination and asset pricing. The authors argue that K-means, and similar clustering algorithms, can accurately cluster assets based on similar risk-return characteristics. These algorithms are also capable of producing tigher clusters during periods of crises such as 2008 and 2015. This work illustrates how clustering can capture stocks co-moving during crises, which could also be applied to online investors clustering due to shared discourse.

### An Integrated Cluster Detection, Optimization, and Interpretation Approach for Financial Data (Li et al., 2022)

In this paper, the authors introduce a integrated clustering framework to detect, optimize and interpret structure of complex financial data. They introduce a new cluster quality criterion to enhance K-means, by leveraging the idea that financial datasets often exhibit correlated high dimensional distrubutions. The resulting model is capable of detecting hyperellipsoidal clusters, which the authors deem to be a better fit for financial data than spherical K-means partitions. The model, tested on ten large financial datasets, generates grouping capable for fraud detection, credit scoring and identifying anomalies. This study shows how clustering can identify meaningful subpatterns within noisy data.

### Advanced Machine Learning for Financial Markets: A PCA-GRU-LSTM Approach (Liu & Lai, 2024)

Liu and Lai propose a hybrid machine learning model, which integrates environmental data such as air pollution indicators with financial data to capture broad factors affecting investor sentiments. The model is built by combining Principal Component Analysis (PCA), Gated Recurrent Units (GRU), and Long Short-Term Memory (LSTM) networks. Liu and Lai show that dimensionality reduction is a vital component for managing complex data, as in this study, PCA is used to discover latent relationships between variables, while reducing noise and computation. This shows how PCA can reduce multiple noisy features into essential dimensions, essential for working with high dimensional data such as textual reddit data.

## 3. Reflection on Social and Cultural Implications

This analysis reveals how behavior of investors part of online communities can be understood as a form of digital herding and social coordination. PCA reduces the high dimensional and noisy textual data into a few dominant axes that represnt emotional orientations and shared discussions. This highlights how participation is driven more by certain themes, suggesting that individual sentiment is structured around collective narratives. The clusters identified by K-means show behavorial differences - for example, one cluster centers around speculative discourse, while another emphasises analytical and data driven strategies. These groups mirror the sociological theories that identity and belonging are formed around shared language and ideology rather than traditional institutions.

Culturally, these findings support the view that online financial communities lead to an emotionally and collectively driven act. This challenges the classical theories of independent investors, aligning with digital behavorial and cultural studies that emphasise on collective identity. This analysis shows that chaotic online discourse can be filtered down to coherent structures, and how individual economic behaviour is now deeply intertwined with digital financial ecosystems.

## References

- Li, T., Kou, G., Peng, Y., & Yu, P. S. (2022). An integrated cluster detection, optimization, and interpretation approach for financial data. IEEE Transactions on Cybernetics, 52(12), 13848–13861. https://doi.org/10.1109/TCYB.2021.3109066

- Liu, B., & Lai, M. (2025). Advanced machine learning for financial markets: A PCA-GRU-LSTM approach. Journal of the Knowledge Economy, 16, 3140–3174. https://doi.org/10.1007/s13132-024-02108-3

- Guedes, P. C., Müller, F. M., & Righi, M. B. (2023). Risk measures-based cluster methods for finance. Risk Management, 25(4). https://doi.org/10.1057/s41283-022-00110-0

## Acknowledgment

Portions of this README file were organized and edited with the assistance of **ChatGPT (GPT-5, OpenAI, 2025)**, used to help structure and refine. All analyses, interpretations, and final edits were performed by the author.
