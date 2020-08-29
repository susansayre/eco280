---
title: 'ECO 280 Syllabus'
date: ''
---
Susan Sayre | Smith College | Fall 2020

# Course Description

The course is designed to prepare students to conduct their own economic research or to work as part of research team. The course emphasizes practical research skills that complement existing coursework on economic theory and econometric methods. We focus on two main areas: effective strategies for searching, reading, and synthesizing the economic literature and practical data management, documentation, and wrangling skills.

This course will be especially useful for students interested in conducting original research as part of a special studies or honors project, for those who want to work as a research assistant while at Smith, and for those interested in graduate programs or research oriented positions in economics after Smith. At the end of the course, you will able to:

- Conduct a thorough search of the economic literature on a topic to identify high quality, relevant papers in a particular area
- Summarize the findings of economic research papers
- Synthesize the body of work on a topic, identifying common themes, areas of agreement or disagreement, and different methodological approaches
- Acquire, manage, and work with data from a wide variety of sources
- Manage data and code effectively to ensure reproducible research
- Develop a step-by-step plan for producing outcomes of interest from your data
- Implement the plan effectively in statistical software (R and Stata)
- Use Git/GitHub to share work with peers and document the development of your computer code

# Grading summary

- 40% Homework exercises
- 20% Literature review
- 20% Paper replication
- 20% Final project

# Course Details

## Assessment

40% of your course grade will be based on regular homework exercises focused primarily on developing practical data skills. In addition, you will complete three papers in the course: a synthetic review of the economic literature on a topic of your choosing, a fully documented replication of an existing economic research project (done in groups), and a fully documented and reproducible **descriptive** data analysis on a topic of your own choosing. You will present a brief summary of both your literature review and your data analysis to the class.

## Software

This course will use two software tools extensively: R/RStudio and Git/GitHub. These are the tools I use regularly in my own research and their integration provides valuable economies of scale. While we will default to using R, the course will also cover Stata programming given its frequent use in economics. We will emphasize the *process* of programmatic data analysis over expertise in a specific language. You will have one homework exercise that will ask you to complete the same task in *both* R and Stata and will have a choice of software for several other assignments.

## Late work

Late work will be penalized 5% of the grade for each 24 hours or portion thereof late.

## Office hours

I will have regular Zoom office hours at two times TBD based on student schedules during the week. I strongly encourage you to come and ask questions about any course material you have questions about or anything else you'd like to discuss. I am also available by appointment at other times.

## Academically engaged time
As you may know, college guidelines suggest that students should spend roughly 12 hours per week on a 4 credit class like this one. For this class, 3 of those hours each week will be in class, leaving 9 hours outside of class. While recognizing that students need different amounts of time to accomplish different tasks, you might find these suggestions helpful in considering how to use that time:

- ~1 hr each week preparing for class sessions by reading articles and/or software tutorials in advance
- 2-4 hrs each week working on the paper associated with the current course section
- 4-6 hrs each week working on the homework exercises

Note that these breakdowns will shift to some degree over the course of each unit in the course. During the first part of a unit, your time should be more focused on the homework exercises. These will taper off at the end of each unit to make space for focusing on your paper.

## Class Zoom Sessions

Given that the students in this course are overwhelmingly juniors and seniors who are off-campus this fall, the course will be fully remote. Class sessions in this course will be a mix of presentation of methods and time for students to experiment and practice the techniques introduced. To the extent practical, I will aim to have the presentation of methods available asynchronously and use synchronous sessions for hands-on activities that can also be replicated by students who are unable to attend synchronously.

## A note on scheduling and flexibility

As we all learned last spring, remote coursework raises a number of challenges, many of which are related to schedule. I anticipate that students will be participating in this course from a wide variety of time zones. As a result, I will plan the material so that students are able to participate asynchronously. Groups for group work in the course will be arranged using time availability as a primary criterion. If you have other constraints on your time availability that you think may affect your work in this class, please let me know.

The primary constraint on my availability is my childcare responsibilities. I have two children, who are in first and third grade. *Fill in schooling/schedule issues once I know something*

## E-mail

