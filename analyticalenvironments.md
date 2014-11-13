Analysis environments
========================================================

###  Data science requirements

1. Read in data
2. Handle data of indefinite size
3. Manipulate data
4. Mathematical/statistical analysis
5. Presentation of results

###  Remember, analysis is never done in isolation

-  Analysis is always part of a larger problem.
-  When evaluating an analysis platform, think about what it needs to interface with.
-  Databases, text processing, GUI inputs, Web interfaces, decision support, etc.

Types of analytical environments
--------------------------------

###  Analytical environments

1.  GUI based spreadsheets.
  -  Excel, LibreOffice, Gnumeric
2.  GUI based statistical packages.
  -  Minitab, Statistica
3.  Batch based statistical packages
  -  SPSS, SAS
4.  General systems languages (static)
  -  C, C++, C#, Fortran, Java
5.  Data analysis programming languages (dynamic)
  -  Matlab, Python, R, F#, Clojure, Julia
6.  GUI interfaces to programming language libaries
  -  Weka, KMINE, Rattle, Orange

###  Criteria

1.  Employer forces a choice of language.
2.  Libraries available
3.  Ability to customize solutions.

###  Read in data

-  Generally the domain of languages with easy to use database interfaces.
-  Sometimes the ability to develop a GUI helpful.
-  Perl, Python, Ruby, Visual Basic.

###  Handle data of indefinite size

-  Indefinite size tends to using array or matrix based computation.
-  Languages with functional characteristics helpful.
  -  Vectorization makes it easier to read implementations of analytical methods.
  -  No side effects requirement of functional languages leads to thinking of operations on all rows or records rather than one record at a time.
  -  Principle strength of Excel.
-  Lisp, Clojure, R, Matlab, Python, Julia

###  Manipulate data

-  Need ability to work with text as well as numbers.
-  Regular expressions (mathematical tools for expressing methods for extracting text)
-  Text processing libraries
-  Perl, Python, Ruby, Java

### Mathematical and statistical analysis

-  Interfaces to Fortran and C based scientific libraries (e.g. LAPACK/BLAS)
-  Matlab, Python, R, IDL, Julia

### Presentation of results

-  Graphics and charting libraries.
-  Excel (not flexible)
-  Matlab, Python, R, Javascript all have good and flexible libraries.
-  Libraries exist for Java, C++ but they tend to not be flexible.