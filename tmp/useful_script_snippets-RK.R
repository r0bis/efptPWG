
# Ways of listing files and directories (attention to full.names=FALSE)
dat.files  <- list.files(path="..", recursive=F, pattern=".*syntax_file.R$",full.names=F)
dat.dirs  <- list.dirs(path="../data/", recursive=T,full.names=F)
# sorting the directory names AND getting rid of the empty current directory value 
sort(dat.dirs[dat.dirs!=""])

library(stringr) # will be needed for easy string matching 
# generic form of comparing vectors of column names
# so we know exactly which columns are missing in narrower data frames
# experiemnts on manually read in data frames
missingNames <- setdiff(rightNames,colnames(data))
rightNames <- colnames(d2)
setdiff(rightNames,colnames(czData))
setdiff(colnames(boData),rightNames)

# this is how we say we will only take columns: "id" and "beginning with "q_"
d2 <- data[str_detect(colnames(data),"^id$|^q_.*")]

# if we might need to trim strings. In fact we don't it is better to say sep=""
trim <- function (x) gsub("^\\s+|\\s+$", "", x)
trim.leading <- function (x)  sub("^\\s+", "", x)
trim.trailing <- function (x) sub("\\s+$", "", x)--set-upstream origin origin/master

# example of constructing valid file name
file.path("..",f,paste(f,"_syntax_file.R",sep=""))

# now put together a function
# it will return to current directory
# it will read data within the function
# and push the data frame to parent (Global) environment
setwd("~/src/efptPWG/bin")
getwd()
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
# can still be improved; no real need for else
# no error checking - it will work correctly only if in all directories
# there are the correct syntax and data files
# otherwise it will break leaving us in the directory where it stopped
# this was the case with Sweden and I had to put dummy data in
# maybe it is better for now to move Sweden data directory to a
 # temporary place - once we get data we can simply put the directory
# back and it will be processed correctly
# this is the beauty of not changing source data and RR

# now we make use of the function
sapply(dat.dirs, readEFPTfiles)

# special case with Czech Republic and Slovenia
# it was the first survey and it did not have two fields that others had
# Q_0000 - Country Name
# q_0012_other
# so we will add with country names and empty q_0012
# we could read correct column names in a vector
correctColumns <- colnames(Bulgaria_data)
# but we really don't need that as we see later
incorrectColumns <- colnames(Czech_Republic_data)
setdiff(correctColumns,incorrectColumns)

# now let's do the bloody work
# add columns
Czech_Republic_data["q_0000"] <- as.factor("Czech Republic")
Czech_Republic_data["q_0012_other"] <- as.numeric(NA)
# order columns correctly
Czech_Republic_data <- Czech_Republic_data[colnames(Bulgaria_data)]
Slovenia_data["q_0000"] <- as.factor("Slovenia")
Slovenia_data["q_0012_other"] <- as.numeric(NA)
Slovenia_data <- Slovenia_data[colnames(Bulgaria_data)]

# now all the country data are read in and the data frames are of same dimensions

# to delete everything from the environment to finally check if our code works
rm(list=ls(all=TRUE))

# bind all existing data frames together. First put all data frames in a list.
# Then bind them into one data frame
# I got this from stackexchange
listof.df <- lapply(ls(), function(x) if (class(get(x)) == "data.frame") get(x))
data_Europe <- do.call("rbind", listof.df)


# PIE charts in ggplot
# http://mathematicalcoffee.blogspot.co.uk/2014/06/ggpie-pie-graphs-in-ggplot2.html
library(ggplot2)
install.packages("RColorBrewer")
library(RColorBrewer)
# ggpie: draws a pie chart.
# give it:
# * `dat`: your dataframe
# * `by` {character}: the name of the fill column (factor)
# * `totals` {character}: the name of the column that tracks
#    the time spent per level of `by` (percentages work too).
# returns: a plot object.
ggpie <- function (dat, by, totals, plotTitle) {
  ggplot(dat, aes_string(x=factor(1), y=totals, fill=by)) +
    geom_bar(stat='identity', color='black', width=1) +
    guides(fill=guide_legend(override.aes=list(colour=NA))) + # removes black borders from legend
    coord_polar(theta='y') +
    ggtitle(plotTitle) +
    theme(axis.ticks=element_blank(),
          axis.text.y=element_blank(),
          axis.text.x=element_text(colour='black'),
          axis.title=element_blank()) +
    scale_y_continuous(breaks=cumsum(dat[[totals]]) - dat[[totals]] / 2, labels=dat[[by]])    
}

# use the function such as:
gp <- ggpie(df,'Sex','Number',"Distribution by Sex")
gp +  scale_fill_brewer(palette="YlGn")
gp
