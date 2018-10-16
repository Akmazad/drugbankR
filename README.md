# Introduction 
This package can be used to query specific version (*e.g.* 5.0.10) of DrugBank database in R. It can transform the original version of DrugBank database (xml file), which is available [here](http://www.drugbank.ca/releases/latest), into dataframe and store in SQLite database. The generated specific version of drugbank SQLite database can be queried by using `queryDB` function. We can

* Get the entire drugbank dataframe

* Get all the drugbank ids

* Determine whether the given drugs are FDA approved

* Get targets of the given drugs.

The corresponding R package is available <a href="https://github.com/yduan004/drugbankR">here</a>

# Getting Started

## Installation

The _`drugbankR`_ package can be get from github

```r
# install.packages("devtools")
devtools::install_github("yduan004/drugbankR")
library(drugbankR)
```

## Generate your own drugbank SQLite database from specific version of drugbank full database (xml file) downloaded from [here](http://www.drugbank.ca/releases/latest)

```r
## To start with the Database
## 1. download the original drugbank database (http://www.drugbank.ca/releases/latest) (xml file) 
## 2. rename that as "drugbank.xml"
## 3. copy-paste into your current directory

# transform drugbank database (xml file) into dataframe, this may take about 20 minutes. Argument version is the version of downloaded xml file. We currently have version 5.0.10
drugbank_dataframe <- dbxml2df(xmlfile="drugbank.xml", version="5.0.10") 

# store drugbank dataframe in SQLite database, the created SQLite database (drugbank_version.db) is under "extdata" directory of "drugbankR" package.
df2SQLite(dbdf=drugbank_dataframe, version="5.0.10")

# You can see the path of "drugbank_version.db" by running
system.file("extdata", package="drugbankR")
```

## Query specific version of drugbank SQLite database

```r
all <- queryDB(type = "getAll", version="5.0.10") # get the entire drugbank dataframe
dim(all)
ids <- queryDB(type = "getIDs", version="5.0.10") # get all the drugbank ids
ids[1:4]

# given drugbank ids, determine whether they are FDA approved
queryDB(ids = c("DB00001","DB00002"),type = "whichFDA", version="5.0.10") 

# given drugbank ids, get their targets
queryDB(ids = c("DB00001","DB00002"),type = "getTargets", version="5.0.10") 
```

## Query specific version of drugbank SQLite database with Drug Name
all <- queryDB(type = "getAll", version="5.0.10") # get the entire drugbank dataframe
names = c("Salbutamol","Levobupivacaine")         # a set of drug names to find their approval information
subNames = all[all$"name" %in% names,]
whichFDA = grepl("approved",subNames$groups)
whichFDA

