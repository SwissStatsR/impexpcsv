

# devtools ------------------
library(devtools)

load_all()

document()
check_man()
check()

test()

build()

install(upgrade = "never")

# Examples ------------------
common_columns(csv_files = dir("inst/extdata", full.names = TRUE))
common_columns(csv_files = "inst/extdata/csv01.csv")
common_columns(csv_files = "inst/extdata/csv02.csv")
dir("inst/extdata", full.names = TRUE)
all_columns(csv_files = dir("inst/extdata", full.names = TRUE))

bind_csv_all(
  csv_files = dir("inst/extdata", full.names = TRUE), 
  col_names = NULL, 
  csv_output = "TEMP.csv"
)
data.table::fread("TEMP.csv")
data.table::fread("inst/extdata/csv01.csv")
data.table::fread("inst/extdata/csv02.csv")
file.remove("TEMP.csv")

bind_csv_all(
  csv_files = dir("inst/extdata", full.names = TRUE), 
  col_names = c("z", "x", "y"), 
  csv_output = "TEMP.csv"
)
data.table::fread("TEMP.csv")
data.table::fread("inst/extdata/csv01.csv")
data.table::fread("inst/extdata/csv02.csv")
file.remove("TEMP.csv")

common_columns(csv_files = "inst/extdata/csv02.csv")
import_existing_add_missing(
  csv_file = "inst/extdata/csv02.csv", 
  col_names = c("x", "y", "z", "w")
)

# usethis -------------------
library(usethis)

use_package_doc()

use_testthat()

use_test("import_list_csv")
use_test("bind_csv")
# use_test("common_columns")

# covr ----------------------
library(covr)

p <- package_coverage()
p

report(p, file = "impexpcsv-report.html")


# pkgdown -------------------
library(pkgdown)
build_site()

