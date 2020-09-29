---
date: "2020-01-28T00:36:14+09:00"
title: HW 4 - Data wrangling
output: 
  md_document:
    preserve_yaml: true
    pandoc_args: ["--wrap=preserve"]
---

Submission details
==================

-   Commit and **push** working code to your github repo by 9am EST on **Thurs 10/8**
-   Note atypical due date due to Mountain Day adjustments

Learning objectives
===================

This homework is designed to give you practice working with five basic data wrangling tasks using data from the New York Times on coronavirus cases. There are many tutorials online describing the “five main verbs” of `dplyr` (which is part of the `tidyverse`) that show how to accomplish these tasks in R using dplyr/tidyverse. This homework asks you to complete the tasks in both R and Stata. The five basic operations and associated commands are:

<table>
<thead>
<tr class="header">
<th style="text-align: center;">Data task</th>
<th style="text-align: center;">dplyr commands</th>
<th style="text-align: center;">Stata commands</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;">choosing/renaming variables</td>
<td style="text-align: center;">select, rename, relocate</td>
<td style="text-align: center;">keep, drop, rename, order</td>
</tr>
<tr class="even">
<td style="text-align: center;">sorting data</td>
<td style="text-align: center;">arrange</td>
<td style="text-align: center;">sort</td>
</tr>
<tr class="odd">
<td style="text-align: center;">subsetting data</td>
<td style="text-align: center;">filter</td>
<td style="text-align: center;">keep if, drop if</td>
</tr>
<tr class="even">
<td style="text-align: center;">creating/modifying variables</td>
<td style="text-align: center;">mutate</td>
<td style="text-align: center;">gen, replace, egen</td>
</tr>
<tr class="odd">
<td style="text-align: center;">computing summary statistics</td>
<td style="text-align: center;">summarize</td>
<td style="text-align: center;">summary, collapse</td>
</tr>
</tbody>
</table>

Unlike our previous homework assignments, for this homework assignment, I will provide an example of what I want the output to look like and will provide some suggestions on how to construct the code to accomplish this, but will not provide the specific code. Your job is to use the examples I demonstrated in class and those from the documentation provided to generate code that accomplishes its goal.

Full credit for the homework assignment requires:
- output matching the example (knitted html from .Rmd file and Stata output as described)
- an .Rmd file that will produce the expected output when knit to html
- Stata do file that produces the Stata output
- Stata log file from running the do file that contains no errors

Generate table of data
======================

For this assignment, begin with R and conduct your analysis in an RMarkdown document. It should contain several sections with headers to identify them.

Data source
-----------

This section should include a short statement of where you located the data. You will be downloading the data from the [New York Times coronavirus git repo](https://github.com/nytimes/covid-19-data). You should read through the description of the data and provide a very brief description of the data and any important things you notice from the description here. (This should not be long. 1-4 sentences is sufficient.)

The specific file link is <https://raw.githubusercontent.com/nytimes/covid-19-data/master/live/us-counties.csv>. Download the data to your computer, store it as a .csv file in a folder called data and create a markdown file (*not an RMarkdown file*) called README.md inside the data folder that describes where you got the data.

Basic data table
----------------

Your first task is to construct a table of the total number of new cases each day in each of the six New England states (Connecticut, Massachusetts, Rhode Island, Maine, Vermont, and New Hampshire) starting on March 15, 2020 and continuing through the day you downloaded the data. Note that the New York Times data archive does include data by state, but your job is to start with the *county* level data to construct the state measures.

Since the data only reports total cases to date, you will need to construct the new cases each day by using dplyr’s `lag()` function. To use this function, you’ll also want to sort the data by geographic region and by date and then group by geographic region. Then `lag(cases)` will give you the value of `cases` in a particular jurisdiction on the previous day.

To get from county level data to state level data, you’ll need to follow the steps from class to compute totals.

You should also make sure that only the data for New England is included and that the variables are in the order shown in the example table and have the same names. Use the head() function to print the first few rows of the table in your output.

Once you’ve generated the table in your Rmd, construct a do file that creates the same table in Stata. You do **not** need to complete the remaining tasks in Stata. Push your do file and a log file to git. To generate the new case variable in Stata, adapt the code from [this manual page](https://www.stata.com/support/faqs/data-management/creating-lagged-variables/).

Investigate the data
--------------------

Find that maximum and minimum number of new cases reported on an individual day in each state. (You do **not** need to keep track of *which* day this occurred on). Have your code print the answer in a table by state. After the table describe what you notice in a text section of the .Rmd file.

Using the `wday()` function from the lubridate package, find the day of the week for each day and compute the average number of new cases for each day of the week. Print a table of your answer and describe any pattern you notice.

Generate a plot
---------------

Generate a series of side-by-side plots of new cases by day in each state by day that looks like the example. When you first plot the data, at least one state will look very different. Write a brief description of the changes you have to make to get the graph to look like the example and use the `caption = "caption text"` argument to the `labs()` layer of your ggplot call to add a note to the chart explaining the change you made. (Hint: one of the earlier tasks may help you determine what to change.)
