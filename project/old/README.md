# Proposal Feasibility Assessment: Final Project
### Large-Scale Data Mining for Social and Cultural Knowledge Discovery  
**Author:** Amrita Pathak  
**Course:** MACS 40123  

---

## 1. Research Question:

*How do emotionally charged online trading discussions—such as those on Reddit’s r/wallstreetbets—reflect and influence collective financial decision-making, risk-taking behavior, and broader market sentiment?*

This project will center on the events surrounding the GameStop short squeeze in early 2021. In this episode, retail traders on Reddit mobilized around a shared narrative of rebellion against institutional finance, driving unprecedented price volatility. The phenomenon will be studied as a convergence of emotional contagion, collective identity, and performative finance—an intersection where social and psychological forces manifest in real economic behavior.

Recent literature provides a strong foundation for this inquiry. Mendoza-Denton (2021) interprets the GameStop movement as a form of “vengeance capitalism,” where millennials channel intergenerational anger through trading as symbolic justice. Da and Huang (2020) show that collective accuracy declines when independence is lost, offering a model for studying informational herding on Reddit. Berghel (2022) critiques the “banality of online crowds,” emphasizing how emotion and conformity degrade collective wisdom. Together, these studies outline a theoretical bridge between behavioral finance, digital crowd theory, and cultural psychology.

The potential contributions of this project are both conceptual and methodological. It will demonstrate how emotional and moral narratives from online communities can be analyzed computationally to understand market sentiment formation. The study will extend wisdom-of-crowds research by integrating emotion and culture as explanatory variables for herding and risk-taking. Moreover, it will highlight how digital communities transform emotion into identity and coordinated behavior, offering insights into online crowd ethics and financial governance. Methodologically, it will combine distributed computing, sentiment modeling, and clustering to process millions of Reddit posts efficiently and transparently.

Ultimately, this project seeks to advance both academic understanding and practical awareness of how emotion-driven online participation can influence real-world market dynamics.

---

## 2. Comprehensive Description of Data and Exploratory Data Analysis  

The dataset already analyzed in this project consists of Reddit submissions and comments from the *r/wallstreetbets* subreddit spanning **five years, from 2014 through 2018**. Data were retrieved from the Pushshift Reddit Archive in monthly compressed `.zst` files, each containing historical Reddit activity. Every record includes metadata such as post ID, author, timestamp, score, comment count, and body text. This multi-year dataset comprises millions of posts and comments—providing both the depth and breadth required to study long-term trends in online financial discourse and the evolution of risk-oriented language within the community.

The preprocessing pipeline decompresses each `.zst` file, filters for posts belonging to *r/wallstreetbets*, removes deleted or bot-generated content, and cleans the text by lowercasing, removing punctuation, tokenizing, lemmatizing, and eliminating stopwords. A custom dictionary is applied to preserve domain-specific slang and abbreviations frequently used by traders, such as “yolo,” “tendies,” and “diamond hands.” The cleaned and filtered data are then stored as line-delimited JSON files, optimized for distributed processing through **Dask** on the University of Chicago’s Midway3 high-performance computing cluster. This setup ensures that large-scale text mining can be executed efficiently and reproducibly across multiple nodes.

Exploratory Data Analysis revealed several distinctive features of this five-year discourse. The most frequent words were action-oriented verbs such as “buy,” “go,” “make,” and “call,” indicating that the community communicates through dynamic, goal-driven, and performative language. Sentiment analysis using VADER revealed a **bimodal distribution** of emotional tone, with peaks near ±0.5. This suggests that highly positive and highly negative expressions dominate interactions, reflecting the community’s enthusiasm during bullish phases and despair during losses. Posts exhibiting emotional extremes also tended to receive higher engagement (in upvotes and comments), reinforcing the idea that intense emotional expression attracts collective attention.

Further clustering analysis using **MiniBatchKMeans** on TF-IDF features identified several consistent behavioral archetypes across the five-year period. These include *Hype-Driven Traders*, who employ high-energy slang and optimism; *Regretful Pessimists*, who share narratives of loss and reflection; *Technical Analysts*, who rely on data-heavy or chart-based reasoning; and *Meme-Driven Optimists*, who communicate primarily through humor and cultural references. Together, these archetypes illustrate how *r/wallstreetbets* functions as both a financial discussion board and an emotionally performative community.

