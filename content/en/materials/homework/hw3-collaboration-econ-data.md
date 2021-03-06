---
date: "2020-01-28T00:36:14+09:00"
title: HW 3 - Collaboration and data basics
output: 
  md_document:
    preserve_yaml: true
    pandoc_args: ["--wrap=preserve", "--webtex"]
---

Submission details
------------------

-   Commit and **push** working code and your output files to your group’s github repo by 10:45am EST on Mon Sep 28

Learning objectives
-------------------

-   Git skills:

    -   Understand how to pull and push commits to GitHub.com
    -   Learn what triggers a merge conflict and how to resolve one

-   Data skills:

    -   Learn how to download data from FRED
    -   Understand best practices for storing and documenting data files

-   Coding skills:

    -   Learn different ways to import data into both R and Stata
    -   Learn how to generate new variables in both R and Stata
    -   Learn the basic semantics of ggplot – the R package we will use for graphing

Details
-------

The first few steps of this hw *must* be done together in a group. You can do this in class together on Monday while I will be available for troubleshooting or you can arrange another time. I highly recommend completing the remaining steps together as well, but if necessary, they can be done individually. If you work together, submitting a single file for part 2 is fine, but if you complete the activity independently, you each need to submit your own file.

I have assigned groups for this activity based on the feedback I received in the survey I sent and on an effort to match time zones reasonably well. Please let me know ASAP if there are any issues with the grouping. If these groups work well, we will use the same groups going forward.

Groups:
1. Corrina, Priscilla, and Riss
2. Fanghui and Carol
3. Vatsala, Niya, and Cecilia
4. Chichi, Nage, and Marcela

### Part 1:

This part **must** be done in a group working together over Zoom.

#### Step 1: Accept the assignment on GitHub

