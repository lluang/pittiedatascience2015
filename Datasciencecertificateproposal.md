---
title: "Proposal for Graduate Certificate in Data Science"
author: "Louis Luangkesorn"
date: 'DRAFT: July 22, 2015'
output:
  word_document: default
  html_document:
    toc: yes
---

Introduction
===============

As information systems grow more ubiquitous and inexpensive, many organizations have experienced a large increase in the amount of data available. The emergence of Big Data has led to situations that could only be analyzed through traditional statistics with a high degree of nuance that is not commonly available. The field of data science (AKA Machine learning, predictive modeling, knowledge discovery and data mining) has emerged to describe the methods and practices related to managing big data, analysis, and interpreting the analysis within a decision making workflow.

Because of the need to integrate the data preparation, exploration, modeling, analysis, and presentation of results into a unified workflow, standalone, single function tools that have been used to teach individual courses lead to a siloed understanding of 

Characteristics of big data
---------------------------

Big data can be characterized by four aspects.

1.  Volume
2.  Velocity
3.  Variety
4.  Veracity

![3Vs of Big data](lectures/resources/BigData3vs.png)

1.  Volume refers to presence of quantities of data that are beyond the capability of a single analysis sitting at a single computer to analyze.  The knowledge needed to work with high volumes of data include the IT capabilities of remote storage and remote processing (cloud computing) and the understanding of programming concepts needed to take advantage of cloud computing resources (parallel processing, functional programming).
2.  Velocity refers to the changing nature of data within a short decision cycle. This becomes an issue in cases where decisions have to be made for a specific instance on a small amount of specific data, or when the character of the data changes rapidly.  Working with this requires methods that can integrate within corporate IT systems (databases) and can use the mass of related data to provide insight into a specific observation (machine learning methods and Bayesian based statistics).
3.  Variety refers to the range of information that is available on a specific observation.  This variety can come from the fact that data may be available on a single subject from a range of sources, or because collecting and storing a range of attributes on a specific observation is easy. It may also result from the range of data storage and transmission types that are commonly encountered in practice. Working with a wide range of data requires knowledge of data handling methods and methods to identify which attributes or combinations of attributes are important (data processing and machine learning).
4.  Veracity refers to the correct understanding of the meaning of the information available. This includes dealing with missing values, identifying and correcting data errors, and an understanding of the intent of the data collectors.  Skills and knowledge in working with these issues include data munging and data analysis.

Characteristics of data scientists.
------------------------------

Drew Conway describes data scientists as having a combination of three sets of disparate skills:

- computer programming/hacking skills,
- math and statistics knowledge, and
- substantive expertise.



![Drew Conway Data Science](lectures/resources/Data_Science_VD.png)

### Computer programming skills

Computer programming skills are required because data is traded electronically, so data scientists need to be able to manipulate text files, understand vectorized operations to work with data, and to think algorithmically.  Without computer skills means you cannot even get started with using electronic data.  The computer programming skills also link the various steps in the data workflow together from data collection, manipulation, modeling, analysis, then presentation of results. In contrast, single purpose programs typically do not lend themselves to being part of an integrated workflow.

In practice, a set of programming languages have become common in data science. They have the following characteristics:

1.  Built on top of numeric libraries for computation including linear algebra libraries (BLAS/LAPACK)
2.  Interactive, either through an interpreter or a Read-Evaluate-Print-Loop readily available (no compilation step as methods are modified).
3.  Have available a large number of topical and subject based technical computation libraries.
4.  Can operate on vectors and related data types (include functional programming capabilities).
5.  Have facilities to manage a range of types of data to include numerical and character based data.
6.  Have data structures that maintain knowledge of relationship and properties of data elements. (e.g. the data frame type)
7.  Have good and flexible graphical capabilities.
8.  Can express data analysis methods in forms corresponding to mathematical and statistical notation.

