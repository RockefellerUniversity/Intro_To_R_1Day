Introduction to R, Session 2
========================================================
author: Rockefeller University, Bioinformatics Resource Centre
date:http://rockefelleruniversity.github.io/Intro_To_R/
width: 1440
height: 1100
autosize: true
font-import: <link href='http://fonts.googleapis.com/css?family=Slabo+27px' rel='stylesheet' type='text/css'>
font-family: 'Slabo 27px', serif;
css:style.css


Overview
========================================================

- [Recap](#/recap)
- [Conditions and Loops](#/control)
- [Writing scripts](#/scripts)
- [Libraries](#/libraries)


Recap on what we have covered. 
========================================================

Session 1 covered introduction to R data types, inputing data, plotting and statistics.

- [Background to R](#/background)
- [Data types in R](#/datatypes)
- [Reading and writing data in R](#/reading)

Recap (1/3) 
========================================================

R stores data in five main data types.

- **Vector** - Ordered collection of single data type (numeric/character/logical).
- **Matrix** - Table (ordered 2D collection) of single data type (numeric/character/logical).
- **Factors** -Ordered collection of ordinal or nominal catagories.
- **Data frame** - Table (ordered 2D array) of multiple data types of same length.
- **List** - Ordered collection of multiple data types of differing length

Recap.(2/3)
========================================================

Data can be read into R as a table with the **read.table()** function and written to file with the **write.table()** function.


```r
Table <- read.table("data/readThisTable.csv",sep=",",header=T,row.names=1)
Table[1:3,]
```

```
       Sample_1.hi Sample_2.hi Sample_3.hi Sample_4.low Sample_5.low
Gene_a    4.570237    3.230467    3.351827     3.930877     4.098247
Gene_b    3.561733    3.632285    3.587523     4.185287     1.380976
Gene_c    3.797274    2.874462    4.016916     4.175772     1.988263
       Sample_1.low
Gene_a     4.418726
Gene_b     5.936990
Gene_c     3.780917
```

```r
write.table(Table,file="data/writeThisTable.csv", sep=",", row.names =F,col.names=T)
```


Conditions and Loops
=====================
type:section

Conditions and Loops (1/21)
========================================================

We have looked at using logical vectors as a way to index other data types

```r
x <- 1:10
x[x < 4]
```

```
[1] 1 2 3
```

Logicals are also used in controlling how scripted procedures execute.


Conditions and Loops (2/21) - Two important control structures
========



* <span style="color:red">Conditional branching (if,else)</span>
* <span style="color:green">Loops (for, while)</span>

<span style="color:green">While</span> I'm analysing data, <span style="color:red">if</span> I need to execute complex statistical procedures on the data I will use R <span style="color:red">else</span> I will use a calculator.

Conditions and Loops (3/21) - Conditional Branching.
========

Conditional Branching is the evaluation of a logical to determine whether a chunk of code is executed.

In R, we use the **if** statement with the logical to be evaluated in **()** and dependent code to be executed in **{}**.


```r
x <- TRUE
if(x){
  message("x is true")
}
```

```
x is true
```

```r
x <- FALSE
if(x){
  message("x is true")
}
```
Conditions and Loops (4/21) - Evaluating in if() statements
====

More often, we construct the logical value within **()** itself.This can be termed the **condition**. 


```r
x <- 10
y <- 4
if(x > y){
  message("The value of x is ",x," which is greater than ", y)
}
```

```
The value of x is 10 which is greater than 4
```
Here the message is printed because x is greater than y. 


```r
y <- 20
if(x > y){
  message("The value of x is ",x," which is greater than ", y)
}
```
Here, x is not longer greater than y, so no message is printed.

We really still want a message telling us what was the result of the condition.

Conditions and Loops (5/21) -else following an if().
========================

If we want to perform an operation when the condition is false we can follow the if() statement with an else statement.


```r
x <- 10
if(x < 5){
  message(x, " is less than to 5")
   }else{
     message(x," is greater than or equal to 5")
}
```

```
10 is greater than or equal to 5
```
***

With the addition of the else statement, when x is not greater than 5 the code following the else statement is executed.


```r
x <- 3
if(x < 5){
  message(x, " is less than 5")
   }else{
     message(x," is greater than or equal to 5")
}
```

```
3 is less than 5
```



Conditions and Loops (6/21) - else if
===========

We may wish to execute different procedures under multiple conditions. This can be controlled in R using the else if() following an initial if() statement.

```r
x <- 5
if(x > 5){
  message(x," is greater than 5")
  }else if(x == 5){
    message(x," is 5")
  }else{
    message(x, " is less than 5")
  }
```

```
5 is 5
```

Conditions and Loops (7/21) -ifelse()
======

A useful function to evaluate conditional statements over vectors is the **ifelse()** function.


```r
x <- 1:10
x
```

```
 [1]  1  2  3  4  5  6  7  8  9 10
```

The ifelse() functions take the arguments of the condition to evaluate, the action if the condition is true and the action when condition is false.


```r
ifelse(x <= 3,"lessOrEqual","more") 
```

```
 [1] "lessOrEqual" "lessOrEqual" "lessOrEqual" "more"        "more"       
 [6] "more"        "more"        "more"        "more"        "more"       
```

This allows for multiple nested **ifelse** functions to be applied to vectors.


```r
ifelse(x == 3,"same",
       ifelse(x < 3,"less","more")
       ) 
```

```
 [1] "less" "less" "same" "more" "more" "more" "more" "more" "more" "more"
```
Conditions and Loops (8/21) -Loops
======

The two main generic methods of looping in R are **while** and **for**

- **while** - *while* loops repeat the execution of code while a condition evaluates as true.

- **for** - *for* loops repeat the execution of code for a range of specified values.

Conditions and Loops (9/21) -While loops
=====

While loops are most useful if you know the condition will be satisified but are not sure when. (i.e. Looking for a point when a number first occurs in a list).

```r
x <- 1
while(x != 3){
  message("x is ",x," ")
  x <- x+1
}
```

```
x is 1 
```

```
x is 2 
```

```r
message("Finally x is 3")
```

```
Finally x is 3
```

Conditions and Loops (10/21) -For loops
=====

For loops allow the user to cycle through a range of values applying an operation for every value.

Here we cycle through a numeric vector and print out its value.

```r
x <- 1:5
for(i in x){
  message("Loop",i," ", appendLF = F)
}
```

```
Loop1 Loop2 Loop3 Loop4 Loop5
```
***
Similarly we can cycle through other vector types (or lists)

```r
x <- toupper(letters[1:5])
for(i in x){
  message("Loop",i," ", appendLF = F)
}
```

```
LoopA LoopB LoopC LoopD LoopE
```




Conditions and Loops (11/21) - Looping through indices
=====

We may wish to keep track of the position in x we are evaluating to retrieve the same index in other variables. A common practice is to loop though all possible index positions of x using the expression **1:length(x)**.


```r
geneName <- c("Ikzf1","Myc","Igll1")
expression <- c(10.4,4.3,6.5)
1:length(geneName)
```

```
[1] 1 2 3
```

```r
for(i in 1:length(geneName)){
  message(geneName[i]," has an RPKM of ",expression[i])
}
```

```
Ikzf1 has an RPKM of 10.4
```

```
Myc has an RPKM of 4.3
```

```
Igll1 has an RPKM of 6.5
```

Conditions and Loops (12/21) -Loops and conditionals
=======================
Left:60%
Loops can be combined with conditional statements to allow for complex control of their execution over R objects. 


```r
x <- 1:13

for(i in 1:13){
  if(i > 10){
    message("Number ",i," is greater than 10")
  }else if(i == 10){
    message("Number ",i," is  10") 
  }else{
    message("Number ",i," is less than  10") 
  }
}
```
***

```
Number 1 is less than  10
```

```
Number 2 is less than  10
```

```
Number 3 is less than  10
```

```
Number 4 is less than  10
```

```
Number 5 is less than  10
```

```
Number 6 is less than  10
```

```
Number 7 is less than  10
```

```
Number 8 is less than  10
```

```
Number 9 is less than  10
```

```
Number 10 is  10
```

```
Number 11 is greater than 10
```

```
Number 12 is greater than 10
```

```
Number 13 is greater than 10
```

Conditions and Loops (13/21) - Breaking loops
=====

We can use conditionals to exit a loop if a condition is satisfied, just a like while loop.


```r
x <- 1:13

for(i in 1:13){
  if(i < 10){
    message("Number ",i," is less than 10")
  }else if(i == 10){
    message("Number ",i," is  10")
    break
  }else{
    message("Number ",i," is greater than  10") 
  }
}
```
***

```
Number 1 is less than 10
```

```
Number 2 is less than 10
```

```
Number 3 is less than 10
```

```
Number 4 is less than 10
```

```
Number 5 is less than 10
```

```
Number 6 is less than 10
```

```
Number 7 is less than 10
```

```
Number 8 is less than 10
```

```
Number 9 is less than 10
```

```
Number 10 is  10
```

Conditions and Loops (14/21) -Functions to loop over data types
================================

There are functions which allow you to loop over a data type and apply a function to the subsection of that data.

- **apply** - Apply function to rows or columns of a matrix/data frame and return results as a vector,matrix or list.

- **lapply** - Apply function to every element of a vector or list and return results as a list.

- **sapply** - Apply function to every element of a vector or list and return results as a vector,matrix or list.

Conditions and Loops (15/21) - apply()
=========

The **apply()** function applys a function to the rows or columns of a matrix. The arguments **FUN** specifies the function to apply and **MARGIN** whether to apply the functions by rows/columns or both.

```
apply(DATA,MARGIN,FUN,...)
```

- **DATA** - A matrix (or something to be coerced into a matrix)
- **MARGIN** - 1 for rows, 2 for columns, c(1,2) for cells

Conditions and Loops (16/21) - apply() example
====

```r
matExample <- matrix(c(1:4),nrow=2,ncol=2,byrow=T)
matExample
```

```
     [,1] [,2]
[1,]    1    2
[2,]    3    4
```
Get the mean of rows

```r
apply(matExample,1,mean)
```

```
[1] 1.5 3.5
```
Get the mean of columns

```r
apply(matExample,2,mean)
```

```
[1] 2 3
```

Conditions and Loops (16/21) - Additional arguments to apply
=====================
Additional arguments to be used by the function in the apply loop can be specified after the function argument. 

Arguments may be ordered as if passed to function directly. For **paste()** function however this isn't possible.



```r
apply(matExample,1,paste,collapse=";")
```

```
[1] "1;2" "3;4"
```

Conditions and Loops (17/21) - lapply()
====

Similar to apply, **lapply** applies a function to every element of a vector or list. 

**lapply** returns a list object containing the results of evaluating the function.


```r
lapply(c(1,2),mean)
```

```
[[1]]
[1] 1

[[2]]
[1] 2
```
***
As with apply() additional arguments can be supplied after the function name argument.


```r
lapply(list(1,c(NA,1),2),mean, na.rm=T)
```

```
[[1]]
[1] 1

[[2]]
[1] 1

[[3]]
[1] 2
```

Conditions and Loops (18/21) -sapply()
=====

**sapply** (*smart apply*) acts as lapply but attempts to return the results as the most appropriate data type.

Here sapply returns a vector where lapply would return lists.

```r
exampleVector <- c(1,2,3,4,5)
exampleList <- list(1,2,3,4,5)
sapply(exampleVector,mean,na.rm=T)
```

```
[1] 1 2 3 4 5
```

```r
sapply(exampleList,mean,na.rm=T)
```

```
[1] 1 2 3 4 5
```

Conditions and Loops (19/21) - sapply() example
=====

In this example lapply returns a list of vectors from the quantile function.


```r
exampleList <- list(row1=1:5, row2=6:10, row3=11:15)
exampleList
```

```
$row1
[1] 1 2 3 4 5

$row2
[1]  6  7  8  9 10

$row3
[1] 11 12 13 14 15
```

***

```r
lapply(exampleList,quantile)
```

```
$row1
  0%  25%  50%  75% 100% 
   1    2    3    4    5 

$row2
  0%  25%  50%  75% 100% 
   6    7    8    9   10 

$row3
  0%  25%  50%  75% 100% 
  11   12   13   14   15 
```

Conditions and Loops (20/21) - sapply() example 2
=====

Here is an example of sapply parsing a result from the quantile function in a *smart* way.

When a function always returns a vector of the same length, sapply will create a matrix with elements by column.


```r
sapply(exampleList,quantile)
```

```
     row1 row2 row3
0%      1    6   11
25%     2    7   12
50%     3    8   13
75%     4    9   14
100%    5   10   15
```

Conditions and Loops (21/21) - sapply() example 4
=====

When sapply cannot parse the result to a vector or matrix, a list will be returned.


```r
exampleList <- list(df=data.frame(sample=paste0("patient",1:2), data=c(1,12)), vec=c(1,3,4,5))
sapply(exampleList,summary)
```

```
$df
      sample       data      
 patient1:1   Min.   : 1.00  
 patient2:1   1st Qu.: 3.75  
              Median : 6.50  
              Mean   : 6.50  
              3rd Qu.: 9.25  
              Max.   :12.00  

$vec
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   1.00    2.50    3.50    3.25    4.25    5.00 
```

Time for an exercise!
========================================================

Exercise on loops and conditional branching can be found [here](http://rockefelleruniversity.github.io/Intro_To_R_1Day/r_course/exercises//conditionsAndLoops_Exercises.html)

Answers to exercise.
========================================================

Answers can be found here  [here](http://rockefelleruniversity.github.io/Intro_To_R_1Day/r_course/answers/conditionsAndLoops_Answers.html)

Rcode for answers can be found here  [here](http://rockefelleruniversity.github.io/Intro_To_R_1Day/r_course/answers/conditionsAndLoops_Answers.R)


Scripts
=====================
type:section


Saving scripts
============

Once we have got our functions together and know how we want to analyse our data, we can save our analysis as a **script**. By convention R scripts typically end in **.r** or **.R**

To save a file in RStudio.


**-> File -> Save as**


To open a previous R script

**->File -> Open File..**

To save all the objects (workspace) with extension **.RData**

**->Session -> Save workspace as**

Sourcing scripts.
======

R scripts allow us to save and reuse custom functions we have written.  To run the code from an R script we can use the **source()** function with the name of the R script as the argument. 

The file **dayOfWeek.r** in the "scripts" directory contains a simple R script to tell you what day it is after your marathon R coding session.

```
#Contents of dayOfWeek.r
dayOfWeek <- function(){
  return(gsub(" .*","",date()))  
}
```

```r
source("scripts/dayOfWeek.R")
dayOfWeek()
```

```
[1] "Fri"
```

Rscript
====

R scripts can be run non-interactively from the command line with the **Rscript** command, usually with the option **--vanilla** to avoid saving or restoring workspaces. All messages/warnings/errors will be output to the console.

```
Rscript --vanilla myscript.r
```

An alternative to Rscript is **R CMD BATCH**. Here all messages/warnings/errors are directed to a file and the processing time appended.

```
R CMD BATCH myscript.r
```

Sending arguments to Rscript
====

To provide arguments to an R script at the command line we must add **commandArgs()** function to parse command line arguments.


```r
args <- commandArgs(TRUE)
myFirstArgument <- args[1]
myFirstArgument
as.numeric(myFirstArgument
```

```
'10'
```

```r
as.numeric(myFirstArgument)
```
```
10
```
Since vectors can only be one type, all command line arguments are strings and must be converted to numeric if needed with **as.numeric()**

Loading libraries
================

Libraries can be loaded using the library() function with an argument of the name of the library


```r
library(ggplot2)
```

You can see what libraries are available in the Packages panel or by the  library() function with no arguments supplied


```r
library()
```

Installing libraries
================

Libraries can be installed through the R studio menu

**-> Tools -> Install packages ..**

Or by using the install.packages() command


```r
install.packages("Hmisc")
```


Getting help
====

- Google
- Local friendly bioinformaticians and computational biologists.
- [Stackoverflow](http://stackoverflow.com/)
- [R-help](https://stat.ethz.ch/mailman/listinfo/r-help)

The end
====

Two tips
====

