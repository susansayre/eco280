---
date: "2020-01-28T00:36:14+09:00"
title: HW 5 - Strings and dates
output: 
  md_document:
    preserve_yaml: true
    pandoc_args: ["--wrap=preserve"]
---

Submission details
==================

-   Click here to [accept the assignment](https://classroom.github.com/a/hvTcQDmh) on GitHub classroom
-   Commit and **push** working code to your github repo by 10:45am EST on Wed 10/21

Learning objectives
===================

This homework is designed to give you practice with two important data wrangling skills (that are often used in conjunction): merging two datasets and reshaping data. Specific topics include:

-   what it means to “reshape” data
-   when reshaping might be useful
-   how to reshape data in both Stata and R
-   different types of merge operations
-   merging data safely (and how to check the results)
-   different merge commands in R and Stata

Overview
========

The specific task in this homework assignment is to create a graph of per capita electricity consumption by US state across sectors for the year 2018. You can complete the task in either Stata or R, but are not required to do it in both programs. I encourage (but do not require) you to pick the program you feel less confident working with to build your skills.

The EIA data is in the [hw6 repository](https://classroom.github.com/a/RcFTR5pM), along with code to import it into both R and Stata.

As you work with this data, note three important facts: (1) there is a note at the bottom of the spreadsheet that says that Part C should be included when generating state level totals for **revenues** but not for other measures; (2) the columns have a mix of an identifying variable (sector) and different actual variables (sales, customers, revenue); (3) surprisingly, utility\_name, state, and part do **not** uniquely identify rows because there are “adjustments” and utilities with their names withheld.

The last issue will cause problems when we try to reshape our data. To mitigate this problem, your first task is to select only the variables we care about (utility\_name, state, part, and all of the revenues, sales, and customers columns) and then use the first three variables to identify rows and compute totals for all the remaining columns. You can do this with the command `summarize_all(sum, na.rm = T)` which tells R to compute totals for all non-grouping variables and remove missing values in the computation.

Once we’ve taken care of the totals, your next task is to use `pivot_longer` to generate a table that has the three identifying variables(utility\_name, state, part) with a single column of data with another column identifying which of the sector/total combinations the data represents.

This representation doesn’t really work either though, because now we have different variables (revenues, sales, customers) showing up as different observations. To fix this, we need to use string functions to separate our variable names and then `pivot_wider` to get to our final data format. Ultimately, we want columns for utility\_name, state, part, sector, revenues, sales, and customers.

Once you have this table, we need to compute sums by state that reflect the note mentioned above; that is, we want to sum all parts for revenues, but only sum parts A, B, and D for sales and customers.
