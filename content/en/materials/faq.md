---
date: "2020-01-28T00:39:09+09:00"
description: Answers to common student questions
draft: false
title: FAQ
weight: 5
---
## Class Logistics

### Where can I find links to recordings and class videos?

Since this website is public, all links to Zoom recording videos are posted in the [#recordings](https://smi-eco280-02-202101.slack.com/archives/C019JD2AK7H) channel of our Slack workspace with access information. I will try to also link to these Slack posts from the relevant days on the schedule page, but may miss some. Please check the Slack channel if you can't find one.

I will also be posted asynchronous video lessons via Panopto, which is connected to Moodle. You can see recent Panopto videos in the Panopto link on our (mostly empty) course Moodle page. I will also post direct links to these videos on Panopto on the schedule page. You can also access [the course Panopto page here](https://smith.hosted.panopto.com/Panopto/Pages/Sessions/List.aspx?folderID=9d42ac90-ae67-4f09-9b04-ac3001413f80). Once on this page, you should be able to access any of the video tutorials I've posted.

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

## R/RStudio

### Can I use the RStudio Server for my projects?

Yes. You can go to the [Smith RStudio server](https://rstudio.smith.edu/auth-sign-in) and sign in to complete your RStudio tasks. Git is already installed so you can check out directly from GitHib. You will probably have to type your GitHub username and password each time.

Many of our assignments ask you to work with R and Stata on the same repo. You cannot use Stata on the server, but since you are syncing your work via GitHub this should not be a problem. It is good practice to make sure you commit **and push** your work to GitHub every time you get ready to sign of the RStudio server. It is fine to push work to GitHub that is not fully finished because you can continue to work on it later.

## Working with Git

### How do I create an R project from a GitHub repo using RStudio?

These steps will work to create an R project from any GitHub repo. In this class, you'll usually be accepting an assignment from GitHub classroom to make the repo.

1. Copy the link to the GitHub repo. For this class, this will usually look something like `https://github.com/eco280/reponame-gitusername`.
2. Open RStudio and select `File -> New Project -> Version Control -> Git`.
3. Enter the repo URL in the `Repository URL` box. Accept the default `Project Directory Name` and browse to select your class folder on your local machine so that your project is a subdirectory of your `eco280` folder.
4. Commit and push the .Rproj file that is created when the repository is cloned.

Following these steps will guarantee that I can access your repository and see anything that you push to GitHub.

### How do I create an R project from a GitHub repo using GitHub desktop?

These steps assume you have an existing repo on GitHub, which could be either one you created there and one that was created when you accepted an assignment on GitHub classroom.

1. Copy the link to the GitHub repo.
2. Open GitHub desktop and click the triangle next to current repository in the upper left.
3. Choose add. You can either find the repository by beginning to type its name or click on the URL tab and paste the URL into the box.
4. You now have a version of the repo on you local computer but RStudio doesn't know about it yet and we haven't created an .Rproj file. To do this, open RStudio and select `File -> New Project -> Existing Directory` and browse to select the directory that contains your repo *inside* your class folder. 

    **Note the difference** between this and what you do when create the project directly from GitHub. When creating directly from GitHub, you pick the folder you want your **project folder to be in** because RStudio will create a new folder. When doing it this way, you pick the folder that contains the project files.

5. Commit and push the .Rproj file that is created when you do this step. You can commit and push in either RStudio or GitHub Desktop. (You can also commit in one program and push in the other.)

### How do I pull changes from GitHub.com?

There are a number of ways to do this. The first step in all cases is to **commit** any local changes that you want to keep. You cannot run git pull if you have local changes to tracked files. Do **not** push the changes yet. (You'll get an error if you try.) To actually pull the changes, pick **one** of the following methods:

- In RStudio, click on the down arrow in the Git tab
- In RStudio, Select `Pull Branches` from the Git dropdown menu
- In GitHub Desktop, press the button that says `Pull Origin`. If it's not there, try clicking on `Fetch Origin` in the upper right. That will check whether there are changes on GitHub that you can pull and should then give you the `Pull Origin` option.
- Typing `git pull` in a Terminal or Git Bash window whose working directory is the local git repo.

### Why is the Git tab missing in RStudio?

If you are working in RStudio and discover that the Git tab is missing when you want to commit your work, it is likely that you opened an .R or .Rmd file instead of your .Rproj file. RStudio uses .Rproj files to track *project* level information, like whether the project is tied to a git repo. If this happens, save all your open files, go to `File -> Open Project` and navigate to your project's .Rproj file. When it opens, the git tab should be restored.

If you're using a Mac computer, it's also possible that there is an issue with Xcode and that you need to [follow these steps from Jenny Bryan](https://happygitwithr.com/troubleshooting.html#rstudio-git-pane-disappears-on-mac-os) to fix it.

### Using ggplot

#### Why do some examples put the aes(x = x_var, y = y_var) inside the ggplot() function and others put it inside the geom_xxxx() function?

For most plots you'll make, either approach works. The code `ggplot(my_data, aes(x = x_var, y = y_var))` sets the default x and y variables for any layer that you add to the plot, while the code `geom_point(aes(x = x_var, y = y_var))` sets the x and y variables for *only that layer*. For a simple plot

```
ggplot(my_data, aes(x = x_var, y = y_var)) + geom_point()
```
and
```
ggplot(my_data) + geom_point(aes(x = x_var, y = y_var))
```
will produce exactly the same thing.

If I want to plot the same two variables using several geom_xxxx layers, the first format might be easier since I could set the variables once using this code:

```
ggplot(my_data, aes(x = x_var, y = y_var)) + geom_point() + geom_smooth(method = "lm")
```
instead of specifying them in each layer, like this:
```
ggplot(my_data) + geom_point(aes(x = x_var, y = y_var)) + geom_smooth(aes(x = x_var, y = y_var), method = "lm")
```

In contrast, if I wanted to plot two different y variables against the same x variable, I'd probably do this:
```
ggplot(my_data, aes(x = x_var)) + geom_line(aes(y = y_var1)) + geom_line(aes(y = y_var2))
```
Having multiple options for how you specify the plot makes the code more complicated when you first learn it, but the flexibility offers more options to construct exactly the graph you want.