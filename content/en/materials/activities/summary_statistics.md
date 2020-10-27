---
title: "Summary statistics"
author: "Susan Sayre"
date: "10/21/2020"
weight: 7
always_allow_html: true
output: 
  md_document:
    preserve_yaml: true
    pandoc_args: ["--wrap=preserve"]
---

When you begin working with new data, one of your important tasks is to “get to know your data”. To be thorough and careful, you will often want to do this with **both** your raw data as soon as you read it in **and** your final data once you have processed and “wrangled” it. This can help make sure that you have not introduced bias through processing your data. For instance, if a key merging variable is missing for many observations that are systematically different than the rest of the population, there will be noticeable differences between summary statistics for your raw data and your processed data. Sometimes this is unavoidable, but you should be aware of (and discuss in your work) the possible implications.

Summary statistics for numerical variables
------------------------------------------

You should compute summary statistics for each of your numeric variables. At a minimum, your summary statistics should include the mean, standard deviation, max, and mean for each variable. In addition to these, I often suggest looking at the median and the 25th and 75th percentile.

Once you have created the summary statistics, **look at them closely.** Do all of the means make sense? What about the maximum and minimum values? If you’ve looked at the medians and the percentiles, do you see evidence of a skewed distribution. Consider plotting histograms for the variables. Think about what the distribution of the data might imply for how you plan to use it.

Frequency counts for categorical variables
------------------------------------------

Categorical variables in your data come in two different types: ones with “a few” possible values and ones with “lots” of possible values. It is generally a good idea to look at frequency counts for your categorical variables in one of two ways:

-   For categorical variables with a “few” possible values, compute standard frequency counts that tell you the number of observations in each category. You should make sure to determine not only the number of observations with each possible value, but also the number of observations for which the value is missing. Depending on your purpose, you may choose to present either the raw counts, the percentage of observations, or both.

-   For some categorical variables with a “few” observations, you may want to report cross-tab frequencies. For instance, if you had variables for employment status and marital status, you might find the cross-tabs telling you whether unemployment status looks different for married individuals vs unmarried individuals interesting. There is no hard and fast rule on when you should compute cross-tabs; it depends on your research question and whether you think the cross-tabs will matter. A common case where you probably *should* include cross-tabs is when you are testing the impact of a categorical variable.

-   For variables with “lots” of possible values, it is generally impractical to report full frequency counts. Instead, I often find it useful to compute frequency counts of the frequency counts. That is, I will first compute a standard frequency count of how often each categorical value appears in the dataset. Then I will compute frequency counts of the frequency values – e.g. how many categorical values appear once, twice, 10 times, etc. This information is not always useful but could be. As with cross-tabs, there is no hard and fast rule that defines what constitutes a variable with “few” values vs one with “lots” of values, nor is there is a clear indication of when it is important to look at frequency counts of frequency counts versus not summarizing the variables with many observations. I generally do the latter when it will cause problems for my analysis if the frequency of different frequencies within the data will matter.

Commands for summarizing data
-----------------------------

### R

#### Base R

#### Manually using tidyverse summarize

#### Using the vtable package

My favorite R package for creating summary statistic tables is Nick Huntington-Klein’s `vtable` package. As he says “if you want the kind of table sumtable() produces (and I think a lot of you do!) then it’s perfect and easy.” I find that it is rare that this package **doesn’t** give me what I’m looking for. It is simple, fast, and usually does what you want. There are options to customize many things (although possibly not everything you might want). Here’s a basic example:

    vtable::st(palmerpenguins::penguins)

