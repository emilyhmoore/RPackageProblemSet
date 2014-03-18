library(devtools)
library(roxygen2)
find_rtools() ##For using devtools with windows. 
setwd("~/GitHub/RPackageProblemSet")
create(path="./reg_combo_pack", check=FALSE)

current.code <- as.package("reg_combo_pack")
load_all(current.code)
document(current.code)

check(current.code)

install(pkg=current.code, local=TRUE)

##Example data
mat<-cbind(rnorm(100, 5, 3), rnorm(100,4,4), rnorm(100,8,15), rpois(100, 18))
dep<-2*mat[,1]+3*mat[,2]+ 5*mat[,4]+rnorm(100,15,3)
data<-cbind(mat, dep)
colnames(data)<-c("Var 1", "Var 2", "var 3", "Var 4", "Dependent_Variable")
save(data,file="./reg_combo_pack/data/exampleData.rda")

help(comboreg)
help(comboreg.tval)
demo(comboreg)
demo(comboreg.tval)
data(exampleData)

