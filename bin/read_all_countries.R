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
# function can be improved; no real need for else
# no error checking - it will work correctly only if in all directories
# there are the correct syntax and data files
# otherwise it will break leaving us in the directory where it stopped

sapply(dat.dirs, readEFPTfiles)

# special case with Czech Republic and Slovenia
# it was the first survey and it did not have two fields that others had
# Q_0000 - Country Name
# q_0012_other
Czech_Republic_data["q_0000"] <- as.factor("Czech Republic")
Czech_Republic_data["q_0012_other"] <- as.numeric(NA)
Czech_Republic_data <- Czech_Republic_data[colnames(Bulgaria_data)]
Slovenia_data["q_0000"] <- as.factor("Slovenia")
Slovenia_data["q_0012_other"] <- as.numeric(NA)
Slovenia_data <- Slovenia_data[colnames(Bulgaria_data)]

# RK finish