<table>
<caption>
Summary Statistics
</caption>
<thead>
<tr>
<th style="text-align:left;">
Variable
</th>
<th style="text-align:left;">
N
</th>
<th style="text-align:left;">
Mean
</th>
<th style="text-align:left;">
Std. Dev.
</th>
<th style="text-align:left;">
Min
</th>
<th style="text-align:left;">
Pctl. 25
</th>
<th style="text-align:left;">
Pctl. 75
</th>
<th style="text-align:left;">
Max
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
species
</td>
<td style="text-align:left;">
344
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… Adelie
</td>
<td style="text-align:left;">
152
</td>
<td style="text-align:left;">
44.2%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… Chinstrap
</td>
<td style="text-align:left;">
68
</td>
<td style="text-align:left;">
19.8%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… Gentoo
</td>
<td style="text-align:left;">
124
</td>
<td style="text-align:left;">
36%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
island
</td>
<td style="text-align:left;">
344
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… Biscoe
</td>
<td style="text-align:left;">
168
</td>
<td style="text-align:left;">
48.8%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… Dream
</td>
<td style="text-align:left;">
124
</td>
<td style="text-align:left;">
36%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… Torgersen
</td>
<td style="text-align:left;">
52
</td>
<td style="text-align:left;">
15.1%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
bill\_length\_mm
</td>
<td style="text-align:left;">
342
</td>
<td style="text-align:left;">
43.922
</td>
<td style="text-align:left;">
5.46
</td>
<td style="text-align:left;">
32.1
</td>
<td style="text-align:left;">
39.225
</td>
<td style="text-align:left;">
48.5
</td>
<td style="text-align:left;">
59.6
</td>
</tr>
<tr>
<td style="text-align:left;">
bill\_depth\_mm
</td>
<td style="text-align:left;">
342
</td>
<td style="text-align:left;">
17.151
</td>
<td style="text-align:left;">
1.975
</td>
<td style="text-align:left;">
13.1
</td>
<td style="text-align:left;">
15.6
</td>
<td style="text-align:left;">
18.7
</td>
<td style="text-align:left;">
21.5
</td>
</tr>
<tr>
<td style="text-align:left;">
flipper\_length\_mm
</td>
<td style="text-align:left;">
342
</td>
<td style="text-align:left;">
200.915
</td>
<td style="text-align:left;">
14.062
</td>
<td style="text-align:left;">
172
</td>
<td style="text-align:left;">
190
</td>
<td style="text-align:left;">
213
</td>
<td style="text-align:left;">
231
</td>
</tr>
<tr>
<td style="text-align:left;">
body\_mass\_g
</td>
<td style="text-align:left;">
342
</td>
<td style="text-align:left;">
4201.754
</td>
<td style="text-align:left;">
801.955
</td>
<td style="text-align:left;">
2700
</td>
<td style="text-align:left;">
3550
</td>
<td style="text-align:left;">
4750
</td>
<td style="text-align:left;">
6300
</td>
</tr>
<tr>
<td style="text-align:left;">
sex
</td>
<td style="text-align:left;">
333
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… female
</td>
<td style="text-align:left;">
165
</td>
<td style="text-align:left;">
49.5%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… male
</td>
<td style="text-align:left;">
168
</td>
<td style="text-align:left;">
50.5%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
year
</td>
<td style="text-align:left;">
344
</td>
<td style="text-align:left;">
2008.029
</td>
<td style="text-align:left;">
0.818
</td>
<td style="text-align:left;">
2007
</td>
<td style="text-align:left;">
2007
</td>
<td style="text-align:left;">
2009
</td>
<td style="text-align:left;">
2009
</td>
</tr>
</tbody>
</table>

With a couple more lines of code, I could move the numeric variables to the top and make a slighter nicer table.

    palmerpenguins::penguins %>% 
      relocate(where(is.numeric)) %>% 
      vtable::st()

