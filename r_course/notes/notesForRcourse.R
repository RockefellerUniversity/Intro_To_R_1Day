http://rstudio-pubs-static.s3.amazonaws.com/23247_8af1a386e4184c95bb36ba7a6ea0f699.html

Good example for reproducibility!
  
  Talk about t() function

https://support.rstudio.com/hc/en-us/articles/200552086-Using-R-Markdown


Add part of making notebooks from r scripts 
http://rmarkdown.rstudio.com/r_notebook_format.html


http://quadroideas.com/great-google-font-combinations-ready-use/
  
  
  2. Importing data files using the scan function

The scan function is an extremely flexible tool for importing data.  Unlike the read.table function, however, which returns a data frame, the scan function returns a list or a vector. This makes the scan function less useful for inputting "rectangular" data such as the car data set that will been seen in later examples. In the previous example we input first numeric data and then string data directly from the console; in the following example, we input a text file. For the what option, we use list and then list the variables, and after each variable, we tell R what type of variable (e.g., numeric, string) it is. In the first example, the first variable is age, and we tell R that age is a numeric variable by setting it equal to 0. The second variable is called name, and it is denoted as a string variable by the empty quote marks.  In the second example, we list NULL first, indicating that we do not want the first variable to be read. After using the scan function, we use the sapply function, which makes a list out of a vector of names in x.

# inputting a text file and outputting a list
(x <- scan("http://www.ats.ucla.edu/stat/data/scan.txt", what = list(,
                                                                     name = "")))
## $age
## [1] 12 24 35 20
## 
## $name
## [1] "bobby"   "kate"    "david"   "michael"

Maybe talk about using  

The **F-statistic** is the result on an F-test on the model where the model is compared to a model with fewer parameters.

If the p-value from F-statistic is small, the model can be considered a good fit of the data.

Should i mention unique() function.!!!!!
  ====
  Vectorisation
Matrices to hold number only tables.

If we want to return a mix of different data types back from a function, we will use a list.


Its a good idea to have some simple checking of the arguments you have.
A useful function pt

Defining functions can
- Make code more accessible.
- Streamline repetitive tasks.
- Increase reproducibility. 


Nice for them to correct my slide by looping thorugh named vector.

Easy to read
x <- 1:40
y <- 5:35

Harder to read

Do i show that dimnames actually can set dimension names?

Some tips for speed comparisons..

Question?
Why cant you use na.rm=T in mean as an ordered unnamed arguments?

Getting help


Should i talk about append in write.table?

  
  Could have noice bit on 1 - pf(sm$fstatistic[1]?
                                 
                                 http://cran.r-project.org/doc/contrib/Torfs+Brauer-Short-R-Intro.pdf
                                 
                                 https://gist.github.com/hanbzu/6864862
                                 
                                 http://cran.r-project.org/doc/contrib/Baggott-refcard-v2.pdf
                                 
                                 You can make comments in notes
                                 
                                 You can speed up by using certain order..
                                 
                                 Data from clipboard
                                 =========================================================
                                   
                                   from Rstudio
                                 =========================================================
                                   
                                   Data from XLS
                                 =========================================================
                                   
                                   Data from dput
                                 =========================================================
                                   
                                   
                                   