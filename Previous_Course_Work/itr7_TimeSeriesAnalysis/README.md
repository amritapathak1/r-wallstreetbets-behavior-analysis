# ITR 7: Time-Series Analysis
### Large-Scale Data Mining for Social and Cultural Knowledge Discovery  
**Author:** Amrita Pathak  
**Course:** MACS 40123  

---

## Overview 

This builds up on the previously submitted ITR (ITR 1, ITR-3, and ITR-4). Please refer to the `itr7.py` jupyter notebook for the methodology, outcome and analysis.

---


## 1. Literature Review: 

### Unsupervised Change Point Detection and Trend Prediction for Financial Time-Series Using a New CUSUM-Based Approach (Kim et al., 2022)

Kim (2022) presents a statistical framework for detecting structural changes in time series, with a focus on identifying points where the underlying pattern shifts in level, variance, or trend. The study argues that many real world temporal datasets do not follow a single stable pattern over time, and that meaningful changes often occur when external conditions shift or when the system enters a new behavioral regime. The method introduced in this work improves segmentation performance in settings where the series is noisy or irregular. By locating break points with greater precision, the framework allows researchers to distinguish long term movement from short term fluctuation and to interpret the evolution of the series with more clarity.

The logic of this paper connects directly to the analysis performed in my ITR7 notebook. My work used Spark to construct a daily time series of r WallStreetBets submissions and comments. Although the notebook relied on descriptive trend visualization rather than a formal change detection model, several of the patterns I observed resemble the kinds of structural shifts that Kim’s method is designed to identify. Sharp increases in comments per submission, long periods of elevated activity, and changes in monthly engagement are all examples of potential break points that could be studied more rigorously. Kim’s approach therefore provides a conceptual extension of my analysis by showing how statistical segmentation could help identify when online community behavior undergoes significant transitions. This would deepen the interpretation of the descriptive patterns I produced and help link shifts in engagement to broader social or market events.

### MSTL: A Seasonal–Trend Decomposition Algorithm for Time Series with Multiple Seasonal Patterns (Bandara et al., 2021)

Bandara et al. introduce MSTL, a decomposition method designed for time series that contain more than one seasonal pattern. Traditional decomposition techniques such as STL, X-13-ARIMA, or TBATS are effective for single seasonality but often struggle with complex cycles that appear in many modern datasets. The authors show that high frequency data, such as hourly or daily measurements, often carry intertwined seasonal effects that cannot be separated with older methods. MSTL extends STL by applying it iteratively to each seasonal cycle so that trend, multiple seasonal components, and the remainder can be extracted with greater clarity. The paper presents detailed evaluations using simulated datasets and perturbed real world electricity demand data. Across these tests, MSTL performs competitively while maintaining lower computational cost than alternatives. Tables and figures in the paper illustrate how MSTL separates weekly and daily seasonalities more accurately than STR, TBATS, or Prophet, especially under conditions where seasonal patterns change over time.

This work relates to my ITR7 project because it highlights the value of decomposing a time series into interpretable subcomponents before drawing conclusions about behavior. In my Spark based analysis of r WallStreetBets activity, I constructed daily series for submissions, comments, and comments per submission. The patterns I observed were strong but difficult to separate into trend and seasonal structure. Although my notebook focused on aggregation and visualization, the MSTL framework shows how future work could break these patterns into distinct components that better explain long term growth, monthly cycles, or irregular bursts of engagement. The idea of isolating multiple seasonal patterns is especially relevant for online communities, where activity often follows both weekly rhythms and event driven spikes. MSTL therefore provides a methodological direction that could deepen the insights from my descriptive analysis.

### Autoregressive models in environmental forecasting time series: a theoretical and application review (Kaur et al., 2023)

The study examines how hybrid time series models can improve the prediction of complex environmental variables. The authors argue that many environmental processes contain nonlinear patterns, long memory, and strong noise, which can limit the performance of traditional models such as ARIMA. Their study integrates ARIMA with data driven neural architectures in order to capture both linear and nonlinear structure more effectively. The paper describes how the hybrid model is tested on several environmental datasets and shows that the approach increases prediction accuracy, especially when the target variable fluctuates sharply or contains irregular cycles. Their evaluation demonstrates that the hybrid method outperforms single model baselines, and they emphasize that combining linear structure with learned nonlinear adjustments offers a more complete understanding of environmental dynamics. According to the authors, this modelling strategy is especially valuable when the goal is to extract reliable patterns from long and noisy observational sequences.

This work speaks directly to questions raised in my ITR7 analysis of r WallStreetBets activity. Although my notebook focused on Spark based aggregation and descriptive visualization, the underlying challenges resemble those described in the environmental forecasting task. The Reddit time series shows rapid fluctuations, irregular spikes, and long periods of uneven growth. These patterns make simple linear summaries insufficient for deeper inference. The hybrid perspective in this paper suggests a future direction for my analysis, where the daily submissions or comments series could be modeled using approaches that separate linear trends from nonlinear bursts of crowd activity. The idea of combining structural time series components with flexible learning based corrections aligns with the complexities of online social data and shows how predictive or interpretive models could be expanded beyond the descriptive work completed in this lab.

---
## 2. Implementation Workflow and Method Evaluation

### Implementation Workflow

