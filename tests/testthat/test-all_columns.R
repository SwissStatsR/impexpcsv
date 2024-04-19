test_that("all_columns works", {
  p <- system.file("extdata", package = "impexpcsv")
  f <- dir(p, full.names = TRUE)
  
  a <- all_columns(csv_files = f)
  a1 <- common_columns(csv_files = f[1])
  a2 <- common_columns(csv_files = f[2])
  a3 <- unique(c(a1, a2))
  
  expect_equal(a, a3)
  
  rm(p, f, a, a1, a2, a3)
})
