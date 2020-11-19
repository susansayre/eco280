---
date: "2020-01-28T00:36:14+09:00"
description: Data analysis project
draft: false
title: Data analysis
weight: 3
---

Working alone or in a pair, you will create and document an analysis of a dataset of your choosing. Your analysis should include a careful description of the dataset and the individual variables, a discussion of the summary statistics of the dataset with a focus on understanding the strengths and weaknesses of the data for answering questions, one or more graphs illustrating the data, and a regression using some or all of the data. You will discuss what the regression can and cannot tell you, but are **not** required to identify a regression technique that allows you to make causal claims about a research question.

Deadlines:
- Mon 11/30: Push data and import code to project repo. If your dataset is too large to upload to Github, please make sure I know how to download the data and where to store it on my computer.
- Mon 12/7: Push interim progress update. This can be short but should be a brief update of where you stand on the project and any issues you are encountering. I encourage you to push in progress work to Github.
- Thurs 12/17: Push final project with working computer code

## Assignment Guidelines


Your completed analysis should have the following sections:

### Introduction (150-250 words)

Briefly introduce your dataset and why it is of interest. You may wish to provide some background information in this section, but this should be relatively brief. 

Summarize the key findings of the rest of the paper. In this case, that should include the most important things you identify in your data discussion and the findings from your regression model.

### Data Description (300-500 words plus tables, graphs)

*Note* The word count for this section is *very* rough. How much writing you will need to do will depend on what you discover in your data analysis. For a clean dataset with no missing values and a relatively small number of variables, you might have a relatively short section, but for messy data, this could be a long section. If you're concerned about how much or little you're writing in this section, feel free to reach out and discuss with me.

In this section, you will describe your dataset in detail -- likely in more detail than would usually be included in the data section of an economics paper. You should include the following elements:

- *Data source:* In addition to a precise specification of where you obtained the data, you should also discuss how the data was collected and any implications this may have for analysis of the data.

- *Data description:* Describe the information in detail. For smaller datasets, you should describe every variable included in the data. For large detailed survey data, you can describe the overall data in general terms and provide more detailed information on the variables you use. For any variable you use in the analysis, provide a specific description and explain the units in which the variable is measured. Moreover, you should describe the unit of observation in your data -- e.g. what identifies an "observation". If you are linking multiple datasets or different tables within a given dataset, explain exactly how the records were linked and provide an accounting of how many observations were matched.

- *Summary statistics:* Include a table of summary statistics for every numeric variable in your dataset and discuss the values. Are any of the values surprising? Look at histograms of the data distribution for every numeric variable and consider whether any seem unusual or might have implications for analysis. (You do not need to include the histograms within the paper, although you should include the code to produce them in your repository. For those using R, the histograms created by the `modelsummary::data_summary_skim()` function are sufficient. For categorical variables, either provide a frequency count (if there are a small number of values) within the table or produce one with code and assess whether there are any patterns in the frequencies that are unusual. Discuss patterns of missingness in the data. Do they appear random or might they be indicative of bias? How might the missingness affect conclusions from the analysis.

- *Visualization:* Include at least one and preferably several visualizations of part of your dataset. Consider whether you can use faceting, color, or other design elements to look at relationships among several different variables. Describe what we can learn from these visualizations.

### Regression analysis (200-300 words)

Run at least one regression investigating the relationship between different variables in your dataset. Interpret the coefficients and discuss what we can (and can't) conclude from the regression.

Discuss possible challenges to drawing strong conclusions from your regression. Topics you may want to consider include:

- reverse causality -- could your dependent variable be causing your independent variable?
- omitted variable bias -- are there are other factors that could influence the relationship between the variables that you are unable to control for?
- sample size/power (especially if you do not find statistically signficant relationships) -- how precise are your estimates? Is it likely that you would have found a relationship if one was there?

### Conclusion (75 - 200 words)

This section can be brief but should summarize what you learned in your data analysis and discuss one or both of the following:

- Based on your analysis of the data, what do you think are interesting ways this data might be used in the future? What types of research questions might you be able to answer with the data (with more time and/or training)?

- Based on your analysis of *this* data, what other data do you think it would be interesting to have to help understand a related research question. For instance, if you could combine this data with information on something else (describe what), what questions might you be able to answer?


## Possible locations for datasets

Because the topic is up to you, there are a wide variety of places you might look for datasets. If you are interested in a specific topic, you can send me an email or a message on Slack and I can try to help you find related datasets. If you need inspiration, the following resources have links to a wide variety of different types of data.

- The Smith library [Economics Research Guide](https://libguides.smith.edu/economics/statisticsdata)
- Various data pages from other university economics departments, including:

    * https://library.law.yale.edu/news/75-sources-economic-data-statistics-reports-and-commentary
    * https://libguides.northwestern.edu/data
    * https://guides.lib.umich.edu/c.php?g=282831&p=1888207