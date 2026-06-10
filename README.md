[README(12).md](https://github.com/user-attachments/files/28815014/README.12.md)
# r/wallstreetbets Behavior Analysis

## Overview

This repository is a portfolio-style data analysis project examining how collective attention, emotion, and language evolved in Reddit trading communities during the 2020–2022 period, with special focus on the GameStop / r/wallstreetbets surge in January 2021.

The project originally began as coursework, but was later expanded into a fuller independent portfolio project with a more complete data pipeline, preprocessing workflow, exploratory analysis, sentiment analysis, and discourse-regime modeling.

For evaluation or portfolio review, the main folder to focus on is:

```text
Data_Analysis/
```

The `Previous_Course_Work/` folder is included only as background. It shows earlier coursework and project origins, but it is not the main version of the project.

---

## Main Research Question

**How did emotionally charged online trading discussions on r/wallstreetbets reflect patterns of collective attention, coordination, and discourse change during major market events, especially the GameStop short-squeeze period?**

More specifically, the project asks:

1. Did the GameStop period look like steady growth in discussion, or a sudden collective attention shock?
2. How did participation, posting volume, and commenting behavior change during the spike?
3. Did sentiment become uniformly more positive or negative, or did discourse become more emotionally volatile?
4. Did language become more concentrated around shared tickers, actions, and narratives such as `GME`, `hold`, and `short squeeze`?
5. Can large-scale text patterns be grouped into broader discourse regimes that describe shifts in collective behavior over time?

---

## Repository Structure

```text
r-wallstreetbets-behavior-analysis/
│
├── Data_Analysis/
│   ├── 01_datapipeline.ipynb
│   ├── 02_preprocessing.ipynb
│   ├── 03_EDA.ipynb
│   ├── 04_detailed_sentiment_analysis.ipynb
│   └── 05_discourse_regimes_core.ipynb.ipynb
│
├── Previous_Course_Work/
│   ├── itr1_FindingSimilarItems/
│   ├── itr3_MiningFrequentItemsets/
│   ├── itr4_DimensionReductionandClustering/
│   ├── itr7_TimeSeriesAnalysis/
│   └── project/
│
├── scraper/
├── Midway.md
└── midway_spark_jupyter.md
```

---

## Main Project Folder

### `Data_Analysis/`

This is the primary portfolio project folder. It contains the end-to-end analysis pipeline.

| Notebook | Purpose |
|---|---|
| `01_datapipeline.ipynb` | Loads raw Reddit submissions and comments using PySpark, validates file paths and schemas, checks time coverage, and writes raw data into Parquet format. |
| `02_preprocessing.ipynb` | Cleans raw Reddit submissions and comments by removing deleted, empty, invalid, or low-information content. It standardizes timestamps, creates date fields, combines submission titles and body text, and outputs analysis-ready datasets. |
| `03_EDA.ipynb` | Explores posting volume, comment volume, unique authors, comments per submission, engagement distributions, text length, spike days, and keyword patterns. |
| `04_detailed_sentiment_analysis.ipynb` | Applies VADER sentiment analysis to submissions and comments, then compares sentiment across years, months, content types, spike days, and the GameStop period. |
| `05_discourse_regimes_core.ipynb.ipynb` | Uses TF-IDF, PCA, and KMeans clustering to identify broader discourse regimes and examine how linguistic patterns shift over time. |

---

## Background Folder

### `Previous_Course_Work/`

This folder contains earlier course exercises and project work that helped lead into the larger portfolio project. It is included for transparency and context, but it should not be treated as the main deliverable.

The current project should be evaluated through the `Data_Analysis/` folder.

---

## Data

The analysis uses large-scale Reddit data from trading-related subreddit activity, focused on the 2020–2022 period.

After preprocessing, the main cleaned datasets contain approximately:

- **1,371,852 submissions**
- **54,429,003 comments**
- **668,269 unique submission authors**
- **1,704,616 unique comment authors**
- Time range: approximately **January 2020 to December 2022**

The full discourse-regime notebook combines submissions and comments into approximately:

- **55,799,478 text documents**

Because the raw Reddit data is large, the project is designed to run with PySpark and Parquet files rather than small local CSV files.

---

## Methods

The project combines large-scale data engineering, exploratory data analysis, sentiment analysis, and unsupervised text modeling.

Main methods used:

- PySpark for large-scale processing
- Parquet storage for efficient intermediate datasets
- Reddit submission and comment preprocessing
- Daily and monthly aggregation
- Spike-day analysis based on high-volume activity periods
- Text-length and engagement distribution analysis
- VADER sentiment scoring
- Keyword tracking around GameStop-related language
- TF-IDF text representation
- PCA for dimensionality reduction
- KMeans clustering for discourse-regime detection
- Silhouette evaluation for cluster comparison

---

## Key Results

### 1. The GameStop period appears as a concentrated attention shock

The strongest pattern is not a slow, steady rise in discussion. Instead, activity and participation spike sharply around late January 2021.

The analysis shows:

- Large increases in posting and commenting volume
- Sharp increases in unique authors
- Higher comments-per-submission during spike periods
- Concentrated activity around GameStop-related language

This supports the interpretation that the GameStop episode was a burst of collective attention rather than ordinary growth in subreddit activity.

---

### 2. Participation expanded dramatically during the GameStop window

The sentiment notebook compares three windows:

| Window | Submissions | Average VADER Sentiment | Unique Authors |
|---|---:|---:|---:|
| Pre-GME window, 2020-11-01 to 2021-01-15 | 49,285 | 0.104 | 27,989 |
| GME peak window, 2021-01-16 to 2021-02-15 | 597,400 | 0.051 | 375,529 |
| Post-GME window, 2021-02-16 to 2021-04-30 | 179,030 | 0.095 | 113,470 |

The GameStop window had far more submissions and unique authors than both the pre- and post-event periods. This indicates a major expansion in participation, not just more activity from the same users.

---

### 3. Sentiment was slightly positive overall, but not the main signal

The VADER sentiment analysis found that average sentiment was slightly positive across both submissions and comments:

| Content Type | Count | Mean VADER Sentiment | Standard Deviation |
|---|---:|---:|---:|
| Submissions | 1,371,852 | 0.075 | 0.371 |
| Comments | 54,429,003 | 0.045 | 0.410 |

However, the project finds that average sentiment alone does not explain the GameStop moment. The more important signal is the combination of:

- extreme volume spikes,
- rapid participation growth,
- emotionally heterogeneous discussion,
- and topic concentration around shared tickers and actions.

In other words, the GameStop period was not simply “more positive” or “more negative.” It was more intense, more crowded, and more coordinated.

---

### 4. Spike days were more emotionally charged and heterogeneous

High-volume days were not uniformly positive or negative. Instead, they showed more volatility and variation in emotional tone.

This suggests that collective attention events on r/wallstreetbets are better understood as emotionally charged, fast-moving discourse moments rather than simple sentiment shifts.

---

### 5. Language became more concentrated around shared targets

During spike periods, the vocabulary shifted toward ticker- and action-oriented language, including terms such as:

- `GME`
- `hold`
- `short squeeze`
- `diamond hands`
- `paper hands`
- `AMC`

Baseline language outside spike windows was broader and less synchronized. This supports the idea that major market events narrowed the community’s attention around shared symbols, narratives, and trading actions.

---

### 6. Discourse-regime modeling found separable language patterns

The discourse-regime notebook uses TF-IDF, PCA, and KMeans clustering to group large-scale Reddit text into broader language regimes.

Cluster evaluation showed high silhouette scores across several values of `k`:

| Number of Clusters | Silhouette Score |
|---:|---:|
| 3 | 0.9999 |
| 4 | 0.9845 |
| 5 | 0.9851 |
| 6 | 0.9864 |

The notebook treats this as a descriptive exercise rather than causal modeling. The goal is to map how dominant discourse patterns shift over time and how linguistic convergence or diversity changes around major market events.

---

## Main Interpretation

The project’s central finding is that the GameStop / r/wallstreetbets event is best understood as a **collective attention shock**.

The evidence points to a moment where:

- participation expanded rapidly,
- discourse volume surged,
- language became more concentrated,
- engagement became highly unequal and heavy-tailed,
- and sentiment became emotionally varied rather than uniformly positive or negative.

This suggests that online financial behavior during major market events cannot be explained only through price movement or average sentiment. The social structure of attention — who participates, how quickly discourse concentrates, and which narratives become dominant — is central to understanding the event.

---

## How to Run

This project is designed for a PySpark environment, such as a cluster or high-performance computing setup.

General workflow:

1. Run `01_datapipeline.ipynb` to load raw Reddit data and save raw Parquet files.
2. Run `02_preprocessing.ipynb` to generate cleaned submissions and comments.
3. Run `03_EDA.ipynb` to inspect activity, engagement, and language patterns.
4. Run `04_detailed_sentiment_analysis.ipynb` to generate and analyze VADER sentiment outputs.
5. Run `05_discourse_regimes_core.ipynb.ipynb` to build text features and cluster discourse regimes.

The project includes Midway-related notes:

- `Midway.md`
- `midway_spark_jupyter.md`

These provide environment guidance for running Spark notebooks on a computing cluster.

---

## Tools and Libraries

Core tools used in the project include:

- Python
- PySpark
- Spark SQL
- Pandas
- NumPy
- Matplotlib
- Seaborn
- VADER Sentiment
- Spark MLlib
- TF-IDF
- PCA
- KMeans

---

## Portfolio Note

This project began as a course-based exploration of Reddit and market behavior, but it was later developed into a more complete portfolio project. The earlier coursework is preserved in `Previous_Course_Work/`, while the main project work is organized in `Data_Analysis/`.

For portfolio review, please focus on the cleaned, expanded analysis in `Data_Analysis/`, especially the sequence from data pipeline to preprocessing, EDA, sentiment analysis, and discourse-regime modeling.

---

## Limitations

This project is descriptive and exploratory. It does not make causal claims about Reddit activity causing market movements.

Important limitations:

- Reddit posts and comments are not representative of all retail investors.
- VADER sentiment is useful for scalable analysis but can miss sarcasm, memes, slang, and finance-specific language.
- Spike-day analysis captures attention bursts but does not prove coordination intent.
- Clustering results describe textual similarity, not fixed social groups.
- The analysis focuses on discourse behavior rather than trading records or individual financial outcomes.

---

## Future Work

Possible extensions include:

- Linking Reddit discourse patterns to stock price, volume, and volatility data.
- Comparing r/wallstreetbets with other investing subreddits.
- Using transformer-based sentiment models tuned for finance or social media language.
- Building topic models to separate memes, risk-taking language, advice, and market commentary.
- Adding network analysis to examine reply structures and influential users.
- Testing whether discourse-regime shifts predict later changes in attention or market behavior.
