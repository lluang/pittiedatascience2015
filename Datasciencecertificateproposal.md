---
title: "Proposal for Graduate Certificate in Data Science"
author: "Louis Luangkesorn"
date: 'DRAFT: November 18, 2016'
output:
  html_document:
    toc: yes
  word_document: default
---

Introduction
===============

As information systems grow more ubiquitous and inexpensive, many organizations have experienced a large increase in the amount of data available. The emergence of Big Data has led to situations that are not appropriately analyzed through traditional hypothesis testing oriented statistics. The field of data science (AKA Machine learning, predictive modeling, knowledge discovery and data mining) has emerged to describe the methods and practices related to managing big data, analysis, and interpreting the analysis within a decision making workflow.

Because of the need to integrate the data preparation, exploration, modeling, analysis, and presentation of results into a unified workflow; standalone, single function tools that have been used to teach individual courses lead to a siloed understanding of quantitative methods that cannot be applied in practice. People with purely analytical skills such as that taught in statistics or engineering departments often do not have the computer skills necessary to allow their skills to be applied or for their solutions to be implemented without substantial assistance, making them a junior partner in an analysis. The data scientist program is intended to give participants:

  1.  The analytical skills to work with data science/machine learning methods and perform model evaluation.
  2.  Computer skills to work with information systems, work with data that has the qualities of big data, and deliver results in a usable form.
  
The design of the data science concentration is based on two descriptions of data science analysts. From the point of view of information technology professionals, most descriptions of data science conform to Drew Conway's [^conway2013] (CEO, Alluvium, PhD from NYU) description of having competency in a combination of mathematical and statistical knowledge, substantive expertise, and information systems (hacking) skills.  Another viewpoint is provided by the INFORMS Analytics Society, whose analytics job task analysis [^nestler2012] describes the work of a data science analyst as covering six areas (domains):

1. Business problem framing
2. Analytics problem framing
3. Data
4. Methodology (approach) selection
5. Model building
6. Deployment
7. Model lifecycle management

Both Drew Conway and the INFORMS Analytics section officers observe that most engineering programs focus on mathematical and statistical knowledge (domains 3, 4, 5) and provide very little to help graduates address the business problem (subject matter expertise or domains 1, 2) or actual implementation of the methods in a business setting (information systems or domains 6 and 7).  The design of the program in this proposal seeks to keep a broad base in the mathematical and statistical methods that are the strength of an industrial engineering program while providing computational skill and sense of the needs of business focused clients.


Proposal for a data science concentration as part of the MS in Industrial Engineering
--------------------------

There are three generally recognized broad areas of knowledge required for a career in data science.

1. Mathematics and statistical knowledge
2. Computer programming (technical computing and data manipulation and presentation)
3. Subject matter expertise

The requirements outlined beyond the core are intended to both round out the mathematical and statistical knowledge beyond the core requirements, and to provide 

Core requirements

-  IE 2005 Probability and Statistics
-  IE 2001 Operations research


Concentration requirements

-  IE 2064 Data Science (covers technical computing, data manipulation, and model evaluation)
-  IE 2xxx Machine learning (focuses on algorithm development and application)
-  IE 2007 Statistics and Data Analysis (additional statistics depth)
-  IE 2088 Simulation (add simulation to analytical toolkit)
-  INFSCI 2710 Database Management course that includes accessing database from a data analysis program. Potentially it could introduce students to cloud computing platforms in common use in data science and analytics. Note that it is considerably more rigorous than IE 1014/2004: Database Design.  In particular, students will use a MySQL centered workflow, which has interfaces that are similar to most other databases used in production. In contrast to MS Access, which does not support ODBC in the latest version or any other standard methods for embedding databases into analytics applications (e.g. from R, Python, Java, . . .)


-  2 quantitative application area courses approved by adviser (e.g. Mfg, Supply chain, Health systems, Financial engineering, Marketing).  This course provides exposure to subject area analytics issues.

Overview of data science and big data
======================================

Characteristics of big data
---------------------------

Big data can be characterized by four aspects. These aspects drive the data processing/programming requirements as well as the models and ways of thinking that are needed for the analysis and model evaluation.

1.  Volume
2.  Velocity
3.  Variety
4.  Veracity

![3Vs of Big data](lectures/resources/BigData3vs.png)

1.  Volume refers to presence of quantities of data that are beyond the capability of a single analysis sitting at a single computer to analyze.  The knowledge needed to work with high volumes of data include the IT capabilities of remote storage and remote processing (cloud computing) and the understanding of programming concepts needed to take advantage of cloud computing resources (parallel processing, functional programming).
2.  Velocity refers to the changing nature of data within a short decision cycle. This becomes an issue in cases where decisions have to be made for a specific instance on a small amount of specific data, or when the character of the data changes rapidly.  Working with this requires methods that can integrate within corporate IT systems (databases) and can use the mass of related data to provide insight into a specific observation (machine learning methods and Bayesian based statistics).
3.  Variety refers to the range of information that is available on a specific observation.  This variety can come from the fact that data may be available on a single subject from a range of sources, or because collecting and storing a range of attributes on a specific observation is easy. It may also result from the range of data storage and transmission types that are commonly encountered in practice. Working with a wide range of data requires knowledge of data handling methods and methods to identify which attributes or combinations of attributes are important (data processing and machine learning).
4.  Veracity refers to the correct understanding of the meaning of the information available. This includes dealing with missing values, identifying and correcting data errors, and an understanding of the intent of the data collectors.  Skills and knowledge in working with these issues include data manipulation and exploratory data analysis.

