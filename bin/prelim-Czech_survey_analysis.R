# getwd() 
# - the above just tells us which the current directory is
# here we tell R where we want it to work from:
setwd("~/src/efptPWG/data/Czech_Republic")
# This next line is not needed - the source command will overwrite 'data' anyway
# data <- read.csv2("Czech_Republic_R_data_file.csv", sep=",", quote = "'", na.strings=c("","\"\""), stringsAsFactors=FALSE)

source("Czech_Republic_R_syntax_file.R")
# this line means R will execute all commands in the syntax file
# its first line says data <- read.table("Czech_Republ.... blah blah
# so data is written by sourcing the command/syntax file (which is just an R script)

str(data)

# install.packages(c("lattice", "ggplot2"))
# I will later also use likert package - it is very handy
install.packages("likert")
library (lattice)
library(ggplot2)
library(knitr)
library(likert)
search()


## Plot: Gender
table(data$q_0001)
pie(table(data$q_0001))

#Age
summary(data$q_0002)
## Plot: Age
hist(data$q_0002, col="light yellow",
     xlab="Age", 
     ylab="Number",
     main="Age distribution",
     breaks=c(seq(20,60,2)))


#RK
# table(data$q_0003)
# this command really is for interactive use

# as two column values are VERY long we abbreviate them to RF and Year 8+
levels(data$q_0003) <- c(levels(data$q_0003),"Year 8+", "RF")
data$q_0003[data$q_0003=="More than 8 years in training"]<- "Year 8+"
data$q_0003[data$q_0003=="I have recently finished training (within last 5 years)"]<- "RF"
data$q_0003 <- droplevels(data$q_0003)
## Plot: Year in Training (now the shorter labels fit in the plot)
barplot(table(data$q_0003), ylim = c(0,15), xlab="Year of training",las=1, col="cornflowerblue", border=NA)


#Are you receiving personal psychotherapy or have you received it in the past?
data[, 7] <- as.numeric(data[, 7])
attributes(data)$variable.labels[7] <- "Are you receiving personal psychotherapy or have you received it in the past?"
data[, 7] <- factor(data[, 7], levels=c(1,2),labels=c("Yes","No"))
names(data)[7] <- "q_0004"
# table(data$q_0004)
## Plot: Receiving personal psychotehrapy
pie(table(data$q_0004), xlab="Are you receiving personal psychotherapy or have you received it in the past?")

#I am undertaking training in Psychotherapy within my training programme in Psychiatry
# table(data$q_0005_S05A1)
## Plot: Undertaking Psychotherapy training within my training programme 
pie(table(data$q_0005_S05A1), xlab="I am undertaking training in Psychotherapy within my training programme in Psychiatry")

# table(data$q_0005_S05A2)
## Plot: I am undertaking training in Psychotherapy on my own initiative
pie(table(data$q_0005_S05A2), xlab="I am undertaking training in Psychotherapy on my own initiative (outside my training programme in Psychiatry)")

# table(data$q_0005_S05A3)
pie(table(data$q_0005_S05A3), xlab="I am not undertaking any training in Psychotherapy")

#q0005 : To be merged in a barplot? To improve
## Yes, perhaps we want to show what proportion of people are training
# how many are not training
# how many have completed training
# effectively we could show this as a Venn diagram, I guess - to show overlaps
# we may need to think a bit about that - how to achieve the most effective visualization
# that captures the state of individuals and shows proportions
# I think this is a question where we did not think that categories will be overlapping

#I have completed full training in a Psychotherapy specialty in the past
table(data$q_0005_S05A4)
pie(table(data$q_0005_S05A4), xlab="I have completed full training in a Psychotherapy specialty in the past")


# data$q_0005_other: "[Other] Are you training in Psychotherapy?"
table(is.na(data$q_0005_other))
# so two people have answered something to this


# table(data$q_0006)
# or we can determine how many are empty and how many have some responses
# table(is.na(data$q_0006))
# gives
# FALSE  TRUE 
# 36    22 
# so we know 36 are blanks and 22  people have answered something
## Plot: I am training in some modality
pie(table(is.na(data$q_0006)),xlab="I am training in some modality of psychotherapy")

# Plot: Is psychotherapy important for your identity as a psychiatrist
pie(table(data$q_0007), xlab="Is Psychotherapy important for your professional identity as a Psychiatrist?")

# Plot: Do you want to practise Psychotherapy
pie(table(data$q_0008), xlab="Do you want to practise Psychotherapy after your training in Psychiatry?")


