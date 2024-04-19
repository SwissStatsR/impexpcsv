

#' Find common columns of various csv files
#' 
#' @param csv_files a character vector with paths to one ore more csv files
#' @param ... further arguments to be passed to data.table::fread() (except nrows, which is set to 0)
#' 
#' @return a character vector with the names of the common columns of the csv files
#' 
#' @examples 
#' 
#' # The package contains two small csv files: csv01.csv and csv02.csv
#' # The first one has 3 columns: x, y and z
#' # The second one has only 2 columns: x and z
#' common_columns(
#'   c(system.file("extdata", "csv01.csv", package = "impexpcsv"),
#'   system.file("extdata", "csv02.csv", package = "impexpcsv"))  
#' )
#' @export
common_columns <- function(csv_files, ...) {
  list_columns <- lapply(csv_files, data.table::fread, nrows = 0, ...)
  list_columns <- lapply(list_columns, colnames)
  
  res <- Reduce(base::intersect, list_columns)
  res
}

