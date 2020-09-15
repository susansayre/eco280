---
date: "2020-01-28T00:36:14+09:00"
description: Running regressions with code in R and Stata
draft: false
title: HW 2 - Regressions with code
---

## Submission details

- Commit and **push** working code and your output files to your github repo by 10:45am EST on Mon Sep 21

In this lab, you will be completing a modified version of one of the exercise that appears in one of the ECO 220 labs. In ECO 220, the emphasis is on running a regression and interpreting the output. Our emphasis is on learning to generate reproducible research using computer code. You will complete the exercise in both Stata and R and will submit your work by committing and pushing your code to GitHub. Full credit requires both the output and working computer code that generates the output. 

## Basic Steps in Running a Regression with Code

1. Navigate to your project's location on your computer.
2. Store your data in the data folder of your project.
3. Create (or open) a file to store the code for your analysis.
4. Write computer code to complete the following steps:

    a) Import the data
    b) Create (and save) a scatterplot
    c) Run a regression and save the output  
    
5. Execute your computer code to run the analysis.

We will follow these basic steps in both R and Stata, but doing so will look different in each case. In Stata, we'll be using separate files (regression table and graph files) to store output, while in R, we will be creating an RMarkdown document that contains both the code and the results in a single document.

## Initial setup

*Note:* Throughout these directions and our assignments more generally, I will use phrases like `gitusername` or `path/to/local/directory` where you should replace these with the relevant versions for you/your computer. As an example, everywhere the phrase `gitusername` appears in these directions, you should replace it with the user name you set up when you created your github account. I won't always explicitly point out the need for these replacements, but I hope it will usually be self-explanatory when these should be replaced. If a command fails with a file/folder not found error, one of the first things to consider is whether there's a piece of the command that could have been one of these replacement indicators.

