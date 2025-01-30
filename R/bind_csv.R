
#' Create a "row-binded" csv file appending common columns of various csv files
#' 
#' @inheritParams import_list_csv
#' @param csv_output path to the csv file to be created and saved
#' @param sep_output column separator of csv_output (defalut: ";")
#' @param quote see [data.table::fwrite()]. Default: "auto"
#' 
#' @return a NULL value. A summary message is printed on the screen.
#' 
#' @examples 
#' \dontrun{
#' csv_files <- c(
#'   system.file("extdata", "csv01.csv", package = "impexpcsv"),
#'   system.file("extdata", "csv02.csv", package = "impexpcsv")  
#' )
#' 
#' bind_csv(csv_files, csv_output = "big_csv.csv")
#' bind_csv(csv_files, col_names = "x", csv_output = "big_csv.csv")
#' bind_csv(csv_files, col_names = c("z", "x"), csv_output = "big_csv.csv")
#' }
#' 
#' @export
bind_csv <- function(csv_files, 
                     col_names = NULL, 
                     csv_output, 
                     sep_output = ";",
                     quote = "auto",
                     ...){
  stopifnot(is.character(csv_files))
  if(is.null(col_names)) col_names <- common_columns(csv_files, ...)
  
  stopifnot(is.character(col_names))
  
  # Import col_names of the first csv file and export to csv_output
  tmp <- data.table::fread(csv_files[1], select = col_names, ...)
  data.table::fwrite(
    tmp, 
    file = csv_output, 
    sep = sep_output, 
    append = FALSE,
    quote = quote
  )
  
  # If there is more than one csv file, import one at a time and append to 
  # csv_output
  if(length(csv_files) > 1L){
    for(i in 2:length(csv_files)){
      tmp <- data.table::fread(csv_files[i], select = col_names, ...)
      data.table::fwrite(
        tmp, 
        file = csv_output, 
        sep = sep_output, 
        append = TRUE,
        quote = quote
      )
    }
  }
  
  msg <- c(
    paste0("File ", csv_output, " has been created\n"), 
    paste0("Importing columns: ", paste(col_names, collapse = ", "), "\n"), 
    paste0("from these files: ", paste(csv_files, collapse = ", "))
  )
  message(msg)
}


