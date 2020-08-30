---
date: "2020-01-28T00:39:09+09:00"
description: Answers to common student questions
draft: false
title: FAQ
weight: 5
---

## Git via RStudio

### Why is the Git tab missing?

If you are working in RStudio and discover that the Git tab is missing when you want to commit your work, it is likely that you opened an .R or .Rmd file instead of your .Rproj file. RStudio uses .Rproj files to track *project* level information, like whether the project is tied to a git repo. If this happens, save all your open files, go to `File -> Open Project` and navigate to your project's .Rproj file. When it opens, the git tab should be restored.

If you're using a Mac computer, it's also possible that there is an issue with Xcode and that you need to [follow these steps from Jenny Bryan](https://happygitwithr.com/troubleshooting.html#rstudio-git-pane-disappears-on-mac-os) to fix it.
