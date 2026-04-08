# ITR 1: Finding Similar Items  
### Large-Scale Data Mining for Social and Cultural Knowledge Discovery  
**Author:** Amrita Pathak  
**Course:** MACS 40123  

---

## Overview  

In this repository, I have worked on my data that I will hopefully use in my thesis - a representation of 
data for studying online trading discussions (e.g., Reddit’s *r/wallstreetbets*).  

The goal of this project is to analyze how **emotionally charged discussions reflect and shape financial decision-making** by combining lexicon-based sentiment methods with scalable text-mining techniques.

---

## 1. Methods Used Previously on this data:

Focuses on **sentiment exploration and preliminary data mining**.

- **Data Preprocessing:** Tokenization, stopword removal, and text normalization for Reddit post data.  
- **Sentiment Analysis (VADER):** Applied VADER to compute compound sentiment scores for each post.  
- **Exploratory Data Analysis (EDA):** Visualized sentiment distributions and engagement metrics (upvotes, comments).  
- **Correlation Analysis:** Compared emotional tone with engagement or simple market indicators.

### Outcome
This stage established the emotional foundation for the project, identifying **patterns of positivity, negativity, and engagement** in online discussions.  
However, the analysis remained limited to **surface-level sentiment** without exploring thematic or structural relationships between posts.

## 2. Methods Used in `itr1.ipynb`

The ITR notebook represents the **next step** in the analytical workflow — moving from exploratory sentiment analysis toward **scalable similarity mining** using Spark.  
Although still an iterative draft, it introduces a robust, distributed pipeline for identifying **linguistic and semantic similarity** between Reddit comments and submissions.

### Key Methods

- **Distributed Processing (Spark):**  
  Built a local `SparkSession` (`ITR1_amritap1`) with parallel executors and extended memory for handling large JSON Reddit datasets.

- **Data Cleaning & Normalization:**  
  Standardized both comment and submission datasets by:
  - Removing deleted/empty content and bot users.  
  - Converting timestamps and selecting essential columns.  
  - Combining both sources into a unified text frame with a `src` label.

- **Text Featurization (n-grams):**  
  Created 3-gram tokens using a pipeline of `RegexTokenizer`, `StopWordsRemover`, and `NGram`.  
  Two feature representations were built:
  1. **Binary CountVectorizer** (`binary=True`, `minDF=2`) for Jaccard set similarity.  
  2. **Frequency CountVectorizer** (`minDF=5`) for weighted, frequency-based features.

- **Approximate Jaccard Similarity via MinHash LSH:**  
  Used **MinHash Locality-Sensitive Hashing** to find pairs of comment–submission texts with overlapping 3-gram structures.  
  Produced distance distributions to identify high-overlap (low Jaccard distance) pairs.

- **Approximate Cosine Similarity via Euclidean LSH:**  
  Applied **HashingTF → IDF → Normalizer** to generate unit-length TF-IDF vectors.  
  Then used **BucketedRandomProjectionLSH** for efficient nearest-neighbor retrieval, approximating cosine similarity between posts.

- **Top-k Nearest Neighbor Retrieval:**  
  For each comment, retrieved the top 5 most similar submissions using approximate nearest neighbors (ANN) — both individually and in batch sampling mode.

### Outcome

This iteration produced a **scalable, dual-similarity pipeline**:
- **Set-based overlap (Jaccard)** identifies near-duplicate or thematically similar text fragments.
- **Semantic proximity (Cosine)** captures broader narrative or emotional alignment.

Outputs include:
- Candidate comment–submission pairs ranked by similarity.  
- Similarity distributions for threshold calibration.  
- Ready-to-use top-k neighbor mappings for future topic or emotion linking.

---

## 3. Interpreting Experimental Results in Relation to the Research Question

The central research question guiding this project asks how emotionally charged online trading discussions reflect and shape financial decision-making through shared language, narratives, and interaction patterns. While the experimental steps in `itr1.ipynb` are methodologically distinct, each contributes a complementary perspective on this question.

