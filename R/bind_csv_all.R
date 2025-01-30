


#' Create a "row-binded" csv file appending all columns of various csv files
#' 
#' 
#' @inheritParams bind_csv
#' 
#' 
#' 
#' @export
bind_csv_all <- function(csv_files, 
                         col_names = NULL, 
                         csv_output, 
                         sep_output = ";",
                         quote = "auto",
                         ...) {
  stopifnot(is.character(csv_files))
  if (is.null(col_names)) col_names <- all_columns(csv_files, ...)
  
  stopifnot(is.character(col_names))
  
  # Import the first csv file, add missing columns and export to csv_output
  tmp <- import_existing_add_missing(csv_files[1], col_names, ...)
  
  data.table::fwrite(
    tmp, 
    file = csv_output, 
    sep = sep_output, 
    append = FALSE,
    quote = quote
  )
  
  # If there is more than one csv file, import one at a time and append to 
  # csv_output
  if (length(csv_files) > 1L) {
    for (i in 2:length(csv_files)) {
      tmp <- import_existing_add_missing(csv_files[i], col_names, ...)
      
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