Popular languages for this are R and Python.  Other languages that share these characteristics include Julia, Clojure, Scala, and F#.  Matlab/Octave is also a close fit, however it does not have good facilities for working with character data nor does it have the equivalent to a data frame type.  Numeric and statistical libraries are often written in C, C++, Java, or Fortran, but they lack interactivity and do not have the expressiveness that corresponds to the forms used to represent problems and algorithms in mathematical or statistical notation which are useful for practicing data science.

Another note is that this is not the same as the standard computer science curriculum. While the CS curriculum can provide a good foundation for the programming skills required, in practice what is required is the ability to use computer programming to build the workflow that goes from data exploration to data manipulation to model development and evaluation to presentation of results in forms useful for decision making.  In many cities, programmers in industry have formed groups that focus on teaching the skills required for practical use to both those with university training in programming (e.g. computer science majors) and those with minimal formal education (e.g. high school graduates without any college background). One such group is Code & Supply based in Pittsburgh.

### Math and Statistics

While computer programming is required in order to even get started in data science, an understanding of the mathematical and statistical principles that underlie the methods is needed to give insight into which methods may be useful for a given problem and to evaluate the quality of models used. In the absence of this understanding, the analyst is essentially feeding data to a computer and taking output but without its meaning may be misunderstood and can lead to danger.

In particular, one implication of the elements of big data is that standard hypothesis testing based statistical analysis is inappropriate. Because of the volume and variety of data that is available, a large number of hypothesis could be generated and tested, and with high probability there will be hypothesis that will test to be significant, even if in fact there is no such relationship in real life.

The methods of data science model evaluation tend to be more similar to model evaluation in Bayesian statistics rather than model evaluation in traditional, frequentist based statistics with a focus on assessing candidate features contribution to the predictive ability of a model, and methods that explicitly favor simpler models that require justification to add complexity and detail.


### Substantive Expertise

The third leg in Drew Conway's Data Science Venn diagram is substantive expertise.  The observation by those in industry who may have need for data science is that they have trouble with academically trained analysts (e.g. recent university graduates at any level) is that they do not relate the math and statistics to an actionable plan.  In the absence of a connection between the math/statistics/computer programming and the substantive expertise, what you have is the academic field of machine learning. It is possible to generate the insights from data, but the insights are not related to pending business decisions or they are not delivered in a form that can assist in making business decisions.

In contrast to academic programs in machine learning, data mining, or statistics, data science practitioners have developed frameworks that give context to the work, and also provide guidance to the model evaluation.  One such framework is Context, Needs, Vision, Outcome (CoNVO) by Max Shron.  This framework focuses on the entity (usually an organization) with an interest in the work. 

-  Context explains the reason for the organization's interest.  
-  Need is a question that the organization has to answer before taking an action. 
-  Vision is how the results of the data analysis project will deliver the results so the organization can answer the question, 
-  Outcome is how the organization uses the results and how the organization will repeat the analysis for future decisions.  

Of note is the fact that the data project is not actually a part of any of these four points. The data project lies in between the Need and the Vision, and the modeling and methodology (which is the traditional focus of academic programs) is only one facet of the data project.

Understanding this CoNVO framework drives many of the decisions to be made by the data scientist. First, it helps in identifying outcomes and decision variables, which are based on the Need and Outcome of the organization. Second it helps in model evaluation, for example in making the tradeoffs between Type I and Type II errors (and their counterparts in other model evaluation methods).

University programs in Analytics
===================================

There are three types of data science and analytics programs. The Georgia Tech MS in Analytics program recognizes this by having three tracks: analytical tools, business analytics, and computational data analytics.

Analytical tools
-----------------

Analytical tools refers to the use of descriptive, predictive, and prescriptive analytics.  This is also the framework that is followed by the Institute for Operations Research and Management Sciences.

- Descriptive analytics
  - Prepares and analyzes historical data
  - Identifies patterns from samples for reporting of trends
-  Predictive analytics
  - Predicts future probabilities and trends
  - Finds relationships in data that may not be readily apparent with descriptive analysis
-  Prescriptive analytics
  - Evaluates and determines new ways to operate
  - Targets business objectives
  - Balances all constraints

