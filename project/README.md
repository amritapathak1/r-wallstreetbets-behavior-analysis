# Emotion, Collective Intelligence, and Coordinated Market Behavior: A Longitudinal Analysis of Discourse and Participation in r/WallStreetBets


## Overleaf Link

[View the paper on Overleaf](https://www.overleaf.com/read/tzqxkftdzzxn#8e63fc)


## Introduction

The 2020–2022 GameStop episode marked a critical shift in retail participation in financial markets. During this period, online trading communities, most prominently r/WallStreetBets (WSB), operated not only as reflections of market sentiment but as active sites of collective sense-making. Market participation was embedded in emotionally charged discourse that combined financial speculation with cultural meaning, solidarity, and opposition to institutional actors.

Prior research has examined the rise of meme stocks and their implications for market efficiency, volatility, and price discovery (Aloosh et al., 2023; Buz & de Melo, 2024). Related work in behavioral finance and computational social science shows that aggregated online sentiment can sometimes correlate with market dynamics (Bollen et al., 2011; Chen et al., 2014). However, much of this literature treats emotion as a scalar signal, typically positive or negative sentiment, rather than as a structural force that shapes how collective coordination forms and evolves.

Qualitative and cultural analyses of WSB highlight that participation during the GameStop era was embedded in narratives of generational frustration, masculinity, and symbolic resistance (Mendoza-Denton, 2021). These narratives provided shared interpretive frames that enabled large-scale coordination without formal organization. Yet such insights are rarely integrated with scalable computational approaches that analyze discourse longitudinally.

This study addresses this gap by developing a multi-method computational framework to examine how emotional language, linguistic convergence, and discourse structure interact over time within r/WallStreetBets. Focusing on the full 2020–2022 period, we analyze how emotional regimes form, persist, and dissolve, and how these regimes correspond to shifts in participation and coordinated engagement around key market events.

Our approach draws on collective intelligence theory, which emphasizes that group-level accuracy depends on informational diversity and independence (Da & Huang, 2020). While emotionally aligned narratives can facilitate coordination, they may also reduce independence and increase vulnerability to herding and collective misjudgment (Berghel, 2022). We therefore treat emotional convergence not only as a descriptive feature of discourse, but as a potential signal of collective intelligence degradation.

Rather than asking whether sentiment predicts prices, we examine how emotional and cultural dynamics structure collective behavior over time, and under what conditions these dynamics support or undermine collective intelligence. This perspective links cultural theory with computational analysis and extends beyond financial markets to other forms of digitally mediated collective action.

Accordingly, we ask: How do emotional language, linguistic convergence, and discourse structure interact over time to shape collective behavior in r/WallStreetBets during the GameStop era, and under what conditions do these dynamics support or undermine collective intelligence?

We find that during periods of intense coordination, discourse in r/WallStreetBets collapses into a dominant linguistic regime punctuated by sparse, event-specific subregimes. This pattern suggests that emotional alignment facilitates collective coordination while limiting behavioral differentiation.

Rather than testing predefined hypotheses, we adopt an exploratory, theory-driven approach aimed at identifying emergent mechanisms in high-dimensional, culturally embedded online systems.

## Background and Theoretical Motivation

Collective intelligence theory holds that group-level accuracy depends on informational diversity and independence among participants. When individuals contribute heterogeneous signals without excessive coordination, aggregated judgments can outperform expert assessments (Da and Huang, 2020). Digitally mediated environments complicate this logic. Rapid information diffusion, emotional contagion, and narrative alignment can increase coordination while simultaneously reducing independence. This creates a core tension between coordination and diversity that lies at the center of collective intelligence theory. When emotional alignment becomes strong, collective behavior may shift from aggregation toward herding, increasing the risk of collective error (Berghel, 2022).

Within financial markets, a growing literature shows that online discourse can influence trading behavior under certain conditions. Aggregate emotional signals extracted from social media have been shown to correlate with market movements (Bollen et al., 2011; Chen et al., 2014). More recent studies of meme stocks suggest that coordinated retail participation can temporarily disrupt price discovery and market efficiency (Aloosh et al., 2023; Buz and de Melo, 2024). At the same time, cultural analyses of r/WallStreetBets emphasize that participation during the GameStop era was embedded in shared narratives of identity, rebellion, and symbolic resistance to institutional finance (Mendoza-Denton, 2021). These narratives enabled large-scale coordination in the absence of formal organization and framed trading as an expressive and moral act rather than a purely instrumental one.

This study builds on these perspectives by treating emotion not as a unidimensional sentiment signal but as a structuring force in collective behavior. Emotional language and narrative repetition shape how coordination emerges and how informational diversity changes over time. We conceptualize r/WallStreetBets as an emotional cultural system in which linguistic convergence, participation dynamics, and coordination interact across time. Rather than assuming stable crowd rationality or irrationality, we treat collective intelligence as a dynamic property that can strengthen or degrade depending on emotional regimes and discourse structure. Existing work rarely examines these processes longitudinally at scale. By analyzing discourse across the full 2020–2022 period, this study addresses that gap.

## Data and Methods

### Data

We analyze discourse from the r/WallStreetBets subreddit during the GameStop era, from January 1, 2020, to December 31, 2022. The dataset includes all submissions and comments posted during this period, along with timestamps and engagement metadata. After preprocessing and aggregation, the dataset spans 1,097 days of activity.

Participation levels are consistently high throughout the period. On average, the subreddit contains approximately 601 submissions per day and 31,549 comments per day. This corresponds to an estimated 659,000 submissions and 34.6 million comments across the full window. These figures reflect cleaned and aggregated data and provide a conservative estimate of total activity.

This temporal scope captures the emergence, escalation, and aftermath of the GameStop episode. It enables analysis of both short-lived coordination events and longer-term shifts in discourse and participation.

### Analytical Pipeline

The analysis uses a multi-method computational pipeline to study linguistic structure, emotional tone, and temporal dynamics in large-scale online financial discourse. The pipeline consists of five stages: text preprocessing, text representation, unsupervised clustering, post hoc sentiment analysis, and longitudinal analysis. A schematic overview of the pipeline is shown in Figure X.

### Text Preprocessing and Representation

All text data were processed using a consistent procedure across the full time span. Preprocessing steps include removal of deleted or empty content, lowercasing, punctuation removal, tokenization, and stopword removal. Domain-specific language, such as ticker symbols and community slang, was retained to preserve financial and cultural meaning.

Each submission or comment is treated as a document and represented using TF-IDF features. This representation captures relative term importance while downweighting common terms. Because the feature space is high-dimensional, we apply principal component analysis to obtain a reduced representation that preserves the dominant variance structure. These components form the basis for clustering.

### Unsupervised Clustering

We apply K-means clustering to the reduced text representations to identify discourse-based behavioral structures within r/WallStreetBets. Clustering is performed using linguistic features only. Sentiment scores, engagement metrics, and market data are not included. The resulting clusters capture patterns of language use and discourse style rather than predefined psychological categories.

The number of clusters was selected using standard internal diagnostics such as elbow and silhouette criteria. Each document is assigned to a single cluster. This allows analysis of how different discourse patterns contribute to participation and change over time.

### Relation to Prior Typology Work

Prior work in behavioral finance often segments investors using survey-based measures such as risk tolerance, confidence, or money attitudes. These approaches define categories ex ante and rely on self-reported preferences. In contrast, this study identifies discourse-based structures that emerge directly from language use at scale. Clustering is applied without predefined attitudinal labels. Emotional properties are examined after clusters are formed.

### Sentiment Analysis

To characterize emotional tone, we apply sentiment analysis after clustering. We use the VADER sentiment analyzer to compute sentiment scores for each document. Sentiment is summarized at the cluster and temporal levels. This allows interpretation of emotional patterns without shaping the clustering structure.

### Frequent Itemset Mining

To identify recurring narrative structures, we apply frequent itemset mining using the FP-Growth algorithm on tokenized text. Itemsets capture stable co-occurring terms that reflect shared narratives and interpretive frames. Itemset prevalence is examined at both the aggregate level and within clusters. This allows comparison of narrative structure across discourse patterns and over time.

### Longitudinal Analysis

Activity is aggregated at a daily resolution to construct time series of posting volume, commenting volume, sentiment aggregates, cluster proportions, and itemset prevalence. These time series are used to examine emotional regimes, participation waves, and shifts in discourse structure across the 2020–2022 period.

The analysis is exploratory and theory-driven. Rather than testing predefined hypotheses, the goal is to identify emergent mechanisms linking emotional alignment, linguistic convergence, and collective coordination in large-scale online financial communities.

## Findings and Discussion

### Discourse Structure, Narrative Co-occurrence, and Participation Dynamics

Frequent itemset analysis shows that r/WallStreetBets discourse during 2020–2022 is organized around stable co-occurring patterns rather than isolated mentions. Across parameter settings, frequent itemsets consistently link high-salience tickers such as GME, AMC, TSLA, and AAPL with emotionally and behaviorally charged language. This indicates persistent narrative coupling between assets, affect, and trading identity.

Raising support and confidence thresholds does not change the overall structure of the results. The most prominent co-occurrence patterns remain stable, suggesting that they are not artifacts of low thresholds. Itemset support is strongly correlated with ticker popularity, reflecting the dominance of a small number of assets. In contrast, confidence is largely independent of popularity. Frequent mentions alone do not imply strong conditional associations. Some assets appear often, but only a subset is embedded in consistent narrative pairings.

Higher-order itemsets are rare. This reflects the conversational structure of Reddit discussions, which tend to focus on single assets or direct comparisons. Collective attention is therefore organized through repeated dyadic narrative structures rather than complex combinatorial coordination.

Time series analysis shows that participation during the GameStop era is volatile and strongly event-driven. Submission volume exhibits large daily fluctuations and weak long-term trend structure. A linear trend indicates a gradual decline of approximately 136 submissions per year, but this trend explains little of the observed variation.

Short-term persistence dominates participation dynamics. Submission counts from the previous day strongly predict current activity, while weekly and monthly lags contribute little explanatory power. This pattern is consistent with bursty engagement tied to episodic events rather than stable cycles.

Weekly and monthly patterns support this interpretation. Activity peaks midweek and declines sharply on weekends, aligning with market schedules. Monthly activity is highest early in the year, drops in spring, and remains subdued but stable through summer and fall. These patterns reflect coordination around market timing rather than endogenous platform rhythms.

Lagged correlations show continuity without strong feedback amplification. Submissions and comments are correlated on the same day and at a one-day lag. Cross-lag effects are weak and unstable. Discussion activity persists across days but does not reliably generate self-reinforcing growth in posting volume.

### Engagement Intensity and Crowd Convergence

Despite modest long-term declines in posting volume, engagement intensity increases over time. The number of comments per submission rises during the 2020–2022 period. This increase reflects episodic surges of collective attention rather than gradual community maturation.

Major market events generate disproportionately large discussion threads. These threads produce dense conversational convergence around salient narratives. This pattern distinguishes the GameStop era from earlier periods of organic subreddit growth. Engagement intensity reflects rapid amplification and crowd convergence driven by emotionally charged mobilization.

### Clustering and the Limits of Behavioral Segmentation

Unsupervised clustering reveals a highly imbalanced structure. One dominant cluster contains nearly the entire corpus and represents a general background mode of discourse. This mode is characterized by conversational, expressive, and meta language. All other clusters are extremely small.

Distinctive term analysis supports this interpretation. Small clusters are anchored to specific tickers or to infrastructural language associated with daily discussion threads. They do not represent broad behavioral archetypes. Sentiment analysis shows that the median sentiment is neutral across all clusters. The dominant cluster exhibits wide emotional dispersion, consistent with a mixture of hype, humor, anxiety, and routine commentary.

These results indicate that discourse-based clustering does not yield evenly sized behavioral segments in this setting. Instead, the corpus is best understood as a baseline discourse environment punctuated by sparse, event-specific subregimes tied to particular assets or discussion formats.

### Discussion and Implications for Collective Intelligence

These findings highlight a central tension in collective intelligence theory. During the GameStop era, r/WallStreetBets exhibits strong coordination through repeated narratives, emotional alignment, and short-term momentum. These dynamics enable rapid collective mobilization around market events.

At the same time, linguistic convergence and narrative repetition coincide with reduced diversity of expression. Periods of intense coordination are associated with a collapse into a dominant linguistic regime, with only sparse subregimes. This pattern suggests conditions under which informational independence may erode.

Collective intelligence in this setting is therefore regime-dependent. Emotionally coherent periods support coordination and shared meaning. They may also increase susceptibility to herding and collective misjudgment. Crowd behavior cannot be classified as consistently wise or consistently irrational. Instead, collective intelligence fluctuates over time in response to emotional regimes and discourse structure.

This study contributes to behavioral finance by reframing retail trading as coordinated participation shaped by shared affect. Emotional alignment organizes attention and sustains engagement even when behavioral differentiation is limited. For computational social science, the study provides a scalable framework for analyzing cultural dynamics in high-volume online environments over time. The approach integrates clustering, itemset mining, sentiment analysis, and time series methods to recover emergent discourse structures.

More broadly, the findings advance collective intelligence theory by showing how coordination and independence trade off dynamically in emotionally charged online communities. Linguistic convergence and emotional alignment can strengthen mobilization while simultaneously narrowing the space for independent judgment. Collective intelligence should therefore be understood as a dynamic property shaped by discourse regimes rather than as a fixed trait of crowds.
