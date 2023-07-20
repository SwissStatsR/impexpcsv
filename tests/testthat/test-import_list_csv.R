test_that("import_list_csv works", {
  p <- system.file("extdata", package = "impexpcsv")
  f <- dir(p, full.names = TRUE)
  
  d1 <- fread(f[1])
  d2 <- fread(f[2])
  
  d <- import_list_csv(f)
  
  expect_s3_class(d, "data.table")
  expect_true((nrow(d1) + nrow(d2)) == nrow(d))
})
