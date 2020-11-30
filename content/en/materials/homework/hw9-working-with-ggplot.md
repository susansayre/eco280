---
description: Working with ggplot
draft: false
title: HW 9 - Working with ggplot
---

## Submission details

- Commit and **push** working code and your two output files to your github repo by 5pm EST on Fri Dec 4. 
- For this assignment, the goal is to have your own working code that replicates what we've done in class.

## Task summmary
1. Accept the [assignment repo](https://classroom.github.com/a/flhCqGMh) on github.

2. Build up the code to construct a graph that looks like this, following the steps in class. There are several steps:

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
	j. Add text and line annotations using annotate() and geom_segment()
	k. Save your plot to a pdf or png file using ggsave()
	
3. Construct a small multiples graph for county level cases that looks roughly like the state one with the following differences:
	
	a. Do not adjust the y-axis tick locations and do not add the word cases.
	a. Use n.breaks = 3 to reduce the number of breaks on the y-axis.
	b. Let the y-axis scale vary across the small multiples but keep the light dashed labels
	b. Only print month labels for every other month.
	c. Leave out the text and line annotations for 7-day average and New cases