Finally, temporal sentiment trends across the dataset reveal clear periods of collective mood fluctuation that correspond with broader market events between 2014 and 2018. These patterns suggest that emotional contagion and heuristic-driven decision-making were present well before the GameStop phenomenon, providing an empirical foundation for understanding how digital crowd dynamics evolved into later large-scale financial movements. The EDA thus establishes a robust empirical connection between linguistic sentiment, collective identity, and market-oriented behavior in online finance communities.


## 3. Concrete Methodological Design and Feasibility Assessment  

The proposed methodology combines scalable NLP, similarity mining, and clustering to analyze linguistic and emotional structures in large-scale Reddit data. Cleaned posts and comments will be transformed into textual feature vectors through TF-IDF and n-gram generation. Sentiment will be computed using both VADER and FinBERT, allowing comparison between general-purpose and domain-specific models. The resulting sentiment scores will then be aggregated over time to construct a time series of collective emotional tone.

In the next stage, similarity mining using MinHash and Random Projection Locality-Sensitive Hashing will identify clusters of repeated memes, emotional phrases, and shared narratives, revealing how ideas circulate across users. Dimensionality reduction and MiniBatchKMeans clustering will be used to detect latent topics and behavioral archetypes, while BERTopic may serve as an optional extension for semantic topic extraction. Finally, aggregate sentiment and topic frequencies will be correlated with market indicators such as daily DAX and S&P 500 returns to quantify how emotional tone interacts with financial volatility.

Analytically, the project will move from micro-level textual dynamics to macro-level sentiment trends. It will assess whether emotional peaks precede or follow significant market movements, and whether clustered linguistic similarity corresponds to herding or independence. Following Da and Huang’s (2020) logic of informational independence, the study will also measure lexical diversity over time as a proxy for crowd convergence. 

All analyses will be executed on UChicago’s Midway3 cluster using Dask and Spark. Preliminary tests on the 2014–2018 dataset confirm that the pipeline scales linearly with cores and memory. 

Given that all required data are available and the computational infrastructure is tested, the project is both methodologically feasible and substantively rich. It will integrate behavioral, cultural, and computational perspectives to address how emotion and social identity interact with market behavior, advancing the broader goal of understanding collective intelligence and affective economics in the digital age.

---

## References  

Aren, S., & Hamamcı, H. N. (2020). Relationship between risk aversion, risky investment intention, and investment choices: Impact of personality traits and emotion. *Kybernetes, 50*(10), 2697–2721. https://doi.org/10.1108/K-12-2019-0850  

Berghel, H. (2022). Social media and the banality of (online) crowds. *Computer, 55*(11), 100–105. https://doi.org/10.1109/MC.2022.3198128  

Bollen, J., Mao, H., & Zeng, X. (2011). Twitter mood predicts the stock market. *Journal of Computational Science, 2*(1), 1–8. https://doi.org/10.1016/j.jocs.2010.12.007  

Chen, H., De, P., Hu, Y. J., & Hwang, B.-H. (2014). Wisdom of crowds: The value of stock opinions transmitted through social media. *Review of Financial Studies, 27*(5), 1367–1403. https://doi.org/10.1093/rfs/hhu001  

Da, Z., & Huang, X. (2020). Harnessing the wisdom of crowds. *Management Science, 66*(10), 4657–4677. https://doi.org/10.1287/mnsc.2019.3294  

Dambanemuya, H. K., Wachs, J., & Horvát, E. Á. (2023). Understanding (ir)rational herding online. *Proceedings of the ACM Collective Intelligence Conference*, 79–88. https://doi.org/10.1145/3582269.3582282  

Katariya, M., & Joshi, S. (2024). Exploring emotional influences on investment choices: Stock selection and trading. *SSRN Electronic Journal.* https://doi.org/10.2139/ssrn.4710978  

Mendoza-Denton, N. (2021). “Sticking it to the man”: *r/wallstreetbets*, generational masculinity and revenge in narratives of our dystopian capitalist age. *Anthropology Now, 13*(1), 91–99. https://doi.org/10.1080/19428200.2021.1903593  

Thaler, R. H. (1980). Toward a positive theory of consumer choice. *Journal of Economic Behavior & Organization, 1*(1), 39–60. https://doi.org/10.1016/0167-2681(80)90051-7  

Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science, 185*(4157), 1124–1131. https://doi.org/10.1126/science.185.4157.1124  

---

### Acknowledgment

Portions of this README file were organized and edited with the assistance of **ChatGPT (GPT-5, OpenAI, 2025)**, used to help structure and refine. All analyses, interpretations, and final edits were performed by the author.