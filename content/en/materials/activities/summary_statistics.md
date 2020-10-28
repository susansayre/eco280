---
title: "Summary statistics"
author: "Susan Sayre"
date: "10/21/2020"
weight: 7
output: 
  md_document:
    preserve_yaml: true
    pandoc_args: ["--wrap=preserve"]
---

When you begin working with new data, one of your important tasks is to “get to know your data”. To be thorough and careful, you will often want to do this with **both** your raw data as soon as you read it in **and** your final data once you have processed and “wrangled” it. This can help make sure that you have not introduced bias through processing your data. For instance, if a key merging variable is missing for many observations that are systematically different than the rest of the population, there will be noticeable differences between summary statistics for your raw data and your processed data. Sometimes this is unavoidable, but you should be aware of (and discuss in your work) the possible implications.

Summary statistics for numerical variables
------------------------------------------

You should compute summary statistics for each of your numeric variables. At a minimum, your summary statistics should include the mean, standard deviation, max, and mean for each variable. In addition to these, I often suggest looking at the median and the 25th and 75th percentile.

Once you have created the summary statistics, **look at them closely.** Do all of the means make sense? What about the standard deviations? Sometimes, this can help you identify categorical variables stored as numbers. For instance, if you have a value for a “mean” race, that’s probably an indication that the categorical race variable was encoded as a numeric one.

What about the maximum and minimum values? Do these imply possible issues with outliers or incorrectly coded data? What about missing values stored as unusual numbers? If you’ve looked at the medians and the percentiles, do you see evidence of a skewed distribution. Consider plotting histograms for the variables. Think about what the distribution of the data might imply for how you plan to use it.

Frequency counts for categorical variables
------------------------------------------

Categorical variables in your data come in two different types: ones with “a few” possible values and ones with “lots” of possible values. It is generally a good idea to look at frequency counts for your categorical variables in one of two ways:

### Few possible values

For categorical variables with a “few” possible values, compute standard frequency counts that tell you the number of observations in each category. You should make sure to determine not only the number of observations with each possible value, but also the number of observations for which the value is missing. Depending on your purpose, you may choose to present either the raw counts, the percentage of observations, or both.

### Cross-tabs

For some categorical variables with a “few” observations, you may want to report cross-tab frequencies. For instance, if you had variables for employment status and marital status, you might find the cross-tabs telling you whether unemployment status looks different for married individuals vs unmarried individuals interesting. There is no hard and fast rule on when you should compute cross-tabs; it depends on your research question and whether you think the cross-tabs will matter. A common case where you probably *should* include cross-tabs is when you are testing the impact of a categorical variable.

### Many possible values

For variables with “lots” of possible values, it is generally impractical to report full frequency counts. Instead, I often find it useful to compute frequency counts of the frequency counts. That is, I will first compute a standard frequency count of how often each categorical value appears in the dataset. Then I will compute frequency counts of the frequency values – e.g. how many categorical values appear once, twice, 10 times, etc. This information is not always useful but could be, especially for identifying possible duplicate observations or for understanding whether your dataset is balanced along some important dimension.

As with cross-tabs, there is no hard and fast rule that defines what constitutes a variable with “few” values vs one with “lots” of values, nor is there is a clear indication of when it is important to look at frequency counts of frequency counts versus not summarizing the variables with many observations. I generally do the latter when it will cause problems for my analysis if the frequency of different frequencies within the data will matter. While this can be done automatically by some commands (like `vtable::vt()` in R), I often find that I need to do it manually. You can generate a table like this in R by running:

    frequency_counts <- dataframe %>% 
      group_by(categorial_var) %>% 
      summarize(frequency = n())

    counts_of_freq_counts <- frequency_counts %>% 
      group_by(frequency) %>% 
      summarize(count = n())

where `dataframe` is the object containing the data and `categorical_var` is the variable with “lots” of different possible values.

To accomplish the same thing in Stata, we could run:

    preserve
    contract categorical_var, freq(frequency)

    contract frequency
    list
    restore

where the data we want to summarize is currently in memory and `categorical_var` is the variable with “lots” of different possible values. We could also include a list of categorical variables to get cross-tab frequencies

It is unusual that you would want to include these information in a paper, but it can be very important for understanding the structure of your data.

Code for computing summary statistics and regressions
-----------------------------------------------------

In class, we worked through several activities on how to compute summary statistics, run regressions and generate tables in R and Stata. The data and code to accomplish these are stored in a [github repo](https://github.com/eco280/summary-stats-regression) in our class organization that you can clone but cannot push to.
