str(iris)
head(iris)
tail(iris)
iris[c(1:3,148:150),3:5]
iris$Sepal.Length
iris$Species
data()
table(iris$Species)

library(lattice)
histogram(iris$Sepal.Length)



































# Multidimensional Conditional Distributions - Seminar Classwork Example
# 1 Joint distribution
# 2 Marginal distributions
# 3 Conditional distributions
# 4 Simulation

library(faraway)
data(femsmoke)
femsmoke


N<-sum(femsmoke[,1])
ctable.dead<-xtabs(y~smoker+age,subset(femsmoke,dead=="yes"))/N
ctable.alive<-xtabs(y~smoker+age,subset(femsmoke,dead=="no"))/N
rownames(ctable.dead)<-rownames(ctable.alive)<-c("smoke.yes","smoke.no")
colnames(ctable.dead)<-colnames(ctable.alive)<-paste("age",1:7,sep=".")


femsmoke.joint.p<-array(rep(NA,28),dim=c(2,7,2),
                        dimnames=list(c("smoke.yes","smoke.no"),
                                      paste("age",1:7,sep="."),
                                      c("dead.yes","dead.no")))
femsmoke.joint.p[,,1]<-ctable.dead
femsmoke.joint.p[,,2]<-ctable.alive


femsmoke.joint.p

sum(femsmoke.joint.p)

uMarginal.dead<-c(uAlive=sum(femsmoke.joint.p[,,"dead.no"]),
                  uDead=sum(femsmoke.joint.p[,,"dead.yes"]))
uMarginal.dead

sum(uMarginal.dead)

vMarginal.smoke<-apply(femsmoke.joint.p,1,sum)

vMarginal.smoke
sum(vMarginal.smoke)
wMarginal.age<-apply(femsmoke.joint.p,2,sum)

wMarginal.age

sum(wMarginal.age)?
  
  cond.v.w.given.uAlive<-femsmoke.joint.p[,,"dead.no"]/uMarginal.dead["uAlive"]

cond.v.w.given.uAlive

sum(cond.v.w.given.uAlive)

cond.v.given.uAlive<-apply(femsmoke.joint.p[,,"dead.no"],1,sum)/
  uMarginal.dead["uAlive"]
cond.v.given.uAlive
sum(cond.v.given.uAlive)

cond.w.given.uAlive.vSmoke<-femsmoke.joint.p["smoke.yes",,"dead.no"]/
  cond.v.given.uAlive["smoke.yes"]/uMarginal.dead["uAlive"]
cond.w.given.uAlive.vSmoke

sum(cond.w.given.uAlive.vSmoke)

rbind(uMarginal.dead["uAlive"]*cond.v.given.uAlive["smoke.yes"]*
        cond.w.given.uAlive.vSmoke,
      femsmoke.joint.p["smoke.yes",,"dead.no"])