#RK same logic for presentation as for question q_0005
# we need to do a bit better
# I will try to show comparative Yes answers
## Plot: Types of therapy I am interested in
barplot(c(sum(q9df[,1]=="Yes"), sum(q9df[,2]=="Yes"), sum(q9df[,3]=="Yes"), sum(q9df[,4]=="Yes"),
          sum(q9df[,5]=="Yes"), sum(!is.na(q9df[,6]))), 
        names.arg=c("Dynamic","CBT","Systemic","Group","NOT ANY","Other"),xlab="Interested in this therapy")
# this might do for now, so canning (sommenting out) the rest for now for q_0009
# barplot(table(data$q_0009_SQ1), xlab="Interested in Psychoanalytic Psychotherapy")
# barplot(table(data$q_0009_SQ2), xlab="Interested in Cognitive Behavioural Psychotherapy")
# barplot(table(data$q_0009_SQ3), xlab="Interested in Family / Systemic Therapy Psychotherapy")
# barplot(table(data$q_0009_SQ4), xlab="Interested in Group modalities of therapies")
# barplot(table(data$q_0009_Ax), xlab="I am not interested in Psychotherapy")
# table (data$q_0009_other)

## Here we have the problem of displaying textual responses in a nice format
# "Your comments about your preferences with regard to Psychotherapy:"
# "q_0010"
# table(data$q_0010)

# table(data$q_0011_SQ001)
barplot(table(data$q_0011_SQ001), xlab="[Theoretical lectures or seminars in Psychotherapy] The following experience in Psychotherapy is a mandatory part of my training in Psychiatry:")

# table(data$q_0011_SQ002)
barplot(table(data$q_0011_SQ001), col="blue", xlab="[Conducting Psychotherapy without supervision with a patient or group] The following experience in Psychotherapy is a mandatory part of my training in Psychiatry:")

# table(data$q_0011_SQ003)
barplot(table(data$q_0011_SQ003), col="yellow", xlab="[Conducting Psychotherapy under supervision with a patient or group] The following experience in Psychotherapy is a mandatory part of my training in Psychiatry:")

# table(data$q_0011_SQ004)
barplot(table(data$q_0011_SQ004), col="orange", xlab="[Personal Psychotherapy] The following experience in Psychotherapy is a mandatory part of my training in Psychiatry:")

#table(data$q_0012)
barplot(table(data$q_0012), col="green", xlab="Are you qualified to practice Psychotherapy after you finish your training in Psychiatry?")

## again problem of displaying text nicely
# this time the question is about 
# What types of psychoteherapy modalities are available for treatment of patients at your institution?
table(data$q_0013)

## Plot: How many hours of supervisions
# this is a group of plots, we could actually put them all on one page, or half a page
hist(data$q_0014_SQ001, col="pink", 
     xlab=" How many hours of supervision do you have for your Psychotherapy training per month?", 
     main = "Individual supervision")

## Plot
hist(data$q_0014_SQ002, col="red",  
     main="Small group supervision (3 - 5 people)",
     xlab="How many hours of supervision do you have for your Psychotherapy training per month?")
#to merge ??
#plot(density(data$q_0014_SQ002))
## RK we could merge this, but what would be the purpose? Define merge?

## Plot
hist(data$q_0014_SQ003, 
     main="Large group supervision (more than 5 people)",
     xlab="How many hours of supervision do you have for your Psychotherapy training per month?")

## Plot
hist(data$q_0014_SQ001, col="green", 
     xlab= "How many hours of supervision do you have for your Psychotherapy training per month?", 
     main ="Generic Balint group ")

## Plot
hist(data$q_0014_SQ005, col="navy", 
     xlab= "How many hours of supervision do you have for your Psychotherapy training per month?", 
     main ="Other form of supervision ")


# this is again how to display text, we think about it in round 2
table(data$q_0015)

## Plot: Who pays
# this again should ba a plot group on one page
barplot(table(data$q_0016_SQ001), col="light blue", 
        main="Theorectical lectures / seminars",
        xlab="Who pays for this component of Psychotherapy experience?")

## Plot
barplot(table(data$q_0016_SQ002), col="light blue",
        xlab="Who pays for this component of Psychotherapy experience?",
        main="Supervision - individual")

## Plot
barplot(table(data$q_0016_SQ003), col="light blue",
        main="Supervision - group ",
        xlab="Who pays for this component of Psychotherapy experience?")

## Plot
barplot(table(data$q_0016_SQ004), col="light blue",
        main="Balint groups ",
        xlab="Who pays for this component of Psychotherapy experience?")

## Plot
barplot(table(data$q_0016_SQ004), col="light blue",
        main="Sessions with patient(s)",
        xlab="Who pays for the following components of Psychotherapy experience?")

## Plot
barplot(table(data$q_0016_SQ004), col="light blue",
        main="Self-experience *", 
        xlab="Who pays for the following components of Psychotherapy experience?")