Use this link to [accept the assignment on GitHub](https://classroom.github.com/a/88Rw8reQ). This will create your personal repository, which you will then clone to your computer. Clone the repository in RStudio [following these steps](https://eco280smith.netlify.app/materials/faq/#how-do-i-create-an-r-project-from-a-github-repo). Once you've completed this step, you will have a folder on your computer called hw2-gitusername that contains four files: .gitignore, hw2-gitusername.Rproj, LICENSE, and README.md.

Using either RStudio or your regular file browser, create a subfolder called `data`. Download the [hw2-metabolic.csv file](/docs/hw2-metabolic.csv) and save it in your data folder.

Decide whether you want to start with R or Stata and navigate to the appropriate section of the directions.

## Regressions with code in Stata

This section illustrates how to follow the basic steps above in Stata.

### Step 1

Open your copy of Stata. Within Stata use either the command `cd path/to/your/local/eco280/folder/hw2-gitusername` or the menu option to change your working directory to the `hw2-gitusername` folder you created above. **Do not** include the `cd` command in your final do file. Your path is unique to your computer and will not work on other computers.

*Note:* If you are using Splashtop, you should make a folder on the local machine called `hw2-gitusername` and proceed as if this directory was on your computer as you follow the rest of these directions. Make sure you create a `data` subfolder and put the `hw2-metabolic.csv` file in it so that Stata can find the data. When you are done, you will need to copy your code and output files back to your own computer so that you can commit them to git.

### Step 2

Since it is common across both programs, we did step 2 (saving your data) in the initial setup section.

### Step 3

Stata programs are written in files called "do files" because they end with the extension .do. To create a new one, type `doedit` in the console to open the do file editor. Save the file as `regression-code.do` in your `hw2-gitusername` folder. Begin writing your code in this file. It is common practice to include comments in your do file to separate steps and help other users (or yourself in a few weeks) understand what the different sections do. Although this will be a very short program, we will follow this practice here. Use an `*` at the beginning of a line to denote a comment.

### Step 4a

Enter a comment in your do file identifying your section as `import data` and then enter the code to import the .csv file: 

```
insheet using data/hw2-metabolic.csv
```

*Note:* Make sure you use a forward slash not a backslash so your code will run on different platforms. Also note that you are using a *relative* path to you file. If you run this code with your working directory set to anything other than your `hw2-gitusername` folder it won't work. We could replace this with an *absolute* path that would work regardless of your working directory but **only on your computer** and only if you never move or rename your analysis folder. 

Typing in do file has no immediate impact. You've written code that will tell Stata to import the data, but we have to **run** the code for that to happen. Save your current do file. In the console window of Stata, type `do regression-code` and hit enter. The code you wrote should appear in the console window and the `Variables` window on the right should now have the variables from the metabolic data listed. Check with your groupmates to make sure everyone is there before proceeding.
    
### Step 4b

In your do file, enter another comment to identify a new section: `create scatterplot`. Although R's graphing capabilities are better, the learning curve is steep. With practice, Stata can generate very nice graphs (much better than Excel) and has a menu system to help you learn the code to generate the graphs. We will use this menu system to demonstrate how to use the "point-and-click" features of Stata while still guaranteeing your analysis is reproducible. 
Within the main Stata window, navigate to Graphics -> Twoway graph. Choose Create and select scatterplot. Using the menu options, construct a graph with `rate` on the vertical axis and `mass` on the horizontal axis. Feel free to experiment with the marker and weight options if you want. Click `Accept` to set the options and `Ok` to generate your graph. Notice that two things happen when you do this: a window with the graph pops up **and** the line of code to generate the graph is printed in your console. We're going to make one more change to the graph before we add the code to our do file.
        
Close the graph you created. Go back to the Graphics window, select Plot 1 and choose edit. Although we closed the graph, Stata stored the code for us and we now want to change it. This time, I want you to create a graph of the data for only the observations coded male (sex == 0), add axis labels (Metabolic Rate and Lean Body Mass) and give the graph a title. (Hint: there are menu options in the graph wizard to add all of these elements. Explore until you find them and ask your groupmates for help if you get stuck.) Click submit when you're ready. Once you have a graph you like, copy the code that created it from the history window and paste it into your do file.

*Tip:* If your line of code gets too long to see easily in your do file, you can create a multiline command by entering `///` at the end of the line and continuing your command on the next line.

In your do file, copy the line of code and paste it below, so your code appears twice. Modify the second line to create a matching graph for the observations coded female in the sample. Save your do file before proceeding.
        
Go back to the console window, type clear all, and close any open graphs. Outside of the history windows, it will be as if you haven't completed any analysis, but all the code to recreate your work is saved in your do file. I will regularly ask you to clear your Stata or R sessions and re-run your code because this helps build the habit that *code* is **real** and *output* is **temporary**. Check that your code does what you want by typing `do regression-code` in the console window. Stata should import your data and create the two graphs. 
        
We have one step left for our graphs: we need to save them so we can share them with others. We're going to do this with code. Put your cursor after the code that create the first graph and before the code that creates the second one. Add the following line:

```
graph export "scatter-male.png", as(png) replace
```

This code will create .png file containing your graph. PNG files are relatively small and portable graphic files that work on most computers and are often used in research papers. They can be easily added to most documents. The `replace` option tells Stata to overwrite your file each time you create it. 

*Tip:* You can also get Stata to generate the code to export your graph using the menus, but note that it uses *absolute* file paths in the code and does not use cross-platform friendly path dividers. If you use the menus, convert your file paths to relative ones. They're shorter, easier to read, and portable.

Do the same thing after you second graph, making sure you match the right graph with the right filename.

### Step 4c

Now we need to run the regressions. Enter a comment to define the new section: `run regressions`. The ECO 220 lab we're replicating asked students to run two regressions: one for males and one for females. You could use the menus again (this time under Statistics) to help you figure out the code, but since it's so common, we'll jump right to the code. Type 

```
reg rate mass if sex == 0
```

Note that `reg` is a shorthand for `regress`; both accomplish the same thing. Then run a second regression with `sex == 1`. Save your do file.
        
Clear your Stata session, close all graph windows, and re-run your code. You should see the output for the two regressions. We're almost done, but this output currently lives only in the console window. We want to be able to share the output. We have a couple choices and for completeness, we're going to demonstrate two choices.
            
First, we're going to tell our code to save a log file. Go to the top of your do file and type 

```
log using "regression-log.smcl", replace
```

The `replace` at the end tells Stata to overwrite the log file each time you run the code. Then go to the very end of your do file and type 
```
log close
```

Make sure this stays as the last line of your do file if you make any changes later.
            
Second, we're going to use a utility to get Stata to export a formatted version of your regression output. This isn't something Stata can do natively, so we have to install a package to add the functionality. To do this, go to your console window (**not** your do file) and type 

```
ssc install estout
```

You will only have to do this once and will then be able to use the commands in future Stata sessions. Once you've installed the package, you have access to the output commands. 
            
Back in your do file, put your cursor after your regression command and type `esttab using results-female.rtf, replace` on a separate line below your regression command. Do the same for the regression with the male observations. (Make sure you match them correctly!) *Note: there are ways to combine the output from both regressions into a single table. We'll look at this later.* You've now finished all the code you need to run the regressions in Stata.
            
### Step 5

The last step is to actually generate your results. You've actually already done this step a few times while developing the code, but it is good practice to get in the habit of recreating your final output right before submitting your output to be sure that your code actually generates the output you're submitting. Save your do file and then clear your session, close all graphs, and re-run your code. You should now have several files in your `hw2-gitusername` folder: `regression-code.do`, `regression-log.smcl`, `scatter-female.pdf`, `scatter-male.pdf`, `results-female.rtf`, `results-male.rtf`. If all these files appear, you've successfully run the regression using computer code in Stata. 
            
Using either GitHub desktop or the Git tab in RStudio, stage, commit, and push all of the Stata files to Git, using a message like "Completed Stata regressions" or something else. (I encourage you to consider committing in smaller chunks as you complete each step, but this is not necessary.)

*Note:* If you did the Stata part of this lab using Splashtop, you cannot use git directly. Instead, you'll need to copy all the files listed above from the Splashtop computer back to your own computer that you're using for the R part of the analysis. Once they are on your computer, you can stage, commit, and add them to git.

When you are done, close Stata. It will tell you the data in memory has changed and ask you if you want to save. Say no and Stata will close. (*Note:* Since our goal is reproducibility, we will never be saving data on exit. If we want to save a data set we've modified, we'll use code to save it so we know *exactly* what is being saved.)

## Running a regression in R


### Step 1

Open the `hw2-gitusername.Rproj` file. *Note:* It's a good idea to get in the habit of opening RStudio by using the .Rproj file rather than the individual .Rmd or .R files, since the .Rproj file stores the info that makes things like Git work well.

### Step 2

Since it is common across both programs, we did step 2 (saving your data) in the initial setup section.

### Step 3

Choose File -> New file -> RMarkdown and set the title to `Regressions in R (HW 2)`. Make sure you are listed as the author and select HTML output. Save the resulting file as `regression.Rmd`. In the r setup chunk, add add lines loading the package we're going to use for this lab: `library(tidyverse)`.

*Note:* If you haven't already done this, you need to install the tidyverse package on your computer. To do this, type `install.packages("tidyverse")` in the R console window.

Delete everything in the Rmd file from ## R Markdown to the end of the file. Save your file.

### Step 4

In R, both the code and the output will be part of the same file. We will work through building the file, running the code iteratively to make sure it's working and then "knit" the file at the end to create a document that contains both code and output. RMarkdown documents are a mix of text sections and code sections. The text sections have a weight background and the code sections have a shaded background. 

### Step 4a

Insert a code chunk by going to Code -> Insert Chunk. Name the chunk by typing the phrase `import data` after the `r` *inside* the brackets on the top line. (*Sidenote:* I recommend naming all code chunks -- as well as comment identified sections in Stata -- with __verbs__ that describe what the sections do.) 

Within the chunk, use the read_csv function to import the data and store it as an object in R by typing: 

```
metabolic <- read_csv("data/hw2-metabolic.csv")
``` 

Click the green triangle on the chunk to run the code. It should run your setup block and then import the data. If you click on the Environment tab in the upper right in RStudio, you'll see the metabolic object listed. You can click it on the triangle to get information about the included variable or click on the name to open a window to see the data.
    
### Step 4b

Insert a new code chunk and call it `graph data`. To keep things consistent across the course, we're going to generate our graph using ggplot. The semantics are very powerful but less user-friendly than Stata's graphing options. For now, I'm going to give you the basic commands, but we'll go into more detail later. To generate our basic plot, use the command

```{r basic plot}
ggplot(metabolic, aes(x = mass, y = rate)) + geom_point()
```

Click the green triangle at the top right of your code chunk and your plot should appear below your code.
    
We want to separate our data into two separate plots for the male and female observations. One simple way to do this is to filter the data before we plot it using the command 

```
ggplot(filter(metabolic, sex == 0), aes(x = mass, y = rate)) + geom_point()
```

Comparing this to the previous command, we replaced the name of the object containing our data (`metabolic`) with a function `filter(metabolic, sex == 0)` that takes the dataset and pulls out only the observations where the value of the sex variable is 0. 

We also want to add a title (so we know that this is only the male observations) and axis labels. To do this, we modify our code to say 

```
ggplot(filter(metabolic, sex == 0), aes(x = mass, y = rate)) + 
  geom_point() + 
  labs(x = "Lean Body Mass",
       y = "Metabolic Rate",
       title = "Relationship between body mass and metabolic rate (males)")
```

Within the same chunk, copy and paste the code and modify it to create a second scatterplot for the female observations. Click the green arrow again and you should see two separate plots.

### Step 4c

Insert a new code chunk and call it `run regressions`. To run a basic regression type 
    
```
results <- lm(rate ~ mass, data = metabolic)
```

Hit the green triangle again. You should notice a new object (`results`) but nothing else will appear in your .Rmd file. To see the results, type `summarize(results)` on the following line and click the green triangle again. (*Note:* we'll learn how to make prettier regression output in R later.)

```
results <- lm(rate ~ mass, data = metabolic)
summary(results)
```
    
To parallel the ECo 220 lab and our scatter plots, we want to separate the data into the male and female samples. To do this, we'll parallel the code we used earlier in the scatterplots. To make sure that we can tell which regression results are which, we'll first add a header to our .Rmd file. *Outside* and above the chunk, type `## Regression results (males)` and the modify the chunk name to be run male regression and modify the code using the filter technique we used in the graphing section. (*Hint:* we replaced the dataset name -- metabolic -- with a filter function to accomplish this before).

Once you have this working, copy your header and your code chunk. Paste them below the existing one and modify to generate the female regression results.

### Step 5

Although you've been generating your results all along, best practice is to verify that your code *really* produces your output. To do this, click the Knit button in RStudio. It should create an .html document containing your code, your scatterplots, and your regression results. Stage, commit, and push your files to GitHub, with a message like "Completed R regressions."  