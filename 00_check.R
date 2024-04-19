

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


# usethis -------------------
library(usethis)

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