Characteristics of data scientists.
------------------------------

Drew Conway describes data scientists as having a combination of three sets of disparate skills:

- computer programming/hacking skills,
- math and statistics knowledge, and
- substantive expertise.



![Drew Conway Data Science](lectures/resources/Data_Science_VD.png)

### Computer programming skills

Computer programming skills are required because data is recorded, stored, and transferred electronically, so data scientists need to be able to manipulate text files, understand factorized operations to work with data, and to think algorithmic ally.  Without computer skills means you cannot even get started with using electronic data.  The computer programming skills also link the various steps in the data workflow together from data collection, manipulation, modeling, analysis, then presentation of results. In contrast, single purpose programs typically do not lend themselves to being part of an integrated workflow.

In practice, a set of programming languages have become common in data science. They have the following characteristics:

1.  Built on top of numeric libraries for computation including linear algebra libraries (BLAS/LAPACK)
2.  Can operate on vectors and related data types (include functional programming capabilities).
3.  Interactive, either through an interpreter or a Read-Evaluate-Print-Loop readily available (no separate compilation step is required as methods are modified).
4.  Have available a large number of topical and subject based scientific computation libraries.
5.  Have facilities to manage a range of types of data to include numerical and character based data.
6.  Have data structures that maintain knowledge of relationship and properties of data elements. (e.g. the data frame type)
7.  Have good and flexible graphical capabilities.
8.  Can express data analysis methods in forms corresponding to mathematical and statistical notation.

Popular languages for this are R and Python.  Other languages that share these characteristics include Julia, Clojure, Scala, and F#.  Matlab/Octave is also a close fit, however it does not have good facilities for working with character data nor does it have the equivalent to a data frame type.  Numeric and statistical libraries are often written in C, C++, Java, or Fortran, but they lack interactivity and do not have the expressiveness that corresponds to the forms used to represent problems and algorithms in mathematical or statistical notation which are useful for practicing data science. Programming languages used in data science have facilities to easily integrate compiled numerical and statistical libraries.

Another note is that this is not the same as the standard computer science curriculum. While the CS curriculum can provide a good foundation for the programming skills required, in practice what is required is the ability to use computer programming to build the workflow that goes from data exploration to data manipulation to model development and evaluation to presentation of results in forms useful for decision making.  In many cities, programmers in industry have formed groups that focus on teaching the skills required for practical use to both those with university training in programming (e.g. computer science or electrical engineering majors) and those without deep programming background (e.g. most statistics and engineering or non-technical majors). One such group is Code & Supply based in Pittsburgh.

### Math and Statistics

While computer programming is required in order to even get started in data science, an understanding of the mathematical and statistical principles that underlie the methods is needed to give insight into which methods may be useful for a given problem and to evaluate the quality of models used. In the absence of this understanding, the analyst is essentially feeding data to a computer and taking output but without its meaning may be misunderstood and can lead to poor results.

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

Understanding this CoNVO framework drives many of the decisions to be made by the data scientist. First, it helps in identifying outcomes and decision variables, which are based on the Need and Outcome of the organization.f Second it helps in model evaluation, for example in making the tradeoffs between Type I and Type II errors (and their counterparts in other model evaluation methods).

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
  -  In terms of the Conway Data Science Venn Diagram, the SIS proposal is slightly weighted towards the computer hacking corner, the Katz more focused on the application domain (marketing and other business domains), and the IE proposal more focused on the mathematics/statistics corner.
  -  The three proposals also map to the three types of data science programs that are in the market. This is exemplified by the Georgia Tech program, which explicitly identifies three paths that are comparable to the three proposals.
  -  We expect that the three programs will draw from the three types of populations that are attracted to data science.  Those with an IT oriented background will tend to take the SIS certificate program.  Those with a business or non-technical background will gravitate towards the Katz certificate program within the MBA.  Those with a STEM focus will gravitate towards the IE program.

[^nestler2012]: Scott Nestler, Jack Levis and Bill Klimack, 2012, Certified Analytics Professional, in ORMS Today, Vol 39, No. 5, https://www.informs.org/ORMS-Today/Public-Articles/October-Volume-39-Number-5/Certified-Analytics-Professional.

[^conway2013]: Drew Conway, 2013, The Data Science Venn Diagram, http://drewconway.com/zia/2013/3/26/the-data-science-venn-diagram, accessed November 18, 2016.
