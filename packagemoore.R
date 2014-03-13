library(devtools)
find_rtools() ##For using devtools with windows. 
setwd("~/GitHub/RPackageProblemSet")
create(path="./reg_combo_pack", check=FALSE)

current.code <- as.package("reg_combo_pack")
load_all(current.code)
document(current.code)