The MinHash LSH results using binary tri-grams reveal a large number of exact or near-exact matches between comments and submissions. Rather than indicating redundancy alone, this pattern suggests that emotionally salient phrases and short linguistic constructions are repeatedly reused across discussions. This supports the idea that sentiment and conviction in trading communities propagate through shared linguistic templates, such as slogans or recurring expressions, rather than through isolated, individual reasoning.

The shift to frequency-weighted tri-grams provides a more nuanced view of similarity by down-weighting ubiquitous tokens and emphasizing partial overlap. The emergence of a substantial set of moderately similar pairs indicates that discussions often share thematic framing even when exact wording differs. This finding aligns with the research goal of identifying collective narratives—such as optimism, fear, or risk tolerance—that shape how traders interpret and respond to market information.

Semantic similarity analysis using TF-IDF with Bucketed Random Projection LSH highlights an important methodological insight. The generally weak nearest-neighbor matches suggest that semantic alignment in large-scale social discourse is diffuse rather than concentrated in tight clusters. This result implies that collective behavior in trading forums may emerge from many weakly aligned interactions, rather than from a small number of highly influential posts.

Finally, the per-item and batch ANN analyses reinforce this interpretation. The lack of strong nearest neighbors at the individual level suggests that influence in these discussions is distributed across the community, motivating future analyses that focus on aggregation, clustering, or temporal dynamics rather than one-to-one matching.

Taken together, these results indicate that emotionally charged financial discourse operates through repeated linguistic cues and broad thematic resonance, rather than sharply defined semantic groupings. This interpretation directly advances the project’s broader aim of modeling online financial decision-making as a collective and culturally embedded process.

---

## 4. How the ITR Analysis Improves the Overall Workflow

The ITR notebook introduced methodological advances that directly strengthen the earlier exploratory analysis.  
It builds the foundation for moving from descriptive statistics to **large-scale relational text analysis**.

| Improvement | Description |
|--------------|-------------|
| **From Sentiment to Structure** | Goes beyond VADER polarity to measure linguistic similarity and textual relationships between posts. |
| **Feature Engineering Depth** | Implements binary and frequency n-gram vectors, enabling both overlap- and meaning-based similarity. |
| **Algorithmic Innovation** | Leverages MinHash and Random Projection LSH for scalable approximate matching. |
| **Scalability** | Runs efficiently on distributed computing environments (Midway), allowing near-real-time mining of large Reddit corpora. |
| **Interpretive Power** | Provides structural data (who says what, how often, and how similarly) that can feed into cultural or behavioral interpretations. |

---

## 5. How I Will Now Improve the Earlier analysis

The ITR experiment clarified both the **technical limits** and **expansion potential** of my earlier analysis.  
With these new methods, I can rebuild my data analysis into a more **integrated and multidimensional pipeline**.

---

## 6. Literature Review: Recent Advances in Locality-Sensitive Hashing (LSH)

Three recent peer-reviewed studies exemplify these developments and directly inform the methods used in this repository.

### 1. Learnable LSH for Video Anomaly Detection (Lu et al., 2023)

Lu et al. (2023) introduce **Learnable Locality-Sensitive Hashing (LLSH)** as an *end-to-end trainable neural framework* for 
**video anomaly detection (VAD)**. In contrast to fixed, random projection-based hashing, their approach embeds multiple 
*parametric hash layers* within a convolutional neural network (CNN) trained via *contrastive learning* (InfoNCE loss). 
This allows the model to learn data-driven hash functions that map semantically similar video snippets into proximate hash buckets 
while maintaining low-dimensional representations for efficient similarity computation. The method substantially reduces computational 
cost—cutting inference complexity by up to 88%—and achieves state-of-the-art anomaly detection accuracy across four benchmark datasets. 
Lu et al.’s work demonstrates how LSH can evolve from a purely algorithmic approximation tool into a **learnable representation mechanism** 
that captures semantic structure in high-dimensional data.

### 2. LSH for Efficient Rendezvous Search in IoT (Jiang & Chang, 2024)

