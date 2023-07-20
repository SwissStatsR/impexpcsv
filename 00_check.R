

# devtools ------------------
library(devtools)

load_all()

document()
check_man()
check()

test()

build()

install(upgrade = "never")


# usethis -------------------
library(usethis)

use_testthat()

use_test("import_list_csv")
use_test("bind_csv")

# covr ----------------------
library(covr)

p <- package_coverage()
p

report(p, file = "impexpcsv-report.html")


# pkgdown -------------------
library(pkgdown)
build_site()

