---
description: Working with ggplot
draft: false
title: HW 9 - Working with ggplot
---

## Submission details

- Commit and **push** working code and your two output files to your github repo by 5pm EST on Fri Dec 4. 
- For this assignment, the goal is to have your own working code that replicates what we've done in class.

Note: the assignment is specific to R and ggplot. If you want to try to replicate the graph in Stata instead, you are welcome to do so, but I do not have tutorials designed to help you do this.

## Task summmary
1. Accept the [assignment repo](https://classroom.github.com/a/flhCqGMh) on github.

2. Download the beginning code from [the Slack post](https://smi-eco280-02-202101.slack.com/archives/C019L20QEUR/p1606752524002700). 

3. Build up the code to construct a graph that looks similar to the [one of Connecticut cases from the NYTimes posted on Slack](https://smi-eco280-02-202101.slack.com/archives/C019L20QEUR/p1606148539001500), following the steps in class. There are several steps illustrated in the [recording from class on 11/29](https://smi-eco280-02-202101.slack.com/archives/C019JD2AK7H/p1606764089000600):

    a. Plot the new_cases using geom_col.
    b. Plot the rolling average using geom_line
    c. Remove the x and y axis text labels.
    c. Set the general theme to minimal to get close to the look we want.
    d. Adjust the x ticks to use only month and to not expand beyond the end of the data.
    e. Rename the y ticks to the specific values and add the word cases.
    f. Remove the vertical grid lines and set the horizontal grid lines to be dashed using theme(panel.grid.major.? = )
    g. Add tick marks on the horizontal axis using theme(axis.ticks.x = ?)
    h. Adjust the alignment of the axis labels using theme(axis.text.? = ?)
    i. Add a title
    j. Add text and line annotations using annotate() and geom_segment(). You only need to include ones for the 7-day average and the New cases, although you are welcome to try adding the other one if you want practice.
    k. Save your plot to a pdf or png file using ggsave()
	
3. Construct a small multiples graph for county level cases that looks roughly like the state one with the following differences:
	
    a. Do not adjust the y-axis tick locations and do not add the word cases. Instead, use n.breaks = 3 to reduce the number of breaks on the y-axis. (You'll notice that it may not use exactly 3 breaks because it prioritizes "nice" numbers).
    c. Let the y-axis scale vary across the small multiples but keep the light dashed grid lines
    d. Only print month labels for every other month.
    e. Leave out the text and line annotations for 7-day average and New cases.
    f. It is up to you whether to include a plot for the cases with "Unknown" county.
    
when you are done, knit your code and commit/push your .Rmd file, your .html file and saved versions of both your state and county graphs (pdf, jpg, png, or eps versions are all fine).