Topics covered under analytical tools include parametric and non-parametric statistics, regression, forecasting, data mining, machine learning, optimization, stochastic modeling, and simulation.

Business Analytics
------------------

Business analytics focuses on the understanding of how analytics is used in business and industry.  Focus here is on how to understand, frame, and solve problems in the context of business unit and to execute projects within business unit. This is very similar to what has been generally known as business intelligence (BI).

The focus in this type of program is doing visualization and business unit specific tasks (marketing, pricing, revenue management, customer relationship management, human resources).

Computational Data Analytics
---------------------

Computational data analytics focuses on the skills and knowledge in managing big data.  The focus here is on applying high performance computing technologies such as parallel clusters or cloud computing to data problems.  Within industry, this is often referred to as Big Data Engineering.

Tool requirements
------------------

Most of the programs explicitly state R as a tool used in the curriculum.  A number of them also identify Python as a language used for data science.  A few programs also state Java is used (I suspect that these are for those in the Computational Data Analysis type programs as Java and the JVM platform is often used in the technologies used for high performance computing in commercial settings (e.g. Hadoop, MapReduce, Spark)).

Online certificates in data science
-----------------------------------

A number of universities have started offering on-line certificate programs in data science, often on platforms such as Coursera or edX. The standard format is 5-10 modules of 4-6 weeks each.  One example are the courses in Johns Hopkins University Data Science track at Coursera which are 9 4-week modules plus a capstone that is intended to take place over 8 weeks, overlapping the last two courses.

1. The Data Scientist’s Toolbox
2. R Programming
3. Getting and Cleaning Data
4. Exploratory Data Analysis
5. Reproducible Research
6. Statistical Inference
7. Regression Models
8. Practical Machine Learning
9. Developing Data Products
10.Data Science Capstone

The 9 courses can be broken up into 5 courses in the practice of data science, R programming, and working with data, 3 courses in statistical methods, and then a overview course that pulls everything together in parallel with the capstone project. Note that this parallels the often repeated observation that the statistical analysis is 20% of a typical data project.

While the Johns Hopkins track covers both the analytics aspect of data science along with practical aspects of working with data, most online course sequences focus on statistics and methodology as opposed to practical issues, such as University of Illinois data mining certificate on Coursera.  

1. Pattern Discovery in Data Mining
2. Text Retrieval and Search Engines
3. Cluster Analysis in Data Mining
4. Text Mining and Analytics
5. Data Visualization
6. Data Mining Capstone

Other online courses focus on the mathematical and statistical underpinnings of the various methods used in machine learning and data mining.




Proposal for a data science certificate as part of the MS in Industrial Engineering
====================

Core requirements
-  IE 2005 Probability and Statistics
-  IE 2001 Operations research (optimization (and queuing?))
-  IE 2006 Manufacturing Systems

2 of 4
-  IE 2003 Engineering management
-  IE 2004 Database design
-  IE 2007 Statistics and data analysis
-  IE 2100 Supply Chain analysis

Several of the current courses have topics that are similar to what would be needed for a data scientist but are not at the appropriate level of rigor. In particular, the statistics should be based on computational statistics and the database course needs to focus on using information systems in the context of data inquiry.  Some options to modify these requirements for use in a data science curriculum are:

1.  Modify IE 2005 and/or IE 2007 to be R based instead of Minitab based
2.  Allow for substitutions for the 2 of 4.  
  -  IE 2004 Database design replaced with INFSCI 2140 or 
  -  IE 2007 Statistics and data analysis with STAT 2131-2132, Applied Statistical Methods 1 and 2
3.  IE 2064 Data Science as an option for the 2 of 4

Potential new courses that could be in a data science curriculum

1.  Computational statistics. This would be a second course in statistics that is focused on using simulation based methods to teach statistics.  This could replace either the first (IE2005) or second course (IE2007). Curriculum and textbooks exists in many schools using R or Python as a base programming language.  If allowed as an alternative to IE2005, this course would provide a computational foundation that would be used in future courses in IE or SIS. (SIS analytics courses often use R. Pitt Stats courses seem to be SAS based.)

