---
title: "Reshaping and merging data"
author: "Susan Sayre"
weight: 3
output: 
  md_document:
    preserve_yaml: true
    pandoc_args: ["--wrap=preserve"]
---

Reshaping
---------

In class, we worked on reshaping the population data that will be used in [HW 6](/materials/homework/hw6-mergining-and-reshaping). The data we started with is located in the data directory of the hw6 repository.

You can download the completed code from the class exercises [in R](/docs/hw6/reshaping-code.Rmd) and [Stata](/docs/hw6/reshaping-code.do). Note that there are two changes to these files since class:

1.  The R code shows how to “escape” the . so that we can remove the leading periods instead of the leading characters.

2.  The Stata code uses a list to rename all of the population variables at once.

Since HW 6 asks you to work with only the 2018 population data, you do *not* need to submit this code with your hw 6 repo, but it is also fine if you do include it.

Merging
-------

I recorded videos in Panopto showing how to do basic merging in both R and Stata. You can download the two files used in the videos: [sales data](/docs/sales_data.csv) and [team info](/docs/team_info.csv)
[R tutorial video](https://smith.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=b3b90423-10fd-4f91-b97f-ac5d014f5bae) || [R code](/docs/hw6/merging.Rmd) || [Stata tutorial video](https://smith.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=ac0512f9-1275-4d98-8794-ac5c012ba8d5) || [Stata code](/docs/hw6/merging_example.do) || [Stata code merging in other direction](/docs/hw6/merging_example_team_first.do)

While merging may seem like a simple task, it is the source of *lots* of coding errors. One key to merging data successfully is making sure that you know what uniquely identifies observations in both of your datasets (called the **key**). A key can be a single variable or a group of variables. One common source of problems is *assuming* this instead of actually checking.

A quick way to check whether you’re right about what uniquely identifies an observation in R is to run

    dataset %>% group_by(key_var_list) %>% summarize(count = n()) %>% filter(count>1)

If you’re right that the key or list of keys uniquely identify the observations, you’ll get an empty dataframe, but if there are multiple observations sharing the same values for all the key variables, you’ll get a list of these and can use that to diagnose the problem.

A second tip is to make sure you check how many observations you have both before and after your merge statements and to make sure that the numbers make sense.
