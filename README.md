The Open-Source Information Retrieval Reproducibility Challenge
===============================================================

There's a general consensus in the information retrieval community that open-source search engines help enhance dissemination of results and support reproducibility. There's also general agreement that reproducibility is "a good thing". This issue has received some attention recently, including a dedicated track at ECIR 2015. However, we as a community still have a long way to go.

The goal of this project is to tackle the issue of reproducible *baselines*. This is a more difficult challenge than it seems. Just to provide two examples: Mühleisen et al. (2014) reported large differences in effectiveness across four systems that all purport to implement BM25. Trotman et al. (2014) pointed out that BM25 and query likelihood with Dirichlet smoothing can actually refer to at least half a dozen different variants; in some cases, differences in effectiveness are statistically significant. Given this state of affairs, how can we confidently report comparisons to "baselines" in our papers when even the baselines themselves are ill-defined? Indeed, Armstrong et al. (2009) point to the issue of weak baselines as the reason why ad hoc retrieval techniques haven't really been improving.

This project started as part of the [SIGIR 2015 Workshop on Reproducibility, Inexplicability, and Generalizability of Results (RIGOR)](https://sites.google.com/site/sigirrigor/), where we will report our initial findings.

Goals
-----

The purpose of this exercise is to invite the *developers* of open-source search engines to provide reproducible baselines of their systems in a common environment on Amazon's EC2 so that the community can have a better understanding of the effectiveness and efficiency differences of various baseline implementations. All results will be archived for future reference by the community. This archive is specifically designed to address the following scenarios:

1. I want to evaluate my new technique X. As a baseline, I'll use open-source search engine Y. Or alternatively, I'm building on open-source search engine Y, so I need a baseline anyway.

1. How do I know what's a "reasonable" result for system Y on test collection Z? What settings should I use? (Which stopwords list? What retrieval model? What parameter settings? Etc.) How do I know if I've configured system Y correctly?

1. Correspondingly, as a reviewer of a paper that describes technique X, how do I know if the baseline is any good? Maybe the authors misconfigured system Y (inadvertently), thereby making their technique "look good" (i.e., it's a weak baseline).

As a result of this exercise, researchers will be able to go to this resource, and for a number of open-source search engines, they'll learn how to reproduce (through extensive documentation) what the developers of those systems themselves consider to be a reasonable baseline.

Similarly, reviewers of papers will be able to consult this resource to determine if the baseline the authors used is reasonable or somehow "faulty".

Another anticipated result of this exercise is that we'll gain a better understanding of why all these supposed "baselines" are different. We can imagine a system-by-feature matrix, where the features range from stemming algorithm to HTML cleaning technique. After this exercise, we'll have a partially-filled matrix, from which we'll be able to hopefully learn some generalizations, for example (completely hypothetical): HTML cleaning really makes a big difference, up to 10% in terms of NDCG; which stemming algorithm you use (Krovetz vs. Porter, etc.) doesn't really matter; etc.

References
----------

T. Armstrong, A. Moffat, W. Webber, J. Zobel. Improvements That Don't Add Up: Ad-Hoc Retrieval Results Since 1998. CIKM 2009, pages 601-610.

H. Mühleisen, T. Samar, J. Lin, and A. de Vries. Old Dogs Are Great at New Tricks: Column Stores for IR Prototyping. SIGIR 2014, pages 863-866.

A. Trotman, A. Puurula, and B. Burgess, Improvements to BM25 and Language Models Examined. ADCS 2014.