Courses that can contribute to an Analytics certificate

Core:  TBD
IE 2064 Data Science
INFSCI 2160 Data Mining or BQOM 2578 Data Mining

**Analytics**

IE 2064 - Data Science
IE 2088 - Discrete Systems Simulation (needs to be programming based, not standalone)
INFSCI 2160: Data Mining
BQOM 2578 Data Mining

STAT 2231 Advanced Applied Regression
STAT 2321 Advanced Applied Time Series
INFSCI 2410: Introduction to Neural Networks
INFSCI 2430: Social Computing
INFSCI 2591: Algorithm Design
INFSCI 2725: Data Analytics

**Business Analytics**

IE 2086 - Decision Models
IE 2108 - Simulation Modeling and Applications

INFSCI 2130: Decision Analysis and Decision Support Systems 
BQOM 2512 Advanced Decision Technologies
BSEO  2525 Competitive Intelligence
BMKT 2551 Digital and Social Media Analytics
BMKT 2544 Shopper Marketing
BQOM 2523 Process Engineering
BQOM 2537 Forecasting
BQOM  (Proposed course) Revenue Management & Pricing Analytics

**Computational Data Analytics (big data engineering)**

INFSCI 2140: Introduction to Information Storage and Retrieval  
INFSCI 2710: Database Management
INFSCI 2711: Advanced Topics in Database Management
TELCOM 2125: Network Science
TELCOM 2120: Network Performance
TELCOM 2321: Computer Networking

Comparison to current proposals at the University of Pittsburgh
=============

The following proposals are in development at the University of Pittsburgh.

School of Information Sciences - MSIS Big Data Analytics Specialization
-------------------------

Program requires:

1.  Required, Decision analysis and either Information Storage or Data Mining
2.  Required Cognitive science - Neural networks or social computing
3.  Required: Algorithm design, database management (2) , Data Analytics
4.  2 of 8 courses on topics within information science
5.  2 electives

Katz Business Analytics Certificate
-------------------------

The Katz Business Analytics certificate program is designed to provide the academic foundation towards the INFORMS Certified Analytics Professional (CAP) certification.  Note that CAP requires experience in applying Analytics in non-academic settings and an academic foundation needs to be supplemented by experience applying analytics in a non-academic environment.

Program requires

1. Pre-requisites:  Statistics analysis, Decision technology (existing MBA courses)
2. Required:  Data Mining, Competitive Intelligence, Advanced Decision Technologies
3. 4.5 credits choose from:  Social media analytics, Revenue management and Pricing, Shopper Marketing, Simulation, Process engineering, Forecasting

-  The differences between the Industrial Engineering department and the offerings at the SIS or Katz is the base provided by the predictive and prescriptive analytics core of IE: Queuing, Optimization, Simulation.  This is consistent with the INFORMS CAP understanding of analytics being of three phases, descriptive, predictive, prescriptive.
-  All three proposals would have a data science foundation of data mining/machine learning. 
  -  The SIS program appears to be a combination of analytics and computational data analytics. IE offerings in prescriptive analytics are available to SIS students.  Essentially, the SIS and IE proposed program have comparable analytic cores in computational descriptive and predictive analytics, but reverse the emphasis on the data engineering and prescriptive analytics.
  -  The Katz program appears to be a combination of analytics and business analytics.  The proposed IE program would be geared towards the spectrum of descriptive, predictive, prescriptive analytics in comparison to the Katz program which after the data mining core encourages focus on specific applications areas within the Katz Business school.
  -  In terms of the Conway Data Science Venn Diagram, the SIS proposal is slightly weighted towards the computer hacking corner, the Katz more focused on the application domain, and the IE proposal more focused on the mathematics/statistics corner.
  -  The three proposals also map to the three types of data science programs that are in the market. This is exemplified by the Georgia Tech program, which explicitly identifies three paths that are comparable to the three proposals.


