mat<-cbind(rnorm(10, 5, 3), rnorm(10,4,4), rnorm(10,8,15), rpois(10, 18))

dep<-2*mat[,1]+3*mat[,2]+ 5*mat[,4]+rnorm(10,15,3)

thing<-comboreg(x=mat, y=dep)

thing

plot(thing)
