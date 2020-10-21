---
date: "2020-01-28T00:36:14+09:00"
title: HW 6 - Merging and Reshaping
output: 
  md_document:
    preserve_yaml: true
    pandoc_args: ["--wrap=preserve"]
---

Submission details
==================

-   Click here to [accept the assignment](https://classroom.github.com/a/RcFTR5pM) on GitHub classroom
-   Commit and **push** working code to your github repo by 10:45am EST on Wed 10/28

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

Our task is to use data collected by the Energy Information Administration (EIA) on Form 861 to construct a table listing total revenues, sales, and customers by sector and state for the year 2018, along with a stacked bar chart showing per capita total energy sales by state. The data is not formatted very nicely initially and we need to merge in population data from the US census. You can complete the task in either Stata or R, but are not required to do it in both programs. I encourage (but do not require) you to pick the program you feel less confident working with to build your skills.

The EIA data is in the [hw6 repository](https://classroom.github.com/a/RcFTR5pM), along with code to import it into both R and Stata. The population data is also there and we demonstrated how to read that data into R and Stata in class on 10/21.

As you work with this data, note three important facts: (1) there is a note at the bottom of the spreadsheet that says that Part C should be included when generating state level totals for **revenues** but not for other measures; (2) the column names have a mix of an identifying variable (sector) and different actual variables (sales, customers, revenue); (3) surprisingly, utility\_name, state, and part do **not** uniquely identify rows because there are “adjustments” and utilities with their names withheld.

Construct a dataset with unique identifiers
-------------------------------------------

The last issue will cause problems when we try to reshape our data. To mitigate this problem, your first task is to select only the variables we care about (utility\_name, state, part, and all of the revenues, sales, and customers columns) and then use the first three variables to identify rows and compute totals for all the remaining columns.

You can do this in R by using a special form of the summarize function `summarize_all(sum, na.rm = T)` which tells R to compute totals for all non-grouping variables and remove missing values in the computation.

In Stata, you’ll use the regular `collapse (sum) varlist, by(grouping_vars separated by spaces)` syntax but since you have so many variables to sum across, you can use `value*` as a shorthand for any variable that begins with value. (See [variable lists in Stata](https://www.stata.com/support/faqs/data-management/shortcuts-to-refer-multiple-variables/) for other examples of ways to get lists of variables without typing all the names).

Pivot or reshape your data to get a long format
-----------------------------------------------

Once we’ve taken care of the totals, your next task is to reorganize the data to generate a table that has the three identifying variables (utility\_name, state, part), a column called something like sector\_datatype whose values will be the names of the sector\_variable type columns (e.g. `residential_revenue`, `commercial_sales`, etc.), and a final column containing the values.

In R, you’ll be using a `pivot_longer` statement, while in Stata you’ll use `reshape long`. Note that since Stata requires all the variables you’re turning into observations to share a common “stub”, the Stata import command put the prefix `value_` in front of all these variables. Moreover, since the names that come after the value\_ “stub” aren’t numeric, you need to include the option `string` at the end of your reshape command.

Pivot/reshape back to separate sector from data type
----------------------------------------------------

The format of the data at the end of the previous step doesn’t really work either though, because now we have different variables (revenues, sales, customers) showing up as different observations. To fix this, we need to use string functions to separate our newly constructed column containing the old variable names into pieces for the sector (residential, industrial, etc) and the data type (revenues, sales, customers). Once we have the data that way, we can go back to a wide format. Ultimately, we want columns for utility\_name, state, part, sector, revenues, sales, and customers.

In R, you’ll use `pivot_wider` while in Stata, you’ll use `reshape wide`. Note that you’ll need the string option again in Stata.

Compute state totals for revenues, sales, and customers
-------------------------------------------------------

Before computing the totals, we want to address the fact that our `part == "C"` observations should not be counted in our totals for sales or customers (but should be counted for revenues). There are a couple ways to handle this. You could go back to the part of the code where your data is in long format and drop some rows or you could replace some of the values with 0 while your data is in either long or wide format.

Once you’ve addressed this complication, you should compute state/sector level totals for revenues, sales, and customers leaving you with a table with five columns: state, sector, revenues, sales, and customers.

You’re now ready to get your population data ready to merge with the electricity data. In Stata, you’ll need to save the dataset you’ve just created so you can load a new one. Do this by typing `save electricity_data, replace`. This will save your current data in a file called `electricity_data.dta`. The replace option means that the data will be overwritten when you re-run the code.

Prepare the population data
---------------------------

Use the population data that we worked with in class to generate a table that has two columns, one for state and one for the 2018 population. (You don’t need any of the other years for this homework.)

For reference, the import code for this file in R from class is:

    population_wide <- readxl::read_xlsx("data/nst-est2019-01.xlsx",
                                         range = "A4:M62") %>% 
      rename(state_name = `...1`)

In Stata, the code looks like this (with an addition to rename *all* of the population variables from 2011-2019. Unfortunately, it only works for variables whose last digits are numbered 1, 2, … so we have to do 2010 manually):

    import excel data/nst-est2019-01.xlsx, cellrange("A4:M62") firstrow
    rename A state_name
    rename D pop2010
    rename (E-M) pop201#, addnumber

Notice that this data identifies states by their full names while our electricity data identifies them by abbreviation. We need to add the state abbreviations to our population data to allow us to merge the files. Follow the steps in the Panopto video on merging for the program you are using. You can download the [state\_match.csv](/docs/state_match.csv) file or construct your own. (R has built in objects called state.abb and state.name – although you have to add DC – and there is a custom Stata package called [statastates](https://github.com/wschpero/statastates) that adds commands for handling this.)

You’ll run into some trouble with the national total, the regions, and Puerto Rico, but since none of these appear in our electricity data, you can either drop these cases or leave them in your match file and drop them when you connect with the electricity data.

Once you have a dataset with state\_name (containing full names), state (containing abbreviations), and a variable with the 2018 population, you’re ready to merge the population data with your electricity data.

Merge population and electricity data
-------------------------------------

For this step, you want to merge the two datasets. Think carefully about what type of merge you want to do. Your ultimate goal is to have a dataset with each row representing a unique combination of state (including DC) and sector and with variables for revenues, sales, customers, and sales per capita. How many rows do you expect to have in your final data? Did your merge generate that number of rows?

Generate a graph of per capita sales for each state
---------------------------------------------------

Your chart should be a stacked bar chart, with one bar for each state containing segments that are different colors for the different sectors. Once you’ve constructed the graph, look closely and decide what it shows you. What does the total height of the bar tell you? Adjust the graph as needed to generate a plot that makes sense to you.

### Stacked bar chart in R

For R, the basic code for a stacked bar chart is

    ggplot(dataset, aes(x_var,y_var)) + geom_col(aes(fill = cat_var))

where `x_var` is the (categorical) variable that identifies the bar, `y_var` tells us about the height of the bar, and `cat_var` is a second categorical variable identifying the different sections of the bars. If your plot is too hard to read, you can make it wider by using the option `fig.width` in the title row of your R chunk. (The brackets will look like: `{r chunk name, fig.width = 8}`) Adjust the width number until you’re happy with the output.

A side note: ggplot’s defaults for axes are often not great with economic data. Negative values wouldn’t make a lot of sense here. Forcing ggplot to start at the origin is less straightforward than I would like. One way to accomplish it is to end your regular ggplot line with a `+` and add the line:

    scale_y_continuous(limits = c(0, NA), expand = expansion(mult = c(0, 0.1)))

This works in most cases I’ve run across but may not always. There may well be better ways to accomplish this and I don’t mind if you leave the defaults for this class.

### Stacked bar chart in Stata

For Stata, the basic code for a stacked bar chart (with vertical category labels) is

    graph bar (asis) y_var, over(cat_var) over(x_var, label(angle(vertical))) asyvars stack

with the variables defined as in the R section. Note that the `asyvars` option is what tells Stata to treat the cat\_var as differently filled sections and the `stack` options tells Stata to stack the choices (eliminating it would get you a grouped bar chart). You can control the width of the Stata graph by adding `xsize(#)` at the end of the command.

If you use Stata, be sure to save your graph as .png file and push the graph to github as well.