<table>
<caption>
Summary Statistics
</caption>
<thead>
<tr>
<th style="text-align:left;">
Variable
</th>
<th style="text-align:left;">
N
</th>
<th style="text-align:left;">
Mean
</th>
<th style="text-align:left;">
Std. Dev.
</th>
<th style="text-align:left;">
Min
</th>
<th style="text-align:left;">
Pctl. 25
</th>
<th style="text-align:left;">
Pctl. 75
</th>
<th style="text-align:left;">
Max
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
bill\_length\_mm
</td>
<td style="text-align:left;">
342
</td>
<td style="text-align:left;">
43.922
</td>
<td style="text-align:left;">
5.46
</td>
<td style="text-align:left;">
32.1
</td>
<td style="text-align:left;">
39.225
</td>
<td style="text-align:left;">
48.5
</td>
<td style="text-align:left;">
59.6
</td>
</tr>
<tr>
<td style="text-align:left;">
bill\_depth\_mm
</td>
<td style="text-align:left;">
342
</td>
<td style="text-align:left;">
17.151
</td>
<td style="text-align:left;">
1.975
</td>
<td style="text-align:left;">
13.1
</td>
<td style="text-align:left;">
15.6
</td>
<td style="text-align:left;">
18.7
</td>
<td style="text-align:left;">
21.5
</td>
</tr>
<tr>
<td style="text-align:left;">
flipper\_length\_mm
</td>
<td style="text-align:left;">
342
</td>
<td style="text-align:left;">
200.915
</td>
<td style="text-align:left;">
14.062
</td>
<td style="text-align:left;">
172
</td>
<td style="text-align:left;">
190
</td>
<td style="text-align:left;">
213
</td>
<td style="text-align:left;">
231
</td>
</tr>
<tr>
<td style="text-align:left;">
body\_mass\_g
</td>
<td style="text-align:left;">
342
</td>
<td style="text-align:left;">
4201.754
</td>
<td style="text-align:left;">
801.955
</td>
<td style="text-align:left;">
2700
</td>
<td style="text-align:left;">
3550
</td>
<td style="text-align:left;">
4750
</td>
<td style="text-align:left;">
6300
</td>
</tr>
<tr>
<td style="text-align:left;">
year
</td>
<td style="text-align:left;">
344
</td>
<td style="text-align:left;">
2008.029
</td>
<td style="text-align:left;">
0.818
</td>
<td style="text-align:left;">
2007
</td>
<td style="text-align:left;">
2007
</td>
<td style="text-align:left;">
2009
</td>
<td style="text-align:left;">
2009
</td>
</tr>
<tr>
<td style="text-align:left;">
species
</td>
<td style="text-align:left;">
344
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… Adelie
</td>
<td style="text-align:left;">
152
</td>
<td style="text-align:left;">
44.2%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… Chinstrap
</td>
<td style="text-align:left;">
68
</td>
<td style="text-align:left;">
19.8%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… Gentoo
</td>
<td style="text-align:left;">
124
</td>
<td style="text-align:left;">
36%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
island
</td>
<td style="text-align:left;">
344
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… Biscoe
</td>
<td style="text-align:left;">
168
</td>
<td style="text-align:left;">
48.8%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… Dream
</td>
<td style="text-align:left;">
124
</td>
<td style="text-align:left;">
36%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… Torgersen
</td>
<td style="text-align:left;">
52
</td>
<td style="text-align:left;">
15.1%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
sex
</td>
<td style="text-align:left;">
333
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… female
</td>
<td style="text-align:left;">
165
</td>
<td style="text-align:left;">
49.5%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… male
</td>
<td style="text-align:left;">
168
</td>
<td style="text-align:left;">
50.5%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
</tbody>
</table>

Finally, we could group the data by one of our categorical variables to get summary statistics by group.

    penguins %>% 
      mutate(year = as.factor(year)) %>% 
      relocate(where(is.numeric)) %>% 
      st(group = "species")

<table>
<caption>
Summary Statistics
</caption>
<thead>
<tr>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="1">

species

</th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="3">

Adelie

</th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="3">

Chinstrap

</th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="3">

Gentoo