## Plot: Would you train for FREE
pie(table(data$q_0017), 
    main="Would you be motivated to train in Psychotherapy for free?",
    xlab="Would you be motivated to undertake training in Psychotherapy, if financing is not an issue?")

## Plot: How much would you invest in psychotherapy training
hist(data$q_0018, col="light green",
     main="% of annual salary you invest in psychotherapy training",
     xlab="What percentage of your annual salary do you intend to spend \n on funding your psychotherapy training In the next 12 months?",
     breaks=c(seq(0,100,2)))

## Plot: Satisfaction group
# perhaps we should use likert package to plot likert type items
install.packages("likert")
# make auxiliary table to hold our likert data
sat1<-data[,43:45]
# put in correct row names
sat1 <- rename(sat1,c("q_0019_SQ001"="I am satisfied with psychotherapy component in my training programme",
  "q_0019_SQ002"="I am satisfied with psychotherapy training options in my country",
  "q_0019_SQ003"="I am satisfied with the level of funding for psychotherapy training within psychiatry in my country"
  ))
sat12<-likert(sat1)
plot(sat12)

# comment out barplots for now
# barplot(table(data$q_0019_SQ001), main ="I am satisfied with Psychotherapy component in my training programme")

# well, let's deal with UEMS bits as with likert scales
uems1 <- data[,46:54]
uems1[,1] <- factor(uems1[,1],c("No","Uncertain","Yes"))
uems1[,2] <- factor(uems1[,2],c("No","Uncertain","Yes"))
uems1[,3] <- factor(uems1[,3],c("No","Uncertain","Yes"))
uems1[,4] <- factor(uems1[,4],c("No","Uncertain","Yes"))
uems1[,5] <- factor(uems1[,5],c("No","Uncertain","Yes"))
uems1[,6] <- factor(uems1[,6],c("No","Uncertain","Yes"))
uems1[,7] <- factor(uems1[,7],c("No","Uncertain","Yes"))
uems1[,8] <- factor(uems1[,8],c("No","Uncertain","Yes"))
uems1[,9] <- factor(uems1[,9],c("No","Uncertain","Yes"))
# Put nice column names for the plot
uems1 <- rename(uems1,c(
  q_0021_SQ001="Psychotherapy is a mandatory part of the curriculum",
  q_0021_SQ002="Defined number of cases should be seen",
  q_0021_SQ003="at least 120 hours of theory",
  q_0021_SQ004="Work experience with individuals, family, groups",
  q_0021_SQ005="Psychodynamic, CBT, systemic - and maybe integrative",
  q_0021_SQ006="Personal therapy is recommended",
  q_0021_SQ007="Supervisors should be qualified",
  q_0021_SQ008="Regular supervision at least for 100 hours",
  q_0021_SQ009="Training should be publicly funded"
  ))
## Plot: UEMS recs awareness
uems12 <- likert(uems1)
plot(uems12) +
  ggtitle("Awareness of UEMS recommendations") + 
  theme(plot.title = element_text(lineheight=.8, face="bold"))

# and same with the 
uems2 <- data[,55:63]
uems2[,1] <- factor(uems2[,1],c("No","Uncertain","Yes"))
uems2[,2] <- factor(uems2[,2],c("No","Uncertain","Yes"))
uems2[,3] <- factor(uems2[,3],c("No","Uncertain","Yes"))
uems2[,4] <- factor(uems2[,4],c("No","Uncertain","Yes"))
uems2[,5] <- factor(uems2[,5],c("No","Uncertain","Yes"))
uems2[,6] <- factor(uems2[,6],c("No","Uncertain","Yes"))
uems2[,7] <- factor(uems2[,7],c("No","Uncertain","Yes"))
uems2[,8] <- factor(uems2[,8],c("No","Uncertain","Yes"))
uems2[,9] <- factor(uems2[,9],c("No","Uncertain","Yes"))
# Put nice column names for the plot
uems2 <- rename(uems2,c(
  q_0022_SQ001="Psychotherapy is a mandatory part of the curriculum",
  q_0022_SQ002="Defined number of cases should be seen",
  q_0022_SQ003="at least 120 hours of theory",
  q_0022_SQ004="Work experience with individuals, family, groups",
  q_0022_SQ005="Psychodynamic, CBT, systemic - and maybe integrative",
  q_0022_SQ006="Personal therapy is recommended",
  q_0022_SQ007="Supervisors should be qualified",
  q_0022_SQ008="Regular supervision at least for 100 hours",
  q_0022_SQ009="Training should be publicly funded"
))
## Plot: UEMS recs awareness
uems22 <- likert(uems2)
plot(uems22) + 
  ggtitle("Actual implementation in the country") + 
  theme(plot.title = element_text(lineheight=.8, face="bold"))
