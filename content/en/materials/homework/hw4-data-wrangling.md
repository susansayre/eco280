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
<tbody>
<tr class="odd">
<td style="text-align: center;"><strong>Data task</strong></td>
<td style="text-align: left;"><strong>dplyr commands</strong></td>
<td style="text-align: left;"><strong>Stata commands</strong></td>
</tr>
<tr class="even">
<td style="text-align: center;">choosing/renaming variables</td>
<td style="text-align: left;">select, rename, relocate</td>
<td style="text-align: left;">keep, drop, rename, order</td>
</tr>
<tr class="odd">
<td style="text-align: center;">sorting data</td>
<td style="text-align: left;">arrange</td>
<td style="text-align: left;">sort</td>
</tr>
<tr class="even">
<td style="text-align: center;">subsetting data</td>
<td style="text-align: left;">filter</td>
<td style="text-align: left;">keep if, drop if</td>
</tr>
<tr class="odd">
<td style="text-align: center;">creating/modifying variables</td>
<td style="text-align: left;">mutate</td>
<td style="text-align: left;">gen, replace, egen</td>
</tr>
<tr class="even">
<td style="text-align: center;">computing summary statistics</td>
<td style="text-align: left;">summarize</td>
<td style="text-align: left;">summary, collapse</td>
</tr>
</tbody>
</table>

Unlike our previous homework assignments, for this homework assignment, I will provide an example of what I want the output to look like and will provide some suggestions on how to construct the code to accomplish this, but will not provide the specific code. Your job is to use the examples I demonstrated in class and those from the documentation provided to generate code that accomplishes its goal.

Full credit for the homework assignment requires:
- A knitted html file produced from the .Rmd file that contains output matching the examples
- The .Rmd file that produces the html file
- A Stata do file that produces a dataset matching the basic table described below
- The Stata log file from running the do file that contains no errors

For this assignment, begin with R and conduct your analysis in an RMarkdown document. It should contain several sections with headers to identify them.

Data source
-----------

This section should include a short statement of where you located the data. You will be downloading the data from the [New York Times coronavirus git repo](https://github.com/nytimes/covid-19-data). You should read through the description of the data and provide a very brief description of the data and any important things you notice from the description here. (This should not be long. 1-4 sentences is sufficient.)

The specific file link is <https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv>. You can supply this url directly to the read\_csv() function to read in the data or you can download the data to your computer, store it as a .csv file in a folder called data and create a markdown file (*not an RMarkdown file*) called README.md inside the data folder that describes where you got the data. Similarly, data can be directly read into Stata by providing the url instead of a filename.

Basic data table
----------------

Your first task is to construct a table containing the total cases and the new cases each day for each county in one of the six New England states (Connecticut, Massachusetts, Rhode Island, Maine, Vermont, and New Hampshire) starting on March 15, 2020 and continuing through the day you downloaded the data. It should contain only these variables.

Since the data only reports total cases to date, you will need to construct the new cases each day by using dplyr’s `lag()` function. To use this function, you’ll also want to sort the data by geographic region and by date and then group by geographic region. Then `lag(cases)` will give you the value of `cases` in a particular jurisdiction on the previous day. Once you’ve constructed the table, use the head() function to print the first few rows of data in your output. It should look like this:

    ## # A tibble: 6 x 5
    ## # Groups:   county, state [6]
    ##   date       county       state       new_cases total_cases
    ##   <date>     <chr>        <chr>           <dbl>       <dbl>
    ## 1 2020-03-15 Fairfield    Connecticut         1          16
    ## 2 2020-03-15 Hartford     Connecticut         2           3
    ## 3 2020-03-15 Litchfield   Connecticut         1           4
    ## 4 2020-03-15 New Haven    Connecticut         2           3
    ## 5 2020-03-15 Androscoggin Maine               0           1
    ## 6 2020-03-15 Cumberland   Maine               8          10

Next, you should total by state to get state level totals on new\_cases per day using the methods we discussed in class. Note that the New York Times data archive does include data by state, but your job is to start with the *county* level data to construct the state measures.

Print the first few rows using the head() function; they should look like this:

    ## # A tibble: 6 x 4
    ## # Groups:   date [1]
    ##   date       state         new_cases cases_to_date
    ##   <date>     <chr>             <dbl>         <dbl>
    ## 1 2020-03-15 Connecticut           6            26
    ## 2 2020-03-15 Maine                 8            12
    ## 3 2020-03-15 Massachusetts        22           164
    ## 4 2020-03-15 New Hampshire         5            13
    ## 5 2020-03-15 Rhode Island          0            20
    ## 6 2020-03-15 Vermont               3             8

Once you’ve generated the table in your Rmd, construct a do file that creates the same two tables in Stata. You can print the first few rows of data in Stata using the command `list in 1/6`. You do **not** need to complete the remaining tasks in Stata, although if you are relatively experienced using R, I strongly encourage you to experiment to see if you *can* complete them in Stata. Push your do file and a log file to git. To generate the new case variable in Stata, adapt the code from [this manual page](https://www.stata.com/support/faqs/data-management/creating-lagged-variables/).

Investigate the data
--------------------

Find that maximum and minimum number of new cases reported on an individual day in each state. (You do **not** need to keep track of *which* day this occurred on). Have your code print the answer in a table by state using either the head() or the print() function. After the table describe what you notice in a text section of the .Rmd file. Your table should look like this one, but will contain data for the New England states instead of these ones.

    ## Warning in max(new_cases): no non-missing arguments to max; returning -Inf

    ## Warning in min(new_cases): no non-missing arguments to min; returning Inf

    ## # A tibble: 0 x 3
    ## # ... with 3 variables: state <chr>, max_daily_new_cases <dbl>,
    ## #   min_daily_new_cases <dbl>

Using the `wday()` function from the lubridate package, find the day of the week for each day and compute the average number of new cases for each day of the week. Again, use head() or print() to share the results and describe any pattern you notice.

Generate a plot
---------------

Generate a series of side-by-side plots of new cases by day in each state by day overlayed with a smoothed line showing how new\_deaths have changed over time. Use the default smoothing method (“loess”). You’ll need to use the facet\_wrap() layer to create the small multiples. Try typing `?facet_wrap` in the console to figure out how to set the axes to vary across states so that you can see the lines for all the states.

Your plot should ultimately look like the example below. When you first plot the data, at least one state will look very different. Write a brief description of the changes you have to make to get the graph to look like the example and use the `caption = "caption text"` argument to the `labs()` layer of your ggplot call to add a note to the chart explaining the change you made. (Hint: one of the earlier tasks may help you determine what to change.)

![](hw4-data-wrangling_files/figure-markdown_strict/new%20cases%20plot-1.png)
