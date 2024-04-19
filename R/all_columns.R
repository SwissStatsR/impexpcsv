


#' Retrieves all column names from different csv files
#' 
#' 
#' @inheritParams common_columns
#' 
#' @examples 
#' 
#' # The package contains two small csv files: csv01.csv and csv02.csv
#' # The first one has 3 columns: x, y and z
#' # The second one has only 2 columns: x and z
#' all_columns(
#'   c(system.file("extdata", "csv01.csv", package = "impexpcsv"),
#'   system.file("extdata", "csv02.csv", package = "impexpcsv"))  
#' )
#' 
#' @export
all_columns <- function(csv_files, ...) {
  list_columns <- lapply(csv_files, data.table::fread, nrows = 0, ...)
  list_columns <- lapply(list_columns, colnames)
  
  res <- Reduce(base::union, list_columns)
  res
}
