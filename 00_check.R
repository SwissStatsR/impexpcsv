

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

