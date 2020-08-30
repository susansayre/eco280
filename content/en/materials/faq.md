---
date: "2020-01-28T00:39:09+09:00"
description: Answers to common student questions
draft: false
title: FAQ
weight: 5
---

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
