# Intro To R (1 Day) 

[![Join the chat at https://gitter.im/rockefelleruniversity/Lobby](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/rockefelleruniversity/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![Build Status](https://travis-ci.org/rockefelleruniversity/Intro_To_R_1Day.svg?branch=master)](https://travis-ci.org/rockefelleruniversity/Intro_To_R_1Day)

[![Build status](https://ci.appveyor.com/api/projects/status/9pwvbfmilu8nq3bq?svg=true)](https://ci.appveyor.com/project/ThomasCarroll/intro-to-r-1day-tq3fi)


##The Course

This course introduces R and statistical programming.

The course consists of 2 sections, 1 on basic R data types and data I/O and a second on conditionals and looping.  
Each section is presented as both HTMl and Rpres markdown ( to allow for intergration of the presentation in the RStudion enviroment itself).  Exercises and answer sheets are included after all subsections to practice techniques and provide future reference examples. 

Course material and exercises are available to view as rendered HTML at http://rockefelleruniversity.github.io/Intro_To_R_1Day/.  
All material is available to download under GPL v2 license.

For  information on other courses run by our team see our [github IO page](http://rockefelleruniversity.github.io/training/).


## Setting up.


#### Install R.

R can be installed from the R-project website.  
R 3.1.0 or higher is required for this course.

http://www.r-project.org/

#### Install RStudio.

RStudio can be installed from the R-project website. 

http://www.rstudio.com/

#### Install required packages.

Having downloaded R and RStudio, some additional packages are required (rmarkdown and ggplot2).  
To install these,
* First launch RStudio
* Install the packages in the R console
<pre>
install.packages("ggplot2",dependencies=TRUE)
install.packages("rmarkdown",dependencies=TRUE)
</pre>

#### Download the material
The material can either be downloaded as a [zip](https://github.com/mrccsc/Intro_To_R_1Day/archive/master.zip)
<pre>
wget https://github.com/rockefelleruniversity/Intro_To_R_1Day/archive/master.zip ./
</pre>
or checked out from our Github repository
https://github.com/rockefelleruniversity/Intro_To_R_1Day/
