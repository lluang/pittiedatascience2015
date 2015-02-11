---
title: "Proposal for Graduate Certificate in Data Science"
author: "Louis Luangkesorn"
date: "02/11/2015"
output: html_document
---

Introduction
===============

As informations systems grow more ubiquious and inexpensive, many organizations have expereienced a large increase in the amount of data available. The emergence of Big Data has led to situations that could only be analyzed through traditional statistics with a high degree of nuance that is not commonly available. The field of data science (AKA Machine learning, predictive modeling, knowledge discovery and data mining) has emerged to describe the methods and practices related to managing big data, analysis, and interpreting the analysis within a decision making workflow.

Because of the need to integrate the data preparation, exploration, modeling, analysis, and presentation of results into a unified workflow, standalone, single function tools that have been used to teach individual courses lead to a siloed understanding of 

Characteristics of big data
---------------------------

Big data can be characterized by four aspects.

1.  Volume
2.  Velocity
3.  Variety
4.  Varacity

![3Vs of Big data](lectures/resources/BigData3vs.png)

1.  Volume refers to presence of quantities of data that are beyond the capability of a single analysis sitting at a single computer to analyze.  The knowledge needed to work with high volumes of data include the IT capabilities of remote storage and remote processing (cloud computing) and the understanding of programming concepts needed to take advantage of cloud computing resources (parallel processing, functional programming).
2.  Velocity refers to the changing nature of data within a short decision cycle. This becomes an issue in cases where decisions have to be made for a specific instance on a small amount of specific data, or when the character of the data changes rapidly.  Working with this requires methods that can integrate within corporate IT systems (databases) and can use the mass of related data to provide insight into a specific observation (machine learning methods and Bayesian based statistics).
3.  Variety refers to the range of information that is available on a specific observation.  This variety can come from the fact that data may be available on a single subject from a range of sources, or because collecting and storing a range of attributes on a specific observation is easy. It may also result from the range of data storage and transmission types that are commonly encountered in practice. Working with a wide range of data requires knowledge of data handling methods and methods to identify which attributes or combinations of attributes are important (data processing and machine learning).
4.  Varacity refers to the correct understanding of the meaning of the information available. This includes dealing with missing values, identifying and correcting data errors, and an understanding of the intent of the data collectors.  Skills and knowledge in working with these issues include data munging and data analysis.

Characteristics of data scientists.
------------------------------

Drew Conway describes data scientists as having a combination of three sets of disparet skill:
  - Hacking skills,
  - Math and statistics knowledge, and
  - Substantive expertise.



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

Popular languages for this are R and Python.  Other languages that share these characteristics include Julia, Clojure, Scala, and F#.  Matlab/Octave is also a close fit, however it does not have good facilities for working with character data nor does it have the equivalent to a data frame type.  Numeric and statistical libraries are often written in C, C++, Java, or Fortran, but they lack interactivity and do not have the expressiveness that corresponds to the forms used to represent problems and algorithms in mathematical or statistical notation which are useful for practing data science.



The foundation of data analysis methods lie in mathematics and statistics.
Data Science:  Math and Statistics
==================================
left:60%
-  The next step is to actually extract insight from it.
-  Apply appropriate math and statistics methods.
-  Without this, you can produce what looks like meaningful output using a computer, but the output is without meaning.  VERY DANGEROUS.
- *Lies, damned lies, and statistics*

***


Data Science:  Substantive Expertise
====================================
left:60%
-  Science is about discovery and building knowledge, which requires some motivating questions about the world and hypotheses tested with statistical methods.
-  Most academics (you) have math and statistics plus substantive expertise.

***

