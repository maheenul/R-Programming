# R Programming Assignment-1 #
*Completed as a part of the online specialisation Data Science offered by John Hopkin's University in Coursera*

***

This directory contains all the .R files that were programmed for Assignment-1. In this programming assignment all the following tasks were completed:

## Task-1 ##
Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA.

Example Output:
```
source("pollutantmean.R")
pollutantmean("specdata", "sulfate", 1:10) 
## [1] 4.064128 
pollutantmean("specdata", "nitrate", 70:72)
## [1] 1.706047
pollutantmean("specdata", "nitrate", 23)
## [1] 1.280833
```

## Task-2 ##
Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases.

Example Output:
```
source("complete.R")
complete("specdata", 1) 
## id nobs
## 1 1 117 
complete("specdata", c(2, 4, 8, 10, 12)) 
## id nobs 
## 1 2 1041 
## 2 4 474 
## 3 8 192 
## 4 10 148 
## 5 12 96 
complete("specdata", 30:25) 
## id nobs 
## 1 30 93
## 2 29 711
## 3 28 475
## 4 27 338
## 5 26 586
## 6 25 463
complete("specdata", 3)
## id nobs
## 1 3 243 Part 3
```

## Task-3 ##
Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0.

Example Output:
```
source("corr.R")
source("complete.R")
cr <- corr("specdata", 150)
head(cr)
## [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
summary(cr)
## Min. 1st Qu. Median Mean 3rd Qu. Max.
## -0.21057 -0.04999 0.09463 0.12525 0.26844 0.76313
cr <- corr("specdata", 400)
head(cr)
## [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814 0.76312884 -0.15782860
summary(cr)
## Min. 1st Qu. Median Mean 3rd Qu. Max.
## -0.17623 -0.03109 0.10021 0.13969 0.26849 0.76313
cr <- corr("specdata", 5000)
summary(cr)
## Min. 1st Qu. Median Mean 3rd Qu. Max.
##
length(cr)
## [1] 0
cr <- corr("specdata")
summary(cr)
## Min. 1st Qu. Median Mean 3rd Qu. Max.
## -1.00000 -0.05282 0.10718 0.13684 0.27831 1.00000
length(cr)
## [1] 323
```