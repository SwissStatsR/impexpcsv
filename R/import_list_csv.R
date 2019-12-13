
#' Import various csv files in a "row-binded" data.table with the same columns
#' 
#' @inheritParams common_columns
#' @param col_names a character vector with the names of the columns to be imported from each csv file. If NULL (default), all common columns will be imported.
#' 
#' @examples 
#' # The package contains two small csv files: csv01.csv and csv02.csv
#' # The first one has 3 columns: x, y and z
#' # The second one has only 2 columns: x and z
#' 
#' # By default, import_list_csv imports all the common columns of the csv 
#' # files
#' import_list_csv(
#'   c(system.file("extdata", "csv01.csv", package = "impexpcsv"),
#'   system.file("extdata", "csv02.csv", package = "impexpcsv"))  
#' )
#' 
#' # Import only column "x" of each csv file
#' import_list_csv(
#'   c(system.file("extdata", "csv01.csv", package = "impexpcsv"),
#'   system.file("extdata", "csv02.csv", package = "impexpcsv")),
#'   col_names = "x"
#' )
#' 
#' @return a data table with all the csv files binded together
#' @export  
import_list_csv <- function(csv_files, col_names = NULL, ...){
  stopifnot(is.character(csv_files))
  if(is.null(col_names)) col_names <- common_columns(csv_files, ...)
  
  stopifnot(is.character(col_names))
  
  list_csv <- lapply(csv_files, data.table::fread, select = col_names, ...)
  
  res <- rbindlist(list_csv)
  res
}