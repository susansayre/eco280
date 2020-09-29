---
date: "2020-01-28T00:36:14+09:00"
title: HW 4 - Data wrangling
output: 
  md_document:
    preserve_yaml: true
    pandoc_args: ["--wrap=preserve"]

---

Submission details
------------------

-   Commit and **push** working code to your github repo by 9am EST on **Thurs 10/8**
-   Note atypical due date due to Mountain Day adjustments

Learning objectives
-------------------

This homework is designed to give you practice working with five basic data wrangling tasks. There are many tutorials online describing the “five main verbs” of `dplyr` (which is part of the `tidyverse`) that show how to accomplish these tasks in R using dplyr/tidyverse. This homework asks you to complete the tasks in both R and Stata. The five basic operations and associated commands are:

| Data task                   | dplyr commands           | Stata commands           |
|-----------------------------|--------------------------|--------------------------|
| choosing/renaming variables | select, rename, relocate | keep, drop, rename, order| 
| sorting data                | arrange                  | sort                     | 
| subsetting data             | filter                   | keep if, drop if         | 
| creating/modifying variables| mutate                   | gen, replace, egen       | 
| computing summary statistics| summarize                | summary, collapse        | 

Unlike our previous homework assignments, for this homework assignment, I will provide an example of what I want the output to look like and will provide some suggestions on how to construct the code to accomplish this, but will not provide the specific code. Your job is to use the examples I demonstrated in class and those from the documentation provided to generate code that accomplishes its goal.

Full credit for the homework assignment requires:
- output matching the example (knitted html from .Rmd file and Stata output as described)
- an .Rmd file that will produce the expected output when knit to html
- Stata do file that produces the Stata output
- Stata log file from running the do file that contains no errors
