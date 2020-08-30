---
author: Susan Sayre
categories:
- themes
- syntax
date: "2019-03-11"
description: Homework 1 Assignment.
series:
- Themes Guide
tags:
- markdown
- css
- html
- themes
title: HW 1 - Setup and Git Basics
weight: 1
---

## Submission details

All steps should be completed no later than 10:30am EST on Mon 9/14, but I highly recommend aiming to have them done by Wed 9/9 so that your literature review repository will be available over the weekend. The specific steps:

- Follow the directions below to get Git, GitHub, R, RStudio and Stata working on your computer
- Commit and **push** at least a skeleton file to your lit-review-gitusername repo as described below
- Post at least one comment, question, or answer on the #hw1-git Slack channel
- Respond to my pinned "Is Stata installed on your computer?" thread on the #hw1-git channel once it is installed

In this lab, you will install the necessary software for the class and learn some basic Git commands. The focus is on making sure everyone has the software working on their computer and understands the basic operations. Git is an extremely powerful program and was originally designed for software developers. Many tutorials online are oriented toward its use in that context, but there are a growing number of researchers using it in economics and data science. My goal is to teach you a small subset of the Git functionality that will let you streamline and safeguard the process of working on economic research projects alone or with colleagues. 

## Create a local workspace

While many of us are used to not being very careful about where files we use on a day-to-day basis are stored, we will pay *very* careful attention to file storage in this class. You should create a folder somewhere on your laptop hard drive called eco280 and store all your files for this class inside folders in that folder. I recommend putting this folder somewhere inside your Documents folder (on a Mac this folder will usually be `/users/yourname/documents` while on a PC it will be `C:/Users/yourname/Documents`). If you use Google Drive FileStream, do not put this folder in your Google Drive. You should also not put it in any folder that is synced with a service like Dropbox.

## Install Software I: Git/GitHub/R/RStudio

Follow the steps in [Happy Git and GitHub for the useR](https://happygitwithr.com/) through Chapter 15. For those of you who are new to R/RStudio, you will be directed to install and set up both programs. For those of you who have been working in R/RStudio regularly, I highly recommend updating to the latest version of both programs. (If you have an active project you are concerned will be affected by the upgrade, let me know and we can plan a strategy). **Important:** Use your smith.edu email address when setting up your GitHub account. This is important for interacting with the course content.

For new users, expect this to take an hour or two. You should begin the process and try to get through at least Chapter 6 before class on Monday 9/7. Our class time on Mon will be almost entirely a working session to help make sure everyone has Git and R working together well. You will have until Mon Sep 14 to complete all the steps.

*Important note:* When you choose a password for GitHub, I highly recommend picking a unique password that you don't use for other things. This will minimize some concerns about the security of your GitHub password when you do things like cache credentials. For now, you're unlikely to be doing confidential things on GitHub, so you don't need a super strong password. The point is not to risk revealing a password you *do* need to remain confidential by using it on GitHub.

The installation steps are often fairly straightforward, but issues do come up. The installation guide offers tips on resolving many of these, but if you're stuck, go to Slack and post a message in the #hw1-git channel. If you are an experienced R/RStudio or Git user, please consider offering advice or help as needed.

When you get to Chapter 8, install [GitHub Desktop](https://desktop.github.com/) unless you are familiar with another Git client that you prefer. We will try to use the RStudio Git interface as often as possible, but will occasionally need to use GitHub Desktop or the Git command line.

Hopefully you won't have to worry about caching credentials, but I am not certain what will happen with a fresh install right now. If you do need to cache credentials, pick the https option and post on Slack in the #hw1-git channel to tell us that you had to cache credentials and report on whether it worked.

When you get to Chapter 15, ignore the parts about GitLab and Bitbucket.

## Install Software II: Stata

To get us ready for HW 2, you will *also* install Stata on your computer this week. You don't need to do anything with it for this homework other than install and open the software and respond to my thread telling me it is installed.

*For this year only*, the College has purchased a site license for Stata that will allow you to download and install the software on your own computer. The license is a limited term license and you may need to return to using lab computers next year. To install Stata, follow the directions [on this page](http://www.science.smith.edu/cats/software-for-ongoing-science-classes/). *Note:* As of 8/28, the new license info was not yet available. Post on our Slack channel if you try installing Stata and it doesn't work.

## Initialize your lit review repo

Accept the literature review assignment by [clicking on this link](https://classroom.github.com/a/dlXZ9b0k). It may take a few minutes to set up your repo. Once it is set up, copy the url to your assignment. (It should look like https://github.com/eco280/lit-review-gitusername).

Open RStudio and choose File -> New Project -> Version Control. Enter the URL in the top box, accept the default for the second box, and tell RStudio to create the project as a subdirectory of the eco280 folder you created at the beginning of this assignment.

This will clone the project into a local folder on your machine. Open the included README file and modify it so that it has your name instead of Firstname Lastname. Stage, commit, and push that change to GitHub following the steps you learned in [Chapter 12 of Happy Git](https://happygitwithr.com/rstudio-git-github.html#make-local-changes-save-commit).

Next, go to File -> New File -> RMarkdown. Give your file the title `Literature search description` and make sure it lists you as the author. Save the file that opens as `search-description.Rmd` and then click the knit button to see the output you get.

Go to the Git window and click the boxes next to `search-description.Rmd` and `search-description.html`. Then commit your changes.

Remove the placeholder text in the .Rmd file (`## R Markdown` and everything below it). Type `# Topic description` on the line just below the setup chunk. Save and knit your file.

Commit and push your changes to GitHub. You will be using this repo to complete your literature search assignment for Wed Sep 16.


