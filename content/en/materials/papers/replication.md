---
date: "2020-01-28T00:36:14+09:00"
description: Paper Replication
draft: false
title: Paper Replication
weight: 2
---

Working in a group or alone, you will develop a fully documented and reproducible replication of an existing table of regression results from a published economics paper. If the paper you are replicating includes a table of summary statistics and/or a plot of the data, you should replicate these as well. If it does not include a table of summary statistics, you will create one yourself. (Replicating the summary statistics is often an easier place to start and will help you replicate the regressions.)

## Submission details

All work will be submitted by pushing your work to your repo. Deadlines:

- Mon 10/26: Push brief summary of replication paper to group repo
- Mon 11/2: Push data and import code to group repo
- Mon 11/16: Submit paper replication which includes:

    -- Working code to generate your output
    -- A write-up of your replication following the guidelines below. You should submit both a PDF version of the write-up and your original source code (e.g. an Rmd, tex, or Word document). If you conduct your replication in R, you are welcome to use a single .Rmd file to contain both your write-up and your code.
    
## Groups

This assignment can be completed alone or in a group of up to three people. If you elect to work in a group, every member of the group is expected to contribute to writing the computer code and is responsible for understanding what all of the computer code does. If you begin working in a group and run into trouble, please let me know. Unless we've been in contact about group issues prior to the final submission deadline, all group members will receive the same grade.

## Selecting a paper

While you have considerable freedom to select the topic for the paper you choose to replicate, it is important to pick a paper that conforms to the assignment's structure. Specifically, you should pick a paper that:

- is an empirical paper that uses regression analysis to answer an economic question
- uses data that is either publicly available or provided with the paper
- uses a regression technique that you understand well enough to replicate or that you are willing to learn about as part of the replication assignment. If there is a paper you are interested in and you are unsure about how difficult the model it uses will be to replicate, please let me know.

Many economics papers will implement a large number of different regression models in the same paper and compare different specifications. Your goal is to replicate the main regression table from the paper, but depending on the paper specifics, it may not always be feasible to replicate the entire table. At a minimum, you must replicate at least one regression from the table.

Papers that are **not** suitable for this assignment include theory papers and any type of simulation or dynamic programming analysis. Papers that include an economic model and then conduct regressions are appropriate if the data is available. 

I encourage you to reach out via Slack or email to talk about possible paper ideas or possible topics. I have some ideas about papers that could be interesting to replicate and can help you search for a good paper within a particular topic. You should select the paper and push an initial summary to your repo by Mon 10/26, but please check with me on the paper before you start writing the summary -- I want to be sure your intended paper fits the assignment guidelines before you put too much work in.

## Write-up guidelines

In addition to replicating the code, you should write a description of your replication process. This does not need to be very long or detailed, but should include the elements described below. I anticipate your documents will be about three pages long without figures but this is not a precise length requirement or length limit. Please ask if you need feedback on whether you are describing your process in the right level of detail.

### Introduction

Once you have completed the replication, write an introduction that briefly outlines your work and your findings. Were you able to replicate all of the tables you attempted? What challenges did you run into while doing so? If you ran into challenges, these should be described in more depth in the later sections of the paper but should be briefly summarized in the introduction.

### Paper summary

Your replication write-up should begin with a summary of the paper you are replicating. Your summary should describe the question the paper addresses, what data it uses, and its regression strategy. Although you are not required to replicate every part of the paper, your summary should cover all major elements of the original paper, although if there are more than four or five regressions, it is fine to characterize the variations very broadly.

### Data

You should explain where the data came from and describe in detail how you acquired the data and any modifications that you made while importing the data. You should also discuss how thoroughly the paper described the data it used and any processing that was done.

Whether or not the paper you are replicating included a table of summary statistics, you should include one in your paper. It should provide at least the number of observations, the mean, standard deviation, maximum and minimum of every numeric variable in the dataset. For categorical variables, you should include a frequency count unless there are a large number of different types. (If you are using R, the `st()` function from the [vtable](https://nickch-k.github.io/vtable/index.html) package written by Nick Huntington-Klein does an excellent job of generating summary tables).

### Regression results

In this section, you should clearly specify the equation for the regression you ran to replicate the authors work. Describe **any** variations between your results and their results. The goal is to have your results exactly match theirs. In your own words, interpret the coefficients in the table you have replicated.

### References

Your references should include the paper you are replicating, the source of any data you used, and any other material (other than software help pages/manuals) while completing the replication, if applicable.