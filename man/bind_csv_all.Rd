% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bind_csv_all.R
\name{bind_csv_all}
\alias{bind_csv_all}
\title{Create a "row-binded" csv file appending all columns of various csv files}
\usage{
bind_csv_all(csv_files, col_names = NULL, csv_output, sep_output = ";", ...)
}
\arguments{
\item{csv_files}{a character vector with paths to one ore more csv files}

\item{col_names}{a character vector with the names of the columns to be imported from each csv file. If NULL (default), all common columns will be imported.}

\item{csv_output}{path to the csv file to be created and saved}

\item{sep_output}{column separator of csv_output (defalut: ";")}

\item{...}{further arguments to be passed to data.table::fread() (except nrows, which is set to 0)}
}
\description{
Create a "row-binded" csv file appending all columns of various csv files
}
