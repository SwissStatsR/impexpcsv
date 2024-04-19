


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
                         ...) {
  stopifnot(is.character(csv_files))
  if (is.null(col_names)) col_names <- all_columns(csv_files, ...)
  
  stopifnot(is.character(col_names))
  
  # Import the first csv file, add missing columns and export to csv_output
  col_names_first <- common_columns(csv_files[1], ...)
  existing_cols <- base::intersect(
    col_names, 
    col_names_first
  )
  tmp <- data.table::fread(csv_files[1], select = existing_cols, ...)
  
  missing_cols <- base::setdiff(col_names, col_names_first)
  
  if (length(missing_cols) > 0) {
    for (i in seq_along(missing_cols)) {
      tmp[, (missing_cols[i]) := NA_character_]
    }
  }
  
  tmp <- tmp[, .SD, .SDcols = col_names]
  
  data.table::fwrite(tmp, file = csv_output, sep = sep_output, append = FALSE)
  
  # If there is more than one csv file, import one at a time and append to 
  # csv_output
  if (length(csv_files) > 1L) {
    for (i in 2:length(csv_files)) {
      col_names_first <- common_columns(csv_files[i], ...)
      existing_cols <- base::intersect(
        col_names, 
        col_names_first
      )
      tmp <- data.table::fread(csv_files[i], select = existing_cols, ...)

      missing_cols <- base::setdiff(col_names, col_names_first)
      
      if (length(missing_cols) > 0) {
        for (j in seq_along(missing_cols)) {
          tmp[, (missing_cols[j]) := NA_character_]
        }
      }
      
      tmp <- tmp[, .SD, .SDcols = col_names]
      
      data.table::fwrite(tmp, file = csv_output, sep = sep_output, append = TRUE)
    }
  }
  
  msg <- c(
    paste0("File ", csv_output, " has been created\n"), 
    paste0("Importing columns: ", paste(col_names, collapse = ", "), "\n"), 
    paste0("from these files: ", paste(csv_files, collapse = ", "))
  )
  message(msg)
}

