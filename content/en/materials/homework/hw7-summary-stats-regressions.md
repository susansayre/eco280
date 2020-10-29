---
date: "2020-01-28T00:36:14+09:00"
description: Summary statistics and regressions
draft: false
title: HW 7 - Summary stats and regressions
---

## Submission details

- Commit and **push** working code and your output files to your github repo by 12pm EST on Fri Nov 6
- The assignment should be completed in either R or Stata, but you do *not* need to do it in both programs. The tasks are described in an .Rmd document in the hw7 git repo.

## Task summmary

Accept the assignment repo on github. The repo contains the data and a more detailed description of the tasks.

There are four tasks to this assignment:

1. Look at summary statistics for the national park visitation data and the visibility data individually using the code and guidelines suggested in the [summary statistics and regression activity](/materials/activities/summary_statistics) activity. Write a brief description of what you learned about the data from this task. Based on what you learned, make and document any modifications to the data you think make sense based on your observations.

2. Compute monthly summary statistics for each park for the visibility data to generate data that can be merged with our monthly visit data. You should compute two summary statistics: the median and the 10th percentile. To compute the tenth percentile in R look at the help file for quantile(); in Stata, look at the help for collapse (note that one of the examples demonstrates computing multiple statistics in a single collapse statement). 

3. Merge the monthly visibility data with the visitation data and keep only the observations in both datasets.

4. Run a regression using the format described in the git repo. Briefly describe the results, offering interpretations of the coefficient estimates.