% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/queries.R
\name{queryDB}
\alias{queryDB}
\title{Query drugbank SQLite database.}
\usage{
queryDB(ids = NULL, type, version = "5.0.10")
}
\arguments{
\item{ids}{A character vector, represent DrugBank IDs.}

\item{type}{Type can only be assigned to "getAll","getIDs","whichFDA","getTargets" 

getAll: get the entire drugbank dataframe, argument \code{ids} is ignored

getIDs: get all the drugbank ids, argument \code{ids} is ignored

whichFDA: given drugbank ids, determine whether they are FDA approved

getTargets: given drugbank ids, get their targets ids (DrugBank_id, UniProt_id, symbol...).}

\item{version}{Character, version of the requested drugbank database}
}
\value{
\code{getAll}: drugbank dataframe

\code{getIDs}: vector of all the drugbank ids

\code{whichFDA}: logical vector

\code{getTargets}: dataframe containing targets' DrugBank_id, UniProt_id, UniProt_name and gene_symbol
}
\description{
This function can be used to

1. get the entire drugbank dataframe

2. get all the drugbank ids

3. given drugbank ids, determine whether the drugs are FDA approved

4. given drugbank ids, get their targets ids (DrugBank_id, UniProt_id, symbol...).
}
