
#' Import Various csv Files with Common Columns and Export in One csv file
#' 
#' Import various csv files with common columns and export in one
#' csv file. Csv files are imported with data.table::fread(),
#' row-binded with data.table::rbindlist() and exported with
#' data.table::fwrite().
#' 
#' @docType package
#' @name impexpcsv
#' 
#' @importFrom data.table fread rbindlist fwrite .SD ':='
NULL



# #' @import data.table
# #' @importFrom data.table fread rbindlist fwrite
