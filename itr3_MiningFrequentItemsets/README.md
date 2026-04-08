# ITR 3: Mining Frequent Itemsets
### Large-Scale Data Mining for Social and Cultural Knowledge Discovery  
**Author:** Amrita Pathak  
**Course:** MACS 40123  

---

## Overview  

This builds up on the previously submitted ITR (ITR-1). Please refer to the `itr3.py` jupyter notebook for the methodology, outcome and analysis.

---

## 1. Literature Review: Recent Advances in Mining frequent itemsets

Three recent peer-reviewed studies exemplify these developments and directly inform the methods used in this repository.

### Android Malware Detection by Correlated Real Permission Couples Using FP Growth Algorithm and Neural Networks (Banik and Singh, 2023)

In Banik and Singh (2023), the authors extract "real" app permissions by reverse engineering APK files, and use the FP-Growth algorithm to detect malware by identifying frequent correlated pairs of these permissions. The algorithm efficiently discovers permission pairs that occur frequently in malware but rarely in benign apps. This acts as a discriminative input to a neural network classifier, which then achieves over 96% accuracy on the classification task. This shows FP-Growth algorithm's capacity for handling large, sparse datasets, making it suitable for data mining.

### Improving the Feature Set in IoT Intrusion Detection Problem Based on FP-Growth Algorithm (Le Thi Hong Van et al., 2020)

This research is aimed at using FP-Growth to enhance IoT Intrusion Detection. The methodology used involves using associative features, created using the rules extracted by the FP-Growth algorithm, and then testing them in a CNN-based intrusion classifier. This results in a accuracy gain of about 1.45% (98.2% total).

### Comparison Of Market Basket Analysis To Determine Consumer Purchasing Patterns Using FpGrowth And Apriori Algorithm (Ahmad Ari Aldino et al., 2021)

Aldino et al. compare the FP-Growth and Apriori algorithms on transactional data used to determine consumer purchasing patterns. FP-Growth generates more associative rules than Apriori, does so with higher accuracy and in less time (6s vs 30s). This confirms the scalability of the algorithm for use with large datasets.

---

## 3. Reflection on Social and Cultural Implications

The findings from this analysis tend to reveal how communities display structured cultural behaviours rather than random, individual actions. Each reddit post or comment can be considered as a social basket contining linguistic, emotional and ideological items. Applying techniques to find similar items from these baskets can show the frequent co-occurrences of ideas and cues within the community members.

Socially, these co-occurences demonstrate how finance-oriented communities tend to have a collective sense, and how emotional sentiments spread within the community. The frequent co-occurence of tickers, as demonstrated in the analysis, indicate that the community creates an investment narrative and identity. These patterns perfectly portray how digital crowds transform fragmented discussions to near ritualistic ideas, communicating belonging and togetherness.

This method also supports the theories of collective behavior and cultural diffusion. It shows how financial decision-making is developed through repeated and patterned combinations of emotion and language, rather than through individual choices. It indicates that trading discussions function as a cultural system, where identity and emotions co-evolve with the community's perceived idea of the market, challenging the traditional economic assumptions.

This analysis pushes my research question towards a structured understanding - that online traders act as more with a culture of collective sentiment, maintained by the community's association networks, than they do as isolated investors.

---

### References

- Banik, A., & Singh, J. P. (2023). Android Malware Detection by Correlated Real Permission Couples Using FP Growth Algorithm and Neural Networks. IEEE Access, 11, 124996–125004. https://doi.org/10.1109/ACCESS.2023.3323845

- Le Thi Hong Van, Pham Van Huong, Le Duc Thuan, & Nguyen Hieu Minh. (2020). Improving the Feature Set in IoT Intrusion Detection Problem Based on FP-Growth Algorithm. In Proceedings of the 2020 International Conference on Advanced Technologies for Communications (ATC) (pp. 18–21). IEEE. https://doi.org/10.1109/ATC50652.2020.9259813

- Aldino, A. A., Sintaro, S., Pratiwi, E. D., Putra, A. D., & Setiawansyah. (2021). Comparison of Market Basket Analysis to Determine Consumer Purchasing Patterns Using Fp-Growth and Apriori Algorithm. In Proceedings of the 2021 International Conference on Computer Science, Information Technology, and Electrical Engineering (ICOMITEE) (pp. 29–31). IEEE. https://doi.org/10.1109/ICOMITEE53461.2021.9650317

---

### Acknowledgment

Portions of this README file were organized and edited with the assistance of **ChatGPT (GPT-5, OpenAI, 2025)**, used to help structure and refine. All analyses, interpretations, and final edits were performed by the author.