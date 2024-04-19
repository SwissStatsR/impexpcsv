test_that("import_list_csv works", {
  p <- system.file("extdata", package = "impexpcsv")
  f <- dir(p, full.names = TRUE)
  
  d1 <- fread(f[1])
  d2 <- fread(f[2])
  
  d <- import_list_csv(csv_files = f)
  
  expect_s3_class(d, "data.table")
  expect_equal((nrow(d1) + nrow(d2)), nrow(d))
  
  rm(p, d, f, d1, d2)
})
