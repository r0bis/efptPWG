# RK This script reads all the countries of our data setup
# into equal data frames in the global environment
# full explanation in dir tmp/ under useful snippets

setwd("~/src/efptPWG/bin")
library(stringr)
dat.dirs  <- list.dirs(path="../data/", recursive=T,full.names=F)

readEFPTfiles <- function(f) {
  if (as.character(f)!="") {
    oldwd <- getwd()
    setwd(file.path("..","data",f))
    source(paste(f,"_R_syntax_file.R",sep = ""),local = T)
    toGlEnvFrame <- data[str_detect(colnames(data),"^id$|^q_.*")]
    parentFrame <- paste(f,"_data",sep = "")
    assign(parentFrame,toGlEnvFrame,envir=.GlobalEnv)
    setwd(oldwd)
    }
  else {print("")}
}
# what it does:
# parentFrame - is a string for naming the data frame in the global environment
# toGlEnvFrame - is the read data frame that has only columns detected byt the regexp
# regexp "^id$|^q_.*"  - consists of id OR begins with q_ and ends whatever
#       - we can use this regexp because we know names of our columns
#       - because we know them - there will not be unexpected problems
# function can be improved; no real need for else print
# no error checking - it will work correctly only if in all directories
# there are the correct syntax and data files
# otherwise it will break leaving us in the directory where it stopped

sapply(dat.dirs, readEFPTfiles)

# special case with Czech Republic and Slovenia
# it was the first survey and it did not have two fields that others had
# Q_0000 - Country Name (we also create same number of levels that others have; from "syntax" files)
# q_0012_other
Czech_Republic_data["q_0000"] <- 12
Czech_Republic_data["q_0000"] <- factor(Czech_Republic_data$q_0000, levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50),labels=c("Albania","Andorra","Armenia","Austria","Azerbaijan","Belarus","Belgium","Bosnia and Herzegovina","Bulgaria","Croatia","Cyprus","Czech Republic","Denmark","Estonia","Finland","France ","Georgia","Germany","Greece","Hungary","Iceland","Ireland","Israel","Italy","Kazakhstan","Latvia","Liechtenstein","Lithuania","Luxembourg","Macedonia","Malta","Moldova","Monaco","Montenegro","Netherlands","Norway","Poland","Portugal","Romania","Russia","San Marino","Serbia","Slovakia","Slovenia","Spain","Sweden","Switzerland","Turkey","Ukraine","United Kingdom"))
Czech_Republic_data["q_0012_other"] <- as.numeric(NA)
Czech_Republic_data <- Czech_Republic_data[colnames(Bulgaria_data)]
Slovenia_data["q_0000"] <- 44
Slovenia_data["q_0000"] <- factor(Slovenia_data$q_0000, levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50),labels=c("Albania","Andorra","Armenia","Austria","Azerbaijan","Belarus","Belgium","Bosnia and Herzegovina","Bulgaria","Croatia","Cyprus","Czech Republic","Denmark","Estonia","Finland","France ","Georgia","Germany","Greece","Hungary","Iceland","Ireland","Israel","Italy","Kazakhstan","Latvia","Liechtenstein","Lithuania","Luxembourg","Macedonia","Malta","Moldova","Monaco","Montenegro","Netherlands","Norway","Poland","Portugal","Romania","Russia","San Marino","Serbia","Slovakia","Slovenia","Spain","Sweden","Switzerland","Turkey","Ukraine","United Kingdom"))
Slovenia_data["q_0012_other"] <- as.numeric(NA)
Slovenia_data <- Slovenia_data[colnames(Bulgaria_data)]

# RK finish