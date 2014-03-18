mat<-cbind(rnorm(10, 5, 3), rnorm(10,4,4))

dep<-2*mat[,1]+3*mat[,2]+rnorm(10,15,3)

thing<-comboreg.tval(x=mat, y=dep)

thing
