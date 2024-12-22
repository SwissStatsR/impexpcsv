

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
use_test("all_columns")
use_test("bind_csv_all")
# use_test("common_columns")

use_github_action(name = "check-standard")

# covr ----------------------
library(covr)

p <- package_coverage()
p

report(p, file = "impexpcsv-report.html")


# pkgdown -------------------
pkgdown::build_site()


# git push both on gitlab and github ------------
# From the terminal:
# git remote add github https://github.com/SwissStatsR/impexpcsv.git
# git remote add github git@github.com:SwissStatsR/impexpcsv.git
# git remote -v
# origin is gitlab, github is github

# To push on both remote repositories:
# git push -u origin master    # push on gitlab
# git push -u github master    # push on github
