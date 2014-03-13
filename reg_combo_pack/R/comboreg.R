vec<-c(1:10)
#install.packages('HapEstXXR') ##Run code if you do not have this package
library(HapEstXXR)

powerset(vec)

x1<-rnorm(5)
x2<-rnorm(5,3,15)
y<-(x1+2*x2)+rnorm(5,4,100)

lm(y~x1+x2)
