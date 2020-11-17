---
description: Programmatic data downloads and APIs
draft: false
title: HW 8 - Programmatic data downloads and APIs
---

## Submission details

- Commit and **push** working code and your output files to your github repo by 11:55pm EST on Mon Nov 24
- The assignment should be completed in either R or Stata, but you do *not* need to do it in both programs.

## Task summmary
Accept the [assignment repo](link) on github. There are two distinct and unrelated tasks to this assignment.

1. Revisit the Blue Bikes data we used earlier this semester. Write a short program to download all the data for 2015 through 2017 and combine it into a single file. Use this data to construct two graphs showing the total number of rides and the total duration of rides for each day throughout the entire time period. A couple notes:

    - We are stopping at the end of 2017 because the file naming convention changed twice during 2018. If you were actually using this data for a project, you'd need to write different import functions for the altered name conventions later in the time frame.

    - This task is more complicated than the one we did in class earlier because we functionally need to loop across two elements -- month and year. We will discuss how to do this in class on Wed 11/18.

    - You are likely to run into a problem where R will import the same variable with different data types in different files. When you hit this problem, you can fix it by adding a mutate statement after the read_csv function inside your import function.
    
2. The second task is entirely separate and asks you to work with the census api. Using the census api, download data on the sex and age of the population by county in 2008 and 2018 using the ACS 5-year estimates. Compute the change over those ten years in the percentage of the population aged 20-29. Note that you will need to combine several of the census variables to compute this total. In R, you may want to explore using either the `wide` or the `tidy` format of the data to see which seems easier to work with. 

Once you've computed the change, construct a histogram showing the distribution of the % change in the population aged 20-29 across counties. 