</th>
</tr>
<tr>
<th style="text-align:left;">
Variable
</th>
<th style="text-align:left;">
N
</th>
<th style="text-align:left;">
Mean
</th>
<th style="text-align:left;">
SD
</th>
<th style="text-align:left;">
N
</th>
<th style="text-align:left;">
Mean
</th>
<th style="text-align:left;">
SD
</th>
<th style="text-align:left;">
N
</th>
<th style="text-align:left;">
Mean
</th>
<th style="text-align:left;">
SD
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
bill\_length\_mm
</td>
<td style="text-align:left;">
151
</td>
<td style="text-align:left;">
38.791
</td>
<td style="text-align:left;">
2.663
</td>
<td style="text-align:left;">
68
</td>
<td style="text-align:left;">
48.834
</td>
<td style="text-align:left;">
3.339
</td>
<td style="text-align:left;">
123
</td>
<td style="text-align:left;">
47.505
</td>
<td style="text-align:left;">
3.082
</td>
</tr>
<tr>
<td style="text-align:left;">
bill\_depth\_mm
</td>
<td style="text-align:left;">
151
</td>
<td style="text-align:left;">
18.346
</td>
<td style="text-align:left;">
1.217
</td>
<td style="text-align:left;">
68
</td>
<td style="text-align:left;">
18.421
</td>
<td style="text-align:left;">
1.135
</td>
<td style="text-align:left;">
123
</td>
<td style="text-align:left;">
14.982
</td>
<td style="text-align:left;">
0.981
</td>
</tr>
<tr>
<td style="text-align:left;">
flipper\_length\_mm
</td>
<td style="text-align:left;">
151
</td>
<td style="text-align:left;">
189.954
</td>
<td style="text-align:left;">
6.539
</td>
<td style="text-align:left;">
68
</td>
<td style="text-align:left;">
195.824
</td>
<td style="text-align:left;">
7.132
</td>
<td style="text-align:left;">
123
</td>
<td style="text-align:left;">
217.187
</td>
<td style="text-align:left;">
6.485
</td>
</tr>
<tr>
<td style="text-align:left;">
body\_mass\_g
</td>
<td style="text-align:left;">
151
</td>
<td style="text-align:left;">
3700.662
</td>
<td style="text-align:left;">
458.566
</td>
<td style="text-align:left;">
68
</td>
<td style="text-align:left;">
3733.088
</td>
<td style="text-align:left;">
384.335
</td>
<td style="text-align:left;">
123
</td>
<td style="text-align:left;">
5076.016
</td>
<td style="text-align:left;">
504.116
</td>
</tr>
<tr>
<td style="text-align:left;">
island
</td>
<td style="text-align:left;">
152
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
68
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
124
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… Biscoe
</td>
<td style="text-align:left;">
44
</td>
<td style="text-align:left;">
28.9%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
0
</td>
<td style="text-align:left;">
0%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
124
</td>
<td style="text-align:left;">
100%
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… Dream
</td>
<td style="text-align:left;">
56
</td>
<td style="text-align:left;">
36.8%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
68
</td>
<td style="text-align:left;">
100%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
0
</td>
<td style="text-align:left;">
0%
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… Torgersen
</td>
<td style="text-align:left;">
52
</td>
<td style="text-align:left;">
34.2%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
0
</td>
<td style="text-align:left;">
0%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
0
</td>
<td style="text-align:left;">
0%
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
sex
</td>
<td style="text-align:left;">
146
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
68
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
119
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… female
</td>
<td style="text-align:left;">
73
</td>
<td style="text-align:left;">
50%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
34
</td>
<td style="text-align:left;">
50%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
58
</td>
<td style="text-align:left;">
48.7%
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… male
</td>
<td style="text-align:left;">
73
</td>
<td style="text-align:left;">
50%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
34
</td>
<td style="text-align:left;">
50%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
61
</td>
<td style="text-align:left;">
51.3%
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
year
</td>
<td style="text-align:left;">
152
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
68
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
124
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… 2007
</td>
<td style="text-align:left;">
50
</td>
<td style="text-align:left;">
32.9%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
26
</td>
<td style="text-align:left;">
38.2%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
34
</td>
<td style="text-align:left;">
27.4%
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… 2008
</td>
<td style="text-align:left;">
50
</td>
<td style="text-align:left;">
32.9%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
18
</td>
<td style="text-align:left;">
26.5%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
46
</td>
<td style="text-align:left;">
37.1%
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
… 2009
</td>
<td style="text-align:left;">
52
</td>
<td style="text-align:left;">
34.2%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
24
</td>
<td style="text-align:left;">
35.3%
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
44
</td>
<td style="text-align:left;">
35.5%
</td>
<td style="text-align:left;">
</td>
</tr>
</tbody>
</table>

#### Using the dfSummary package

While I find `vtable` to be the best package for creating publication quality summary statistic tables, for understanding my dataset, I’m also a big fan of the `dfSummary` package.
