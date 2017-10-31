# IE 2064:  Data Science  Spring 2018

- Time:  
- Place:  1020 Benedum Hall
- Instructor:  Dr. Louis Luangkesorn

# Description

Data science covers methods for collecting, preparing, analyzing, and visualizing large collections of information.  This course will cover aspects of descriptive and predictive analytics, starting with obtaining and processing data from published and online sources and moving to descriptive and predictive analytics. Topics will include:  working with data, organizing data, summarizing data, sampling data, working with web based API for accessing data, statistical analysis of data, working with text, combining data sets, identifying relationships between data sets, model validation, and reporting.  The focus is on understanding and applying methods on real data over mathematical rigor.  The course will use R for data preparation, data analysis, model development, and interpreting results.

Note:  Students should work through the tutorial Modern Dive Part 1: Data Exploration (listed as supplement) prior to the beginning of the course.

Time:  Tuesday 5:20-7:50

Place:  1045 Benedum

Instructor:  Dr. Louis Luangkesorn

Office: 1024 Benedum

Email: lluangkesorn@pitt.edu

Office hours: by appointment

# Textbooks:

(APL) Max Kuhn, Kjell Johnson, (2013), Applied Predictive Modeling, Springer, ISBN: 978-1-4614-6850-9

# Supplements:

(R) Bill Venables, David Smith, and the R Core Team, (2013), An Introduction to R - Notes on R: A Programming Environment for Data Analysis and Graphics, available at http://cran.r-project.org/manuals.html and distributed along with R

(W) Graham Williams, (2011), Data Mining with Rattle and R: The Art of Excavating Data for Knowledge Discovery, UseR Series, Springer, ISBN: 978-1-4419-9889-7 Available at Pitt Library as an ebook.

(ggplot) Hadley Wickham, (2016),  Introduction to ggplot 2nd ed, Springer, ISBN: 331924275X available in PDF from the Pitt Library

(Modern Dive) Chester Ismay and Albert Y. Kim, (2017), Modern Dive: An Introduction to Statistical and Data Science via R, http://moderndive.com/. Online book that is a good source on how to do data manipulation tasks and basic statistical techniques. Really should be done prior to a course like this.

-  James, Witten, Hastie, Tibshirani, (2013) An Introduction to Statistical Learning: with Applications in R (Springer Texts in Statistics) ISBN: 1461471370 http://www-bcf.usc.edu/~gareth/ISL/getbook.html  Highly recommended. Very detailed, but focuses on practice in contrast to the Elements of Statistical Learning.  Freely available for download.

-  Hastie, Tibshirani, Friedman (2009) The Elements of Statistical Learning, ISBN: 978-0-387-84857-0 http://statweb.stanford.edu/~tibs/ElemStatLearn/ Probably the best standard.  Tends toward the theoretical. You may want it for completeness or for research purposes, but Introduction to Statistical Learning is a better place to start.


# Software tools

## R

- R environment for statistical computing. http://cran.r-project.org. The easiest way to get is is through through Revolution Analytics http://www.revolutionanalytics.com/downloads/

- Various libraries. Easiest way to install them is to install the library that comes with Data Mining with R and Rattle, a R interface used in data mining. In R enter:

    install.packages(c("DMwR", "rattle"), dependencies = c("Depends", "Suggests"))

    R will install all the associated libraries automatically. This will take a few minutes as Rattle is a very full featured data mining application.

##  R Studio

-	R Studio Integrated Development Environment.

    http://www.rstudio.com/ide/ Install this after installing R. Includes knitr and R Markdown for reporting.

##  Git Version Control


-  Bitbucket sourcecode repository.
http://bitbucket.org

-  Git Distributed Version Control System
http://git-scm.com/

-  If you are using Windows or Mac, get Sourcetree

    http://www.sourcetreeapp.com/


## Alternatives to R

###  Python

-  Scikit-Learn: http://scikit-learn.org/stable/index.html
-  Learn Data Science - Self directed learning - http://github.com/nborwankar/LearnDataScience
-  IPython Cookbook - Examples of a range of different scientfic programming tasks in Python, including some statistics and machine learning - http://ipython-books.github.io/cookbook/

### Java Virtual Machine

-  Weka Machine learning libraries and an applications - 
http://www.cs.waikato.ac.nz/ml/weka/index.html
  -  It comes with an Application Programming Interface (API) that is accessible from most JVM based languages.
  -  Also accessed through other languages like R and Python.
-  Book: Data Mining: Practical Machine Learning Tools and Techniques

###  Matlab/Octave

-  Libraries exist, but there is no standard set of libraries.
-  Note: typically, these libraries are very low level and intended for use by strong scientific programmers.
-  Very difficult to use with text data.

##  Prerequisites:

- Probability and statistics
- Computer programming.
- Familiarity with R. While one does not have to be an R programmer at any level of skill, you should have installed R and R Studio and worked through An Introduction to R prior to the beginning of the course.  Instructions on obtaining and installing R and R Studio are at http://cran.r-project.org and http://rstudio.org.  Modern Dive, Chapter 2-Getting Started, gives an introduction to each.