The analysis follows a structured time-series pipeline built on Spark to handle large-scale Reddit data. First, r/WallStreetBets submissions and comments were ingested and aggregated into daily time series, including submission counts, total comments, and comments per submission. These aggregates were used to examine long-term growth trends, short-term temporal dependence, and seasonal patterns at weekly and monthly resolutions. Linear regression, autoregressive features, and correlation analysis were applied to characterize growth, momentum, and feedback dynamics in community activity, while descriptive statistics were used to assess volatility and dispersion.

This workflow prioritizes scalability and interpretability, allowing high-level behavioral patterns to be identified without imposing overly restrictive assumptions on the data-generating process.

### Methods That Worked Well

Several methods proved effective for capturing meaningful structure in the data. Linear trend analysis successfully revealed steady long-term growth in submissions, providing an interpretable estimate of annual expansion despite high variance in daily activity. Weekly and monthly aggregation exposed strong and intuitively consistent seasonal patterns, including weekday–weekend differences aligned with market schedules and monthly cycles reflecting known trading phenomena such as summer slowdowns and end-of-year declines.

Autoregressive features performed particularly well in modeling short-term dynamics. The strong positive coefficients for one-day and one-week lag features indicate momentum effects in posting behavior, while the negative coefficient on the thirty-day lag captures mean reversion, reflecting the fluctuating nature of attention in financial discourse. High R² and low RMSE values suggest that short- to mid-term temporal dependence explains a substantial portion of day-to-day variation. Correlation and lagged correlation analyses further confirmed feedback loops between submissions and comments, supporting the interpretation that discussion activity sustains short-term engagement.

### Methods That Were Limited or Less Effective

Some modeling choices were constrained by data structure and scope. Linear regression, while interpretable, proved too simplistic to fully capture early-period behavior, as indicated by a negative intercept and underprediction during the subreddit’s initial low-volume phase. This reflects both high variance in early data and the event-driven nature of online financial communities. More flexible models such as polynomial, exponential, or regime-based approaches would likely better capture nonlinear growth and structural shifts.

A key limitation of the dataset is that the primary time index is based on submission timestamps rather than comment creation times. As a result, comment activity is temporally aggregated at the post level, limiting the ability to model fine-grained conversational dynamics or intra-day discussion cascades. This limitation became especially clear when inspecting days with unusually high comment volumes but relatively low submission counts, where intense discussion activity was not captured as a corresponding increase in posting frequency. This restricts the precision of causal interpretations between posting and commenting behavior and limits the application of more detailed temporal models.

Additionally, gaps in data coverage—particularly between 2016 and 2018—reduce confidence in long-term trend estimation and prevent robust analysis of multi-year structural changes.

### Next Steps

Future work would benefit from incorporating comment-level timestamps to enable finer temporal resolution and more accurate modeling of discussion dynamics. Applying change point detection, multi-seasonal decomposition, or nonlinear growth models would help identify regime shifts and disentangle overlapping temporal patterns. Addressing missing data across years would also strengthen long-term inference and improve the robustness of growth estimates.

---

## 3. Reflection on Social and Cultural Implications

The time series analysis of r/WallStreetBets activity reveals important insights about how digital financial communities form, grow, and coordinate through shared temporal rhythms. By constructing daily patterns of submissions, comments, and comments per submission, it becomes clear that participation on this platform is not random or individually driven. Instead, engagement follows recurring cycles of attention, excitement, and collective momentum that resemble forms of coordinated behaviour observed in other large scale online environments. Periods of unusually high comment intensity, for example, signal moments when the community converges around specific narratives, market events, or emotional responses. These temporal spikes show that financial decision making in online communities is shaped by group level dynamics rather than purely individual reasoning.

The descriptive patterns also connect to theories of digital herding and participatory culture. The strong variation in daily activity and the rapid rise of engagement across months and years indicate that community members respond to cues from one another and from the broader information ecosystem. The subreddit becomes a space where sentiment, rumour, and collective interpretation build on each other through rapid interaction. This supports the idea that financial behaviour in online spaces is influenced by shared meaning making and emotional contagion rather than isolated analytical judgement. The presence of clear seasonal rhythms and long term growth suggests that community identity strengthens over time, creating a stable context for recurring waves of coordinated attention.

These findings advance my overall research question by showing that temporal structure itself can reveal how online discussions translate into forms of collective reasoning. While the current analysis is descriptive, it highlights the value of treating engagement patterns as indicators of social coordination. Integrating more formal methods such as change point detection or multi seasonal decomposition in future work would help identify the specific moments when new narratives emerge or when community behaviour shifts significantly. This would deepen our understanding of how digital investor groups shape and are shaped by ongoing cycles of sentiment, emotion, and market attention.

---

## References

- Bandara, K., Hyndman, R. J., & Bergmeir, C. (2021).
MSTL: A seasonal–trend decomposition algorithm for time series with multiple seasonal patterns.

- Kim, K., Park, J. H., Lee, M., & Song, J. W. (2022).
Unsupervised change point detection and trend prediction for financial time-series using a new CUSUM-based approach. IEEE Access, 10, 34690–34705.

- Kaur, G., & Parmar, R. (2023).
Hybrid deep learning models for environmental time series forecasting.
Environmental Science and Pollution Research, 30, 1–16.

---

## Acknowledgment

Portions of this README file were organized and edited with the assistance of **ChatGPT (GPT-5, OpenAI, 2025)**, used to help structure and refine. All analyses, interpretations, and final edits were performed by the author.