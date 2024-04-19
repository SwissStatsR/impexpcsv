test_that("bind_csv works", {
  p <- system.file("extdata", package = "impexpcsv")
  f <- dir(p, full.names = TRUE)
  
  csv_output <- file.path(p, "tmp.csv")
  
  expect_false(file.exists(csv_output))
  
  suppressMessages(
    bind_csv(
      csv_files = f, 
      col_names = NULL, 
      csv_output = csv_output
    )
  )
  
  expect_true(file.exists(csv_output))
  
  d <- fread(csv_output)
  d1 <- fread(f[1])
  d2 <- fread(f[2])
  
  expect_equal((nrow(d1) + nrow(d2)),  nrow(d))
  
  file.remove(csv_output)
  rm(p, f, d, d1, d2)
})
