# r/wallstreetbets Behavior Analysis

## Overview

This repository is a data analysis project examining how collective attention, emotion, and language evolved in Reddit trading communities during the 2020–2022 period, with special focus on the GameStop / r/wallstreetbets surge in January 2021.

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

## Results and Interpretation

The project’s central finding is that the GameStop / r/wallstreetbets event is best understood as a **collective attention shock**.

The evidence points to a moment where:

- participation expanded rapidly,
- discourse volume surged,
- language became more concentrated,
- engagement became highly unequal and heavy-tailed,
- and sentiment became emotionally varied rather than uniformly positive or negative.

This suggests that online financial behavior during major market events cannot be explained only through price movement or average sentiment. The social structure of attention — who participates, how quickly discourse concentrates, and which narratives become dominant — is central to understanding the event.

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