I enocurage you to email me at ssayre\@smith.edu with questions. I generally check messages no more than a couple times a day during regular working hours and rarely outside of working hours. I will make every effort to respond to your questions within one business day (i.e. within 24 hours during the week and by the end of the day Monday for messages sent over the weekend).

## Academic Honesty

As in any other course at Smith, you are required to adhere to the provisions of the Honor Code. I take academic honesty very seriously and will report any suspected violations of the Honor Code to the Honor Board.

I encourage you to work together on the homework exercises in the course, but each student must complete their own work. Directly copying work from a classmate or allowing your own answers to be copied is a violation of the honor code. You should understand what any code you submit as your work does. If you have any questions about how the honor code applies in the context of homework, please come see me.

# Tenative Class Schedule -- Subject to Change

## Section 1: Literature reviews and software skills

In the first part of the course, we will spend our Monday class sessions learning/reviewing the three software tools we will use in this class: R, Stata, and Git and our Wednesday class sessions focused on searching, reading, and writing about the economic literature. Weekly computer homework exercises will be handed out each Monday and will be due the following Monday. During this phase of the course, each student will write a synthetic review of the economic literature on a topic of your choosing.

- Course Intro and Software Setup

    + Monday: no class
    
    + Wednesday: Software set-up session
- Searching the literature/Git

    + Monday: Understanding Git and RMarkdown
    
        - Read: Bryan, J. (2018). Excuse me, do you have a moment to talk about version control?. *The American Statistician*, 72(1), 20-27.
        - Get your computer set up to use Git, GitHub, R, and RStudio by following the steps in Bryan, J. (2018). [Happy Git and GitHub for the useR.](https://happygitwithr.com/)
        
    + Wednesday: What is a literature review? How do we search the literature?
        - Read: Almond, D., Currie, J., & Duque, V. (2018). Childhood circumstances and adult outcomes: Act II. *Journal of Economic Literature*, 56(4), 1360-1446.
        - Come to class ready to discuss the structure of the paper and how the authors engage with other economimc literature. Pay close attention to how they organized the papers, what they tell us about each paper, and the language they use in discussing the papers.
        
- Summarizing economic papers, workflow

    + Monday: 
        - Replicating ECO 220 labs with reproducible code
        
    + Wednesday: How to summarize an economic article (that you may not fully understand)
        - Submit an RMarkdown document via Git describing your search of the literature on a topic of your choosing. You should describe the process you followed and include a list of at least five papers. The papers should represent different phases of your literature search (that is, you should not simply report the first five papers that come up when you enter a search term). For each paper, include a complete citation in APA format and a brief assessment of the journal (or other location) in which the paper appears. You do *not* need to summarize the papers themselves but should bring a copy of the one you are most interested in to class.
        - Reading skills: abstract, introduction, and conclusion; focused reading of data and methods
        - Construct a summary of one of your articles (due before class next Wednesday)
    
- Classifying the literature
- Literature presentations  

    + Final literature review due next Wednesday

## Section 2: Reproducible research

In this part of the course, we focus on developing good practices for reproducible research. You work will consist of a mix of homework exercises and interim progress checkpoints o7n your group project to reproduce the analysis in an existing economic journal article. I will provide a list of suggested articles to reproduce.

- Organization

    + File and folder structure
    + Relative paths, collaboration with others
    + Storing raw data
    + Data manipulation with code
    
- Data wrangling

    + Creating new variables from existing ones (mutate, gen)
    + Computing summary statistics by group (summarize, collapse)
    + Reorganizing data (pivot, reshape)
    + Merging data from different sources (xxx_join, merge)
    
    Key point: Before you start to write code, first determine what your data looks like now **and** what you want it to look like. Then plan the steps you need to get from one to the other.
    
- Working with strings and dates  
- Implementing regression methods with code
- Creating output with code

## Section 3: Understanding your data

In this part of the course, we will focus on data exploration. The course will focus on data tasks you are familiar with from other courses but will emphasize using these summary measures to understand what's happening in your data. During this phase of the course, you will have several relatively short homework exercises, but will spend most of your time working on understanding a dataset of your own choosing. 
    
    + No class Wednesday (Thanksgiving Break)
    

- Final projects due on the last day of exams
