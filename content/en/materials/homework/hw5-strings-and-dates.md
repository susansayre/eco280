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

-   Click here to [accept the assignment](https://classroom.github.com/a/1iAQMOnr) on GitHub classroom
-   Commit and **push** working code to your github repo by 10:45am EST on Wed 10/21

Learning objectives
===================

This homework is designed to give you practice working with string and date variables. We have seen some of these tasks in our earlier work but will focus exclusively on these today.

We will use the `lubridate` and `stringr` packages in R. The `stringr` package is considered a core part of the tidyverse and is loaded whenever tidyverse is loaded but the `lubridate` package needs to be loaded separately using a library command.

We will work with two separate datasets. With the first dataset, we will focus primarily on manipulating string variables to construct measures of interest. For the second, we will work with dates more.

Both sets of tasks should be completed in both R and Stata.

Re-organize census data
-----------------------

For this task, you will begin by downloading data on the racial demographics of US metropolitan and micropolitan areas. To find this data, go to [data.census.gov](https://data.census.gov/cedsci/) and search for race. Select the second table on the list, which says

    RACE
    Survey/Program: American Community Survey
    Universe: Total population
    TableID: B02001

Click the “Customize Table” button and choose `Geographies`. Scroll down until you see Metropolitan Statistical Area/Micropolitan Statistical Area. Select this and then click the box that says “All Metropolitan Statistical Areas/Micropolitan Statistical Areas within United States”. Click Close and the choose Download. Leave the default options checked (1 year 2019) and download the resulting file to the data directory of your assignment repo. Unzip the file. (Note: As long as you don’t change the data itself, you *are* allowed to change the file names.)

Read the data into your program and then use a combination of string functions to generate a table that looks like the one below. You should remove any rows for which data is not available. (Note: the reason some rows do not have data is that demographic estimates are not generated annually for some of the smaller regions). Generating this table will require you to change the data type of several variables and to extract parts of the string variables. There is no single correct set up steps to get from beginning to end. It is likely that you will find it helpful to create some intermediate variables that you will ultimately drop.

    ## # A tibble: 492 x 7
    ##    cbsa_code area_type cities   states percent_white percent_black percent_asian
    ##    <chr>     <chr>     <chr>    <chr>          <dbl>         <dbl>         <dbl>
    ##  1 10140     Micro     Aberdeen WA             0.870       0.0252        0.0128 
    ##  2 10180     Metro     Abilene  TX             0.815       0.0873        0.0174 
    ##  3 10300     Micro     Adrian   MI             0.941       0.0192        0.00367
    ##  4 10380     Metro     Aguadil~ PR             0.762       0.0225        0      
    ##  5 10420     Metro     Akron    OH             0.807       0.126         0.0305 
    ##  6 10460     Micro     Alamogo~ NM             0.781       0.0406        0.00667
    ##  7 10500     Metro     Albany   GA             0.409       0.548         0.0151 
    ##  8 10540     Metro     Albany-~ OR             0.888       0.00577       0.00936
    ##  9 10580     Metro     Albany-~ NY             0.820       0.0769        0.0449 
    ## 10 10700     Micro     Albertv~ AL             0.933       0.0395        0.00613
    ## # ... with 482 more rows

Once you’ve created the table, look at the six regions with the highest percentage of each of the demographic groups. (Look back at last week to see how to get the first six observations. What do you need to do to make sure the first six are the ones you want?) Are these consistent with what you would have expected?

Identify bike use patterns
--------------------------

A Boston bike share company (BlueBikes) has made its bike use data publicly available. Visit their [data archive](https://s3.amazonaws.com/hubway-data/index.html) and download the data for July 2020. Using this data, answer the following questions:

1.  Which day of the week sees the most rentals on average?
2.  Is this the same as the day that sees the longest total minutes of riding on average?
3.  Graph the average number of trips starting in each hour of the day. Construct separate graphs for weekdays and weekends. What do you notice about the pattern?
4.  How many bikes were rented at a station whose name includes the word “Harvard”? How many were returned to a station whose name includes the word “MIT”?
