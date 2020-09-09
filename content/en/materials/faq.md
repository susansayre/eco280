---
date: "2020-01-28T00:39:09+09:00"
description: Answers to common student questions
draft: false
title: FAQ
weight: 5
---
## Class Logistics

### Where can I find links to recordings and class videos?

Since this website is public, all links to videos are posted in the [#recordings](https://smi-eco280-02-202101.slack.com/archives/C019JD2AK7H) channel of our Slack workspace. I will try to also link them to the relevant days on the schedule page, but may miss some.

### Do I need to attend class synchronously?

No. Most of our class sessions will be designated work sessions and attendance is not required. I will usually post the class activity in advance and you are welcome to work through it on your own. In a few cases, you may need to work with a classmate on part of the activity but can do that outside of class if it is easier.

I will record class sessions in which I am presenting information, but I will do my best to ensure that all critical course information goes through Slack. I will also sometimes post videos for you to watch outside of class time.

## Searching the literature

### How do I access the EconLit database?

While this [link to EconLit]((https://ly.smith.edu/ef/dbeconlit/) may work for you, to make sure you have access while off-campus, it can help to navigate to the EconLit database from the [Smith library homepage](https://libraries.smith.edu/) by clicking on `Research Tools` and then either 

- Library Databases -> E -> EconLit with Full Text [EBSCO] 1969+
- Class Guides -> ECO: ECONOMICS -> Articles -> EconLit with Full Text [EBSCO] 1969+

### How do I set Google Scholar to show links to full text available at Smith?

In the upper right of the Google Scholar page, click on `Sign In`. Depending on how your browser is configured, you may have to tell the browser **not** to access Google Scholar via proxy server. I recommend only disabling the proxy server for the Google Scholar site. 

Once you're signed in, click on the three bars on the left to get the menu and select `Settings`. On the settings page, choose `Library links` and search for Smith College. Check the box next to Smith College Libraries and select `Save`.

## Git via RStudio

### How do I create an R project from a GitHub repo?

These steps will work to create an R project from any GitHub repo. In this class, you'll usually be accepting an assignment from GitHub classroom to make the repo.

1. Copy the link to the GitHub repo. For this class, this will usually look something like `https://github.com/eco280/reponame-gitusername`.
2. Open RStudio and select `File -> New Project -> Version Control -> Git`.
3. Enter the repo URL in the `Repository URL` box. Accept the default `Project Directory Name` and browse to select your class folder on your local machine so that your project is a subdirectory of your `eco280` folder.
4. Commit and push the .Rproj file that is created when the repository is cloned.

Following these steps will guarantee that I can access your repository and see anything that you push to GitHub.

### Why is the Git tab missing?

If you are working in RStudio and discover that the Git tab is missing when you want to commit your work, it is likely that you opened an .R or .Rmd file instead of your .Rproj file. RStudio uses .Rproj files to track *project* level information, like whether the project is tied to a git repo. If this happens, save all your open files, go to `File -> Open Project` and navigate to your project's .Rproj file. When it opens, the git tab should be restored.

If you're using a Mac computer, it's also possible that there is an issue with Xcode and that you need to [follow these steps from Jenny Bryan](https://happygitwithr.com/troubleshooting.html#rstudio-git-pane-disappears-on-mac-os) to fix it.
