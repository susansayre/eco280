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

<table style="width:100%;">
<colgroup>
<col style="width: 35%" />
<col style="width: 32%" />
<col style="width: 32%" />
</colgroup>
<thead>
<tr class="header">
<th>Data task</th>
<th>dplyr commands</th>
<th>Stata commands</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>choosing/renaming variables</td>
<td>select, rename, relocate</td>
<td>keep, drop, rename, order</td>
</tr>
<tr class="even">
<td>sorting data</td>
<td>arrange</td>
<td>sort</td>
</tr>
<tr class="odd">
<td>subsetting data</td>
<td>filter</td>
<td>keep if, drop if</td>
</tr>
<tr class="even">
<td>creating/modifying variables</td>
<td>mutate</td>
<td>gen, replace, egen</td>
</tr>
<tr class="odd">
<td>computing summary statistics</td>
<td>summarize</td>
<td>summary, collapse</td>
</tr>
</tbody>
</table>

Unlike our previous homework assignments, for this homework assignment, I will provide an example of what I want the output to look like and will provide some suggestions on how to construct the code to accomplish this, but will not provide the specific code. Your job is to use the examples I demonstrated in class and those from the documentation provided to generate code that accomplishes its goal.

Full credit for the homework assignment requires:
- output matching the example (knitted html from .Rmd file and Stata output as described)
- an .Rmd file that will produce the expected output when knit to html
- Stata do file that produces the Stata output
- Stata log file from running the do file that contains no errors