Because this is a team assignment, the process is a little bit different. You need to be together on a Zoom call to do this. Have **one** member of your team share their screen with the group and then click on this [link to accept the assignment](https://classroom.github.com/g/3HaW-yIW). It will ask you to create a team name. Choose the name as a group. Your team name should be relatively short and shouldn’t have spaces in it. (You can use dashes to separate words if you want.) I recommend using mostly or all lowercase letters.

After the team is created, the remaining members of your group should click on the link to accept the assignment. It should ask you which team you want to join. (Unfortunately, I couldn’t test this myself since I only have one student account.) The team name entered above should be there and you should select that name. One team member then needs to accept the assignment, which will create a eco280/hw3-team-name repo that everyone on your team and I have access to.

Once the repo is set up and everyone has accepted the assignment, have a different member of your team share their screen and clone the repo/create an R project as usual (using either the [previous RStudio directions](https://eco280smith.netlify.app/materials/faq/#how-do-i-create-an-r-project-from-a-github-repo-using-rstudio) or a new set explaining how to do this with [GitHub desktop](https://eco280smith.netlify.app/materials/faq/#how-do-i-create-an-r-project-from-a-github-repo-using-github-desktop)). That member should then commit and push the .Rproj file that is created to GitHub.com.

After the .Rproj file has been pushed to GitHub.com, the remaining team members should clone the repo to their computers. Note that this time, the .Rproj file will already exist and won’t show up as a file that needs to be committed.

At this point, everyone on the team should have their own local copy of the repo. As you go forward, keep rotating the job of the person sharing their screen and completing tasks first. We’re completing this lab using [pair programming](https://en.wikipedia.org/wiki/Pair_programming) where one person is writing code at any point in time and the observers are checking the code and keeping an eye on potential pitfalls. The goal is for the whole group to finish the activity *and fully understand* what we did. If you have less programming experience, your job is to ask questions. Do *not* let the group go ahead if you’re not clear on what happened at a particular step. If you have more programming experience, your job is to help explain what the code does. This will help solidfy your own understanding. If your group is stuck and working in class, ask for help and I’ll join your breakout room as soon as I can. If you’re working asynchronously, post on Slack and I’ll answer as soon as I can.

#### Step 2: Make individual changes and share them over GitHub.com

Switch who is sharing the screen again. In RStudio, **one** member of your team should select `File -> New File -> Markdown`. (Note that we want a Markdown file not an RMarkdown file. The Markdown option is further down in the menu.) On the first line type

    HW 3 for team-name: Your name

replacing `team-name` with the name your group chose and `Your name` with the name of the person currently typing. Then save the file as `README.md` (use this capitalization). Stage, commit and push this change to GitHub.

Switch screen sharer again so someone else is sharing their screen. Have that person [pull changes from GitHub](https://eco280smith.netlify.app/materials/faq/#how-do-i-pull-changes-from-githubcom). The README.md file should show up their computer. Open it and add a comma and then your name to the top line. Save the file and commit and push your changes.

Have everyone else pull the change and continue rotating until everyone’s name is on the top line and everyone has the version of REAME.md with all the names on their computer. Throughout this process, make sure **only one person** makes a change until everyone has that change on their computer.

Have the last person type the following lines and then save, commit, and push the change. Everyone else should pull changes one more time afterward.

    Here is one interesting fact about each of us:

    We chose our team name because ...

**Do not fill in the facts about your team members yet.** There should simply be a blank line between the two lines. You can fill in the reason you chose your team name although it’s also ok if there wasn’t really a reason and you want to leave that blank. The goal is to make sure you have two lines of text with a blank line between them.

Once everyone has the same README.md file on their machines, proceed to the next step.

#### Step 3: Triggering and resolving a merge conflict

Now, I want each of you to open the README file on your own computer and type a line containing an interesting fact about yourself. For instance, I might write “Susan had a cat named Cream of Wheat when she was a child.” (The standard for what qualifies as interesting is pretty low here, although feel free to have fun with it if you want.) Each of you should then save the file, but do not commit or pull yet.

Pick one member of you team to commit and push their change. Once they’re done, have a second member share their screen. This person should commit their change and try to push it to GitHub. It should trigger an error telling you that there are changes on the remote that you don’t have. Let me know if this doesn’t happen. The error gives you a hint about what to do: pull the remote changes. The person sharing their screen should do this now. You should get a message that looks something like this:

    Auto-merging README.md
    CONFLICT (content): Merge conflict in README.md
    Automatic merge failed; fix conflicts and then commit the result.

Git tries really hard to combine the changes if you both modify a file. (We’ll look at an example in a minute that should NOT trigger a merge conflict.) But in this case, Git is telling you that the two copies of the repo (the one on GitHub and your local version) have conflicting changes. Git has no way of knowing whether the new lines were two different ways of resolving a problem or two new lines that are both needed. And if they’re both needed, it doesn’t know which one should be first. This means that you need to intervene and tell it what to do. To do this, open the README.md file *on the computer that just delivered the merge conflict message.* No one else should make changes right now.

You’ll see something like this:

    HW 3 for team-name: Teammate A, Teammate B, and Teammate C

    Here is one interesting fact about each of us:

    <<<<<<< HEAD
    An interesting fact about the person whose computer screen you're seeing right now.
    =======
    An interesting fact about the person who already pushed their changes to GitHub
    >>>>>>> 7af97a9e299a86dc65d5631c071e7665cb2a4376

    We chose our team name because ...

The area between &lt;&lt;&lt;&lt;&lt; HEAD and the ===== lines shows you what that section of the file looks like on the local computer. The area between ===== and &gt;&gt;&gt;&gt;&gt; random list of numbers and letters shows what that section of the file looks like on GitHub.com. Your job is to decide what you want the final version to look like and then to delete all the extra characters – the &lt;&lt;&lt;&lt;&lt;, =====, and &gt;&gt;&gt;&gt;&gt; lines. You want to keep both new lines and I’ll leave it up to you which order they go in.

*Note:* If this was a real merge conflict, you need to search through the entire file to make sure you find all the places that conflicts occur. There may be a lot of them.

Once you’re happy with the final version. Save the file and commit your change, saying something like “resolving merge conflicts” in the commit message. Note that in GitHub, the box next to the file will initially be filled with a blue square. You need to click it to have it switch to the usual M indicator before you can commit the file.

If you are a team of three, have the last person commit their changes and repeat these steps until you have interesting facts about all of your team members in the file. Make sure everyone pulls the new version so everyone has matching README files.

#### Step 4: Make changes that GitHub can auto-merge

Now, I want everyone to open the README file on your own computer and change your name in the interesting facts section by either adding your last name if you didn’t include it before or removing it if you did. **Do not** make any other changes to the file. Each of you should then save and commit the file. One person can push the file to GitHub. Once that is done, have a different team member share their screen and pull the changes. You should get a message like:

    Auto-merging README.md
    Merge made by the 'recursive' strategy.
     README.md | 2 +-
     1 file changed, 1 insertion(+), 1 deletion(-)

This indicates that Git was able to figure out how to combine the changes because everyone changed something different. (Note that there is no guarantee that changes Git thinks it can combine won’t break computer code. It just means that two different people didn’t try to modify the **same part** of a file.)

Open up the README.md file and see what you observe. The person who just pulled from GitHub should be able to push their changes now. Keep repeating the steps of having one person push and the others pull until all the changes are on GitHub and everyone has all the changes on their local machine.

### Part 2

This part can be done in a group or individually. My preference is that you do it in a group because I expect that you will learn from each other in the process. If you choose to do it individually, please include your name on a comment line in your Stata file and as the author of your Rmd file.

If you’re working in a group, every member of the group is responsible for making sure that everyone else feels comfortable with what the code submitted does and why. If you feel like your group went too fast and you’re not sure about the details of the code, I strongly encourage you to ask your teammates, but you can also send me a message separately to let me know that you’re feeling confused. If you know how to do these tasks and aren’t sure if your teammates followed the steps you took, take the time to ask and check in with them.

If you’re working together, use pair programming where you rotate whose job it is to write the code. Each time you switch, save, commit, and push the code to GitHub. Have the new person pull the code from GitHub when they take over. (As a side benefit, this will help you get comfortable with those steps.)

#### Step 1: Download price data from FRED

Go to [the FRED website](https://fred.stlouisfed.org/). If you haven’t run across it in one of your classes yet, the FRED website is a great source of economic data, especially macroeconomic indicators. Click on Category, scroll down to Prices and select Commodities. Using the menus on the left, pick one item whose price history you think you might find interesting. Click on the series and you should get a graph of the price over time.

The prices displayed are probably measured in US Dollars. If your item suggests the price is measured in real or inflation adjusted dollars, please pick a different item, since our exercise is to transform the nominal prices into real prices.

Click on the button to Edit Graph and choose Add Line. In the menu that pops up, search for CPI and select Consumer Price Index for All Urban Consumers: All Items in U.S. City Average. Click Add Series. Both the CPI and your original price item should now be on the graph, although the scaling may mean you mostly see only one of the two series (probably the CPI). Now click on the button that says DOWNLOAD and choose CSV(data). Save the file on your computer in your local version of you group’s HW 3 repo in a folder called data. Give the file a name that has no space or capital letters and indicates what item you’re looking at.

Best practice for using data is to document the datasets you download as soon as you download them. (Trust me – some day you will discover a mysterious file on your computer containing useful data and have no idea where it came from if you don’t follow this practice. I speak from (repeated and painful) experience). Using RStudio or a text editor like Notepad (on a Windows machine) or TextEdit (on a Mac), create a file called README.md and put it in the data folder. *Be careful to store it in the data folder* or it will overwrite the README.md file in the main folder of your repo. In this folder, list the name of the file you just saved, and include the date you downloaded the data and the suggested citations from the FRED page. (It’s below the graph if you scroll down. Make sure you get one for both the CPI and the price series you’re looking at.) *Note:* if your group is working separately, you are likely to run into merge conflicts with the README.md file in the data folder. This is good practice. Work through the steps you followed above to combine your edits to the file with those of your teammates.

Add both the .csv file and your new README.md file to git and then stage and commit these files.

*Note:* Both R and Stata have utilities available that will let you download data directly from the FRED website into R or Stata. We will learn how to use these later in the semester. This also lets you skip the documenting step above because the code itself will download the data. (You would still need to get the citation for your references though.)

#### Step 2: Stata

In Stata, change your working directory to your local HW 3 repo. Type doedit to create a new do file and save it with a name that indicates the item whose price you’re looking at (e.g. `strawberry-prices.do`). Remember to add your name in a comment at the beginning. While you can use the console window to enter commands directly as your figuring out your code, remember that all of the necessary commands should be in your do file when you submit your work.

Create a log file for your program and then import your data (check HW 2 if you need a reminder on how to do this). Remember to work from the main folder of the repo and to use relative paths. If the `insheet` command doesn’t work for you, try using `import delimited`.

The data will be imported with variables names drawn from FRED that are relatively meaningless. Use the syntax `rename original_name new_name` to give the variables more descriptive and human readable name. (*Note that R and Stata have almost exactly opposite syntax here. In Stata, the **original** name comes first.*)

Now we want to create a new variable that gives the **real** price of your item. To do this, you first need to remember the formula for converting a nominal price to a real price:
![nominal\\\_price \* (base\\\_year\\\_cpi/cpi)](https://latex.codecogs.com/png.latex?nominal%5C_price%20%2A%20%28base%5C_year%5C_cpi%2Fcpi%29 "nominal\_price * (base\_year\_cpi/cpi)") where ![base\\\_year](https://latex.codecogs.com/png.latex?base%5C_year "base\_year") is the year whose prices you want to use. Pick a year and look up the cpi in that year and use the syntax
`gen real_price_item = nominal_price*base_year_cpi/cpi` substituting whatever variables names you used before.

Once you have the new variable, try to construct a line graph with date on the horizontal axis and the real price on the vertical axis. What happens?

Stata doesn’t know that the date variable is a date. If you click on the date variable and look in the bottom right, you’ll see that Stata read in the data variable as a **str10** or a string variable with length 10. We need to convert this to a date. Dealing with dates is such a messy problem that we have a entire lesson devoted to it later but these dates are in a relatively straight forward format so we can work with them easily. Essentially, we have to tell Stata to construct a variable whose type is date by reading the string. We do that with the function `date()`. Given that the variable we’re working with is also called date, this leads to the awkward command `gen date_numeric = date(date, "YMD")`. This code will create a date that Stata understands, but it will be displayed in a format that is unclear to human readers. To fix this, we’ll add the command `format date_numeric %td`.

Now, you should be able to generate a line graph showing real price over time. Using the menus in Stata, create a second plot that adds a linear fitted line to the graph. (Twoway -&gt; Create -&gt; Fit plots -&gt; Linear prediction).

If you want to practice learning Stata commands, try searching the help or google to fix two problems with the graph. First, the price series is probably labeled with the hard to understand code that FRED originally used. Try `help label` and see if you can figure out how to change this. Second, the date axis is hard to read and may extend farther into the past that your price series data. Look in the graph menu options and see if you can fix this. Neither change is required for full credit on the assignment, but both are good practice.

Use code to save your final graph as .png file. Make sure that your do file runs and generates all the necessary output. Then add, commit, pull to make sure you have all changes from github, and push your changes. You should include your log file, your do file, and your graph file in github.

#### Step 3: RMarkdown without pipe

In RStudio, create a new RMarkdown file. If you’re working with your group, make sure everyone’s name is listed in the author section. Save your file with a similar name to your do file.

In the setup chunk, load two packages that we’ll need: tidyverse and lubridate. Tidyverse should already be installed so you can just load it with the `library(tidyverse)` command. You’ll probably need to install lubridate. To install a package, go to the console window (**not** the .Rmd file) and type `install.packages("lubridate")`. You only do this once and it does **not** go in your .Rmd file. Essentially, we’re downloading software to your computer with this command. Add the `library(lubridate)` command to your .Rmd file below the tidyverse statement.

*Note* the different use of “quotes” in the two commands. The package name goes in quotes in the install command but does not have quotes in the library statement.

Delete all the placeholder text after the setup chunk. Today, we’re going to explore the capabilities of RMarkdown a bit more and generate a file that combines a description of what we’re doing with the code and the results of the code.

Type a paragraph at the beginning of your document that describes roughly what the document will do: generate a graph of the trend in real prices of a specific item (replace with the specifics for your example).

After this paragraph, leave a blank line and type

`# Data source`

at the beginning of the line. Follow this with another blank line and then a paragraph describing where you got the data, including the citation. (This information is already in your data/README.md file, but we’re adding it to the .Rmd file to demonstrate that R gives you a nice way of including the information directly with your code. In principle, you wouldn’t need the data/README.md file if the info is in your main .Rmd file. In this class, we will continue to construct data/README.md files to build the habit of carefully documenting data as it is acquired.)

Then insert a new chunk of code (Code -&gt; Insert Chunk, or Ctrl+Alt+I on Windows, or Cmd+Option+I on a Mac). After the r type a description of the chunk beginning with a verb. It should be something like `import data`. After this description, type a comma and then write `echo = F, message = F`. This will suppress printing the code (`echo = F`) and the messages reported by R (`message = F`) in the final document. There are many options you can use for individual code chunks. You can see the full list of options on the second page of the [RStudio RMarkdown guide](https://rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf).

Inside the code chunk, import the data, consulting HW 2 if you need help remembering how. Feel free to design your own object names. As was the case with Stata, there are a few issues with the data as it is originally read in that we want to fix. We’re going to fix these inside the same code chunk. The R syntax for editing data is different than the Stata syntax because we always need to tell R what object we want to work with.

In this course, we will rely on syntax that is specific to the tidyverse set of packages to manage our data. There are other ways to accomplish all of the tasks we’ll be doing.

The basic structure of an R statement looks like this:

`new_object <- function(existing_object, other arguments)`

For our initial statements, we’re going to create a new object each time we apply a function. (Note: if your whole group is already familiar with using the pipe in R, you can go ahead and do that here). The first thing we want to do is rename our variables. Suppose I called my initial object `raw_data`. Then I would do something like this:

`renamed_data <- rename(raw_data, item_price = orig_var_name)`

This line of code tells R to take the object `raw_data` (which contains several variables and observations) and make a copy but to rename the variable `orig_var_name` to `item_price`. Use the green triangle to execute code in your RMarkdown document, take a look at the difference between `raw_data` and `renamed_data`. Then write a second line of code that renames the cpi variable to something more readable. Remember to give the new object a different name.

If you want to understand how the function `rename` works, you can type ?rename in the console window.

The next thing we want to do is to generate a new variable. The tidyverse function that helps us do this is `mutate`. Again, the syntax follows the basic `new_object <- function(existing_object, other arguments)` so we’ll want to do this:

`real_prices <- mutate(renamed_data_2, real_price = nominal_price*base_year_cpi/cpi)`

You’ll need to substitute the appropriate variable names and the specific numerical value for your base year cpi.

I want to highlight one important distinction in the above line. The line creates an **object** whose name is `real_prices`. This object is a special type of object called a dataframe that has rows (observations) and columns (variables). One of the variables is called something like `real_price` but this is not an object. This distinction between **objects** and **variables** is important in R and doesn’t really come up in Stata because Stata basically only has one object in memory at a time (the one dataset it’s currently using).

#### Step 4: RMarkdown with pipe

The syntax above is correct and helps us understand what R actually does but it’s annoying to write and forces us to come up with lots of object names or to repeatedly overwrite a single object, neither of which is ideal. To help prevent this problem, one of the packages contained in the tidyverse (`magrittir`) introduces something called the **pipe** operator. This operator `%>%` essentially tells R to take the output object from what’s on the left and use it as the first argument in the function on the right.

Let’s create a new chunk and called it `import data with pipe`. Begin by rewriting your import statement, but use a new object name like `simple_data_import`. At the end of the line enter a space followed by `%>%` and a return. RStudio should automatically indent the next line. On that line type

`rename(item_price = orig_var_name)`

Try clicking the green triangle to see what happens when you execute this code. You should have both the importing and the renaming steps done together. Notice that this time, I did not need to include the name of the object that I wanted `rename` to start with because the pipe operator on the first line tells rename to start with the object I just created by importing data.

We need to rename two variables, but we can actually do this with a single rename function. Go back to your rename line, and enter a comma before the closing parenthesis and hit return. RStudio should automatically indent the next line so your cursor is under the new variable name in the previous line. Type something like `cpi = ugly_original_cpi_name)` on this line. You can chain together as many rename statements as you want like this, as long as you make sure each line ends with a comma and that there is only one closing parenthesis at the end of the last line.

Once we’ve renamed all our variables, we can also need to generate our new variable using the `mutate` function. We can do this in the same step as well. Outside the closing parentheses after the last rename statement, enter the pipe operator `%>%` again and hit return. (Your last line will look like `new_var_name = old_var_name) %>%`

On the following line, we’ll re-enter our mutate statement from before, but again, we no longer need to name the object we’re operating on so you’ll simply skip the first argument from before.

In the version without the pipe, we didn’t address the date problem, but we’re going to do that here. Just like `rename`, `mutate` lets you string together multiple variable definition statements. It also lets you overwrite a variable within the statement. Inside the parentheses on your mutate statment, enter a comma and a return. On the following line, type

`date = as.Date(date))`

It may look weird to have only one opening parenthesis and two closing ones, but remember that the second one is matched with the one on the previous line that opens the `mutate` function call. RStudio makes it easy to match parentheses because if you position your cursor in front of a parenthesis and use the arrow to key to “cross” it, RStudio will briefly shade the matching parenthesis.

Working with the pipe takes a little getting used to, but it makes your code very readable. A typical data step for me in my code will looking something like this:

    final_object <- starting_object %>% 
      rename(var1 = old_var1,
             var2 = new_var2) %>% 
      mutate(new_var = var1 + var2,
             new_var2 = var1*var2)

In my head, I read this as \*generate the object `final_object` using the following recipe: start with the old object `starting_object` and then rename a bunch of variables, and then create a bunch of new variables. Every time, I see a `%>%` character I mentally replace it with “and then”.

Either before or after your code chunk, write a short text description describing what year you used to measure real prices.

#### Step 5: Generate graph in R

Our last step is to generate the graph in R. Enter a new chunk and give it a descriptive name that starts with a verb.
We’ll use ggplot (which is part of the tidyverse) to generate our plots. The ggplot approach to graphing is to build up graphs in layers.

The basic steps for creating a graph are:

1.  Call ggplot and tell it which object to plot and set the plots *aesthetics* which means to tell it what variables belong on the x axis and what variables belong on the y-axis.
2.  Add on a layer that tells ggplot how to put the data on the graph using a type of *geometry*
3.  Add on additional layers if desired
4.  Add labels, etc

The code to do this is

    ggplot(my_data, aes(x = date, y = real_price_var)) + 
      geom_line() +
      geom_smooth(method = "lm") +
      labs(title ="") +
      xlab("date") +
      ylab("item x price - 20xx dollars")

When you’re done, save your .Rmd file, knit it, and stage, commit, and push both the .Rmd file **and the knitted html file**.

Note:
Because it’s different than the point-and-click style interface you may be used to with programs like Excel and Stata, it may take a while to get used to the construction of graphs using ggplot. Two excellent references for helping to learn are:

-   [Chapter 3](https://socviz.co/makeplot.html) of Kiernan Healy’s [Data Visualization]() book walks through the logic of constructing a graph in ggplot. It introduces you to fewer options than the second reference but does a better job of explaining the logic of ggplot (and the grammar of graphics in general).
-   [Chapter 3](https://r4ds.had.co.nz/data-visualisation.html) of Hadley Wickham’s e-book [R for Data Science](https://r4ds.had.co.nz/). (Sidenote: the rest of the book is a very useful resource for R/RStudio and the tidyverse packages in general.) This reference teaches ggplot through a series of examples helping you construct increasingly complex graphs.