Jiang and Chang (2024) apply LSH to a very different problem: the **multichannel rendezvous challenge** in Internet of Things (IoT) communication. 
By representing available communication channels as binary vectors and hashing them via LSH, their proposed algorithm probabilistically increases 
the likelihood of two devices synchronizing on a shared channel. Their approach leverages **Jaccard similarity** between users’ channel sets to minimize 
expected time-to-rendezvous (ETTR) and integrates dimensionality reduction and hybrid channel-hopping schemes to guarantee bounded maximum time-to-rendezvous (MTTR). 
The study reimagines LSH as a *communication coordination mechanism* that exploits set-level similarity rather than spatial proximity.

### 3. Refining Codes for LSH (Liu et al., 2024)

Liu et al. (2024) extend LSH research by proposing a **bit reduction and refinement framework** that enhances hash efficiency and code compactness. 
Their method, termed **rcLSH**, evaluates and selects the most informative hash bits using *bit balance* and *similarity preservation* criteria, followed 
by a refinement step that minimizes inter-bit redundancy. The result is a more compact and discriminative binary representation that preserves retrieval 
accuracy while reducing memory and computational costs. This work shows how optimizing the internal structure of hash codes can substantially improve scalability 
and performance across large-scale data retrieval tasks.

---

### Relevance to the ITR-1 Project

Together, these studies illustrate how LSH is being adapted for learning-based, cross-domain, and high-efficiency retrieval tasks.  
For this project—analyzing *r/wallstreetbets* discussions via scalable Spark-based similarity mining—these advances suggest valuable extensions:

- Integrating **learnable or adaptive hash layers** to better capture linguistic and semantic proximity (as in LLSH).  
- Leveraging **Jaccard-informed probabilistic matching** (as in Jiang & Chang) to optimize large-scale text comparisons.  
- Exploring **bit refinement and compact code strategies** (as in Liu et al.) to improve storage and retrieval efficiency in distributed systems.

---

### References

- Lu, Y., Cao, C., Zhang, Y., & Zhang, Y. (2023). *Learnable Locality-Sensitive Hashing for Video Anomaly Detection*. **IEEE Transactions on Circuits and Systems for Video Technology, 33**(2), 963–976. [https://doi.org/10.1109/TCSVT.2022.3205348](https://doi.org/10.1109/TCSVT.2022.3205348)

- Jiang, G.-Y., & Chang, C.-S. (2024). *Locality-Sensitive Hashing for Efficient Rendezvous Search: A New Approach*. **IEEE Transactions on Communications, 72**(9), 5674–5687. [https://doi.org/10.1109/TCOMM.2024.3388492](https://doi.org/10.1109/TCOMM.2024.3388492)

- Liu, X., Li, S., Zhang, S., & Tian, Q. (2024). *Refining Codes for Locality-Sensitive Hashing*. **IEEE Transactions on Knowledge and Data Engineering**. [https://doi.org/10.1109/TKDE.2023.3297195](https://doi.org/10.1109/TKDE.2023.3297195)

---

## 7. Reflection on Social and Cultural Implications

This ITR reveals how *similarity mining* can uncover the hidden social and cultural patterns within online financial discussions. 
By identifying textual and semantic overlap among thousands of Reddit posts, the Locality-Sensitive Hashing (LSH) approach captures how collective 
emotions and narratives evolve and spread across digital communities. While sentiment analysis in my earlier work quantified the emotional tone of posts, 
the ITR methods illuminate **how emotions cluster and replicate** — showing that individual expressions of fear, excitement, or defiance are rarely isolated, 
but rather form part of larger, self-reinforcing communicative systems.

From a cultural standpoint, this method provides a computational lens on **digital crowd behavior**. The Jaccard and cosine similarity models reveal that 
emotionally charged phrases and memes (“to the moon,” “hold the line,” etc.) serve as both linguistic and psychological anchors for group identity. 

The findings align with theories of social contagion and bounded rationality: online traders rely on emotionally familiar language to reduce uncertainty and signal belonging. 
Yet, they also challenge traditional finance models that assume decisions are made independently and rationally. By mapping the relational structure of discussions, the analysis gets 
closer to answering my broader research question—and establishes a foundation for large-scale behavioral modeling grounded in both computational and cultural insight.

---

### Acknowledgment

Portions of this README file were organized and edited with the assistance of **ChatGPT (GPT-5, OpenAI, 2025)**, used to help structure and refine. All analyses, interpretations, and final edits were performed by the author.
