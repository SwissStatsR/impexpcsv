test_that("bind_csv_all works", {
  p <- system.file("extdata", package = "impexpcsv")
  f <- dir(p, full.names = TRUE)
  
  csv_output <- file.path(p, "tmp.csv")
  
  expect_false(file.exists(csv_output))
  
  suppressMessages(
    bind_csv_all(
      csv_files = f, 
      col_names = NULL, 
      csv_output = csv_output
    )
  )
  
  expect_true(file.exists(csv_output))
  
  file.remove(csv_output)
  rm(p, f)
})
