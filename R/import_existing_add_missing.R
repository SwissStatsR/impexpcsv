

existing_cols <- function(csv_file, col_names, ...) {
  col_names_first <- common_columns(csv_file, ...)
  res <- base::intersect(
    col_names, 
    col_names_first
  )
  res
}

import_existing_add_missing <- function(csv_file, col_names, ...) {
  col_names_first <- common_columns(csv_file, ...)
  existing_cols <- base::intersect(
    col_names, 
    col_names_first
  )
  res <- data.table::fread(csv_file, select = existing_cols, ...)
  
  missing_cols <- base::setdiff(col_names, col_names_first)
  
  if (length(missing_cols) > 0) {
    for (i in seq_along(missing_cols)) {
      res[, (missing_cols[i]) := NA_character_]
    }
  }
  
  res <- res[, .SD, .SDcols = col_names]
  res
}

