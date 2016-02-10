# getwd()
setwd("~/src/efptPWG/data/Czech_Republic")
# This is not needed - the source command will overwrite 'data'
# data <- read.csv2("Czech_Republic_R_data_file.csv", sep=",", quote = "'", na.strings=c("","\"\""), stringsAsFactors=FALSE)

source("Czech_survey_69811_R_syntax_file.R")

str(data)

# install.packages(c("lattice", "ggplot2"))
library (lattice)
library(ggplot2)
library(knitr)
search()

#Subjects ID
data[, 1] <- as.numeric(data[, 1])
attributes(data)$variable.labels[1] <- "id"
names(data)[1] <- "id"

#Submitdate
data[, 2] <- as.character(data[, 2])
attributes(data)$variable.labels[2] <- "submitdate"
names(data)[2] <- "submitdate"

#Field hidden
data[, 3] <- as.character(data[, 3])
attributes(data)$variable.labels[3] <- "startlanguage"
names(data)[3] <- "startlanguage"

#Gender
data[, 4] <- as.numeric(data[, 4])
attributes(data)$variable.labels[4] <- "Gender"
data[, 4] <- factor(data[, 4], levels=c(1,2),labels=c("Female","Male"))
names(data)[4] <- "q_0001"

table(data$q_0001)
pie(table(data$q_0001))

#Age
data[, 5] <- as.numeric(data[, 5])
attributes(data)$variable.labels[5] <- "Age"
names(data)[5] <- "q_0002"

summary(data$q_0002)
hist(data$q_0002, xlab="Age", ylab="Number")

data[, 6] <- as.character(data[, 6])
attributes(data)$variable.labels[6] <- "Year of training"
data[, 6] <- factor(data[, 6], levels=c("S04A1","S04A2","S04A3","S04A4","S04A5","S04A6","S04A7","S04A8","S04A9","S0410"),labels=c("Year 1","Year 2","Year 3","Year 4","Year 5","Year 6","Year 7","Year 8",">8","Finished (<5 y)"))
names(data)[6] <- "q_0003"

table(data$q_0003)
barplot(table(data$q_0003), ylim = c(0,15), xlab="Year of training",las=1, col="cornflowerblue", border=NA)

#Are you receiving personal psychotherapy or have you received it in the past?
data[, 7] <- as.numeric(data[, 7])
attributes(data)$variable.labels[7] <- "Are you receiving personal psychotherapy or have you received it in the past?"
data[, 7] <- factor(data[, 7], levels=c(1,2),labels=c("Yes","No"))
names(data)[7] <- "q_0004"

table(data$q_0004)
pie(table(data$q_0004), xlab="Are you receiving personal psychotherapy or have you received it in the past?")

#I am undertaking training in Psychotherapy within my training programme in Psychiatry
data[, 8] <- as.numeric(data[, 8])
attributes(data)$variable.labels[8] <- "[I am undertaking training in Psychotherapy within my training programme in Psychiatry] Are you training in Psychotherapy?"
data[, 8] <- factor(data[, 8], levels=c(1,0),labels=c("Yes","No"))
names(data)[8] <- "q_0005_S05A1"

table(data$q_0005_S05A1)
pie(table(data$q_0005_S05A1), xlab="I am undertaking training in Psychotherapy within my training programme in Psychiatry")

data[, 9] <- as.numeric(data[, 9])
attributes(data)$variable.labels[9] <- "[I am undertaking training in Psychotherapy on my own initiative (outside my training programme in Psychiatry)] Are you training in Psychotherapy?"
data[, 9] <- factor(data[, 9], levels=c(1,0),labels=c("Yes","No"))
names(data)[9] <- "q_0005_S05A2"

table(data$q_0005_S05A2)
pie(table(data$q_0005_S05A2), xlab="I am undertaking training in Psychotherapy on my own initiative (outside my training programme in Psychiatry)")

data[, 10] <- as.numeric(data[, 10])
attributes(data)$variable.labels[10] <- "[I am not undertaking any training in Psychotherapy] Are you training in Psychotherapy?"
data[, 10] <- factor(data[, 10], levels=c(1,0),labels=c("Yes","No"))
names(data)[10] <- "q_0005_S05A3"

table(data$q_0005_S05A3)
pie(table(data$q_0005_S05A3), xlab="I am not undertaking any training in Psychotherapy")

#q0005 : To be merged in a barplot? To improve
#table(data$q_0005_S05A2)
#x <-c(table(data$q_0005_S05A1), 0, table(data$q_0005_S05A2), 0, table(data$q_0005_S05A3))
#barplot(x)

#I have completed full training in a Psychotherapy specialty in the past
data[, 11] <- as.numeric(data[, 11])
attributes(data)$variable.labels[11] <- "[I have completed full training in a Psychotherapy specialty in the past] Are you training in Psychotherapy?"
data[, 11] <- factor(data[, 11], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[11] <- "q_0005_S05A4"

table(data$q_0005_S05A4)
pie(table(data$q_0005_S05A4), xlab="I have completed full training in a Psychotherapy specialty in the past")

data[, 12] <- as.character(data[, 12])
attributes(data)$variable.labels[12] <- "[Other] Are you training in Psychotherapy?"
names(data)[12] <- "q_0005_other"

data$q_0005_other

data[, 13] <- as.character(data[, 13])
attributes(data)$variable.labels[13] <- "You have indicated in answering the previous question that you are training to be a psychotherapist, or have already completed a full training in at least one psychotherapeutic modality. Would you please write in the box below, what modality you have trained in or are training now."
names(data)[13] <- "q_0006"

table(data$q_0006)

data[, 14] <- as.numeric(data[, 14])
attributes(data)$variable.labels[14] <- "Is Psychotherapy important for your professional identity as a Psychiatrist?"
data[, 14] <- factor(data[, 14], levels=c(1,2),labels=c("Yes","No"))
names(data)[14] <- "q_0007"

pie(table(data$q_0007), xlab="Is Psychotherapy important for your professional identity as a Psychiatrist?")

data[, 15] <- as.numeric(data[, 15])
attributes(data)$variable.labels[15] <- "Do you want to practise Psychotherapy after your training in Psychiatry?"
data[, 15] <- factor(data[, 15], levels=c(1,2),labels=c("Yes","No"))
names(data)[15] <- "q_0008"

pie(table(data$q_0008), xlab="Do you want to practise Psychotherapy after your training in Psychiatry?")

data[, 16] <- as.numeric(data[, 16])
attributes(data)$variable.labels[16] <- "[Psychodynamic (Psychoanalytic) Psychotherapy] What types of Psychotherapy are you interested in?"
data[, 16] <- factor(data[, 16], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[16] <- "q_0009_SQ1"

barplot(table(data$q_0009_SQ1), xlab="Interested in Psychoanalytic Psychotherapy")

data[, 17] <- as.numeric(data[, 17])
attributes(data)$variable.labels[17] <- "[Cognitive Behavioural Psychotherapy] What types of Psychotherapy are you interested in?"
data[, 17] <- factor(data[, 17], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[17] <- "q_0009_SQ2"

table(data$q_0009_SQ2)
barplot(table(data$q_0009_SQ2), xlab="Interested in Cognitive Behavioural Psychotherapy")

data[, 18] <- as.numeric(data[, 18])
attributes(data)$variable.labels[18] <- "[Family / Systemic Therapy] What types of Psychotherapy are you interested in?"
data[, 18] <- factor(data[, 18], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[18] <- "q_0009_SQ3"

table(data$q_0009_SQ3)
barplot(table(data$q_0009_SQ3), xlab="Interested in Family / Systemic Therapy Psychotherapy")

data[, 19] <- as.numeric(data[, 19])
attributes(data)$variable.labels[19] <- "[Group modalities of therapies] What types of Psychotherapy are you interested in?"
data[, 19] <- factor(data[, 19], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[19] <- "q_0009_SQ4"

table(data$q_0009_SQ4)
barplot(table(data$q_0009_SQ4), xlab="Interested in Group modalities of therapies")

data[, 20] <- as.numeric(data[, 20])
attributes(data)$variable.labels[20] <- "[I am not interested in Psychotherapy] What types of Psychotherapy are you interested in?"
data[, 20] <- factor(data[, 20], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[20] <- "q_0009_Ax"

data$q_0009_Ax
table(data$q_0009_Ax)
barplot(table(data$q_0009_Ax), xlab="I am not interested in Psychotherapy")

data[, 21] <- as.character(data[, 21])
attributes(data)$variable.labels[21] <- "[Other] What types of Psychotherapy are you interested in?"
names(data)[21] <- "q_0009_other"

data$q_0009_other
table (data$q_0009_other)

data[, 22] <- as.character(data[, 22])
attributes(data)$variable.labels[22] <- "Your comments about your preferences with regard to Psychotherapy:"
names(data)[22] <- "q_0010"

table(data$q_0010)

data[, 23] <- as.numeric(data[, 23])
attributes(data)$variable.labels[23] <- "[Theoretical lectures or seminars in Psychotherapy] The following experience in Psychotherapy is a mandatory part of my training in Psychiatry:"
data[, 23] <- factor(data[, 23], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[23] <- "q_0011_SQ001"

table(data$q_0011_SQ001)
barplot(table(data$q_0011_SQ001), xlab="[Theoretical lectures or seminars in Psychotherapy] The following experience in Psychotherapy is a mandatory part of my training in Psychiatry:")

data[, 24] <- as.numeric(data[, 24])
attributes(data)$variable.labels[24] <- "[Conducting Psychotherapy without supervision with a patient or group] The following experience in Psychotherapy is a mandatory part of my training in Psychiatry:"
data[, 24] <- factor(data[, 24], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[24] <- "q_0011_SQ002"

table(data$q_0011_SQ002)
barplot(table(data$q_0011_SQ001), col="blue", xlab="[Conducting Psychotherapy without supervision with a patient or group] The following experience in Psychotherapy is a mandatory part of my training in Psychiatry:")

data[, 25] <- as.numeric(data[, 25])
attributes(data)$variable.labels[25] <- "[Conducting Psychotherapy under supervision with a patient or group] The following experience in Psychotherapy is a mandatory part of my training in Psychiatry:"
data[, 25] <- factor(data[, 25], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[25] <- "q_0011_SQ003"

table(data$q_0011_SQ003)
barplot(table(data$q_0011_SQ003), col="yellow", xlab="[Conducting Psychotherapy under supervision with a patient or group] The following experience in Psychotherapy is a mandatory part of my training in Psychiatry:")

data[, 26] <- as.numeric(data[, 26])
attributes(data)$variable.labels[26] <- "[Personal Psychotherapy] The following experience in Psychotherapy is a mandatory part of my training in Psychiatry:"
data[, 26] <- factor(data[, 26], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[26] <- "q_0011_SQ004"

table(data$q_0011_SQ004)
barplot(table(data$q_0011_SQ004), col="orange", xlab="[Personal Psychotherapy] The following experience in Psychotherapy is a mandatory part of my training in Psychiatry:")

data[, 27] <- as.character(data[, 27])
attributes(data)$variable.labels[27] <- "Are you qualified to practice Psychotherapy after you finish your training in Psychiatry?"
data[, 27] <- factor(data[, 27], levels=c("A1","A2","A3"),labels=c("Yes","No","Unsure"))
names(data)[27] <- "q_0012"

table(data$q_0012)
barplot(table(data$q_0012), col="green", xlab="Are you qualified to practice Psychotherapy after you finish your training in Psychiatry?")

data[, 28] <- as.character(data[, 28])
attributes(data)$variable.labels[28] <- "What types of psychotherapy modalities are available for treatment of patients at the institution or hospital where you are training to become a psychiatrist?"
names(data)[28] <- "q_0013"

table(data$q_0013)

data[, 29] <- as.numeric(data[, 29])
attributes(data)$variable.labels[29] <- "[Individual supervision] How many hours of supervision do you have for your Psychotherapy training per month?"
names(data)[29] <- "q_0014_SQ001"

data$q_0014_SQ001
hist(data$q_0014_SQ001, col="pink", xlab="Hours", main = "[Individual supervision] How many hours of supervision do you have for your Psychotherapy training per month?")

data[, 30] <- as.numeric(data[, 30])
attributes(data)$variable.labels[30] <- "[Small group supervision (3 - 5 people)] How many hours of supervision do you have for your Psychotherapy training per month?"
names(data)[30] <- "q_0014_SQ002"

hist(data$q_0014_SQ002, col="red", xlab="Hours", main="[Small group supervision (3 - 5 people)] How many hours of supervision do you have for your Psychotherapy training per month?")
#to merge ??
#plot(density(data$q_0014_SQ002))

data[, 31] <- as.numeric(data[, 31])
attributes(data)$variable.labels[31] <- "[Large group supervision (more than 5 people)] How many hours of supervision do you have for your Psychotherapy training per month?"
names(data)[31] <- "q_0014_SQ003"

data$q_0014_SQ003
hist(data$q_0014_SQ003, xlab="[Large group supervision (more than 5 people)] How many hours of supervision do you have for your Psychotherapy training per month?")

data[, 32] <- as.numeric(data[, 32])
attributes(data)$variable.labels[32] <- "[Generic Balint group] How many hours of supervision do you have for your Psychotherapy training per month?"
names(data)[32] <- "q_0014_SQ004"

data$q_0014_SQ004
hist(data$q_0014_SQ001, col="pink", xlab= "Hours", main ="[Generic Balint group] How many hours of supervision do you have for your Psychotherapy training per month?")

data[, 33] <- as.numeric(data[, 33])
attributes(data)$variable.labels[33] <- "[Other form of supervision (please explain in the freeform text box below)] How many hours of supervision do you have for your Psychotherapy training per month?"
names(data)[33] <- "q_0014_SQ005"

data$q_0014_SQ005
hist(data$q_0014_SQ005)

data[, 34] <- as.character(data[, 34])
attributes(data)$variable.labels[34] <- "If you have chosen other form of supervision in the previous question, please describe what other form of supervision you receive."
names(data)[34] <- "q_0015"

table(data$q_0015)

data[, 35] <- as.character(data[, 35])
attributes(data)$variable.labels[35] <- "[Theorectical lectures / seminars] Who pays for the following components of Psychotherapy experience?"
data[, 35] <- factor(data[, 35], levels=c("A1","A2","A3","A4"),labels=c("I pay","State / 3rd party pays","It is FREE","I don't have it"))
names(data)[35] <- "q_0016_SQ001"

data$q_0016_SQ001
barplot(table(data$q_0016_SQ001), col="light blue", xlab="[Theorectical lectures / seminars] Who pays for the following components of Psychotherapy experience?")

data[, 36] <- as.character(data[, 36])
attributes(data)$variable.labels[36] <- "[Supervision - individual] Who pays for the following components of Psychotherapy experience?"
data[, 36] <- factor(data[, 36], levels=c("A1","A2","A3","A4"),labels=c("I pay","State / 3rd party pays","It is FREE","I don't have it"))
names(data)[36] <- "q_0016_SQ002"

data$q_0016_SQ002
barplot(table(data$q_0016_SQ002), xlab="[Supervision - individual] Who pays for the following components of Psychotherapy experience?")

data[, 37] <- as.character(data[, 37])
attributes(data)$variable.labels[37] <- "[Supervision - group] Who pays for the following components of Psychotherapy experience?"
data[, 37] <- factor(data[, 37], levels=c("A1","A2","A3","A4"),labels=c("I pay","State / 3rd party pays","It is FREE","I don't have it"))
names(data)[37] <- "q_0016_SQ003"

table(data$q_0016_SQ003)
barplot(table(data$q_0016_SQ003), main="[Supervision - group] Who pays for the following components of Psychotherapy experience?")

data[, 38] <- as.character(data[, 38])
attributes(data)$variable.labels[38] <- "[Balint groups] Who pays for the following components of Psychotherapy experience?"
data[, 38] <- factor(data[, 38], levels=c("A1","A2","A3","A4"),labels=c("I pay","State / 3rd party pays","It is FREE","I don't have it"))
names(data)[38] <- "q_0016_SQ004"

table(data$q_0016_SQ004)
barplot(table(data$q_0016_SQ004), main="[Balint groups] Who pays for the following components of Psychotherapy experience?")

data[, 39] <- as.character(data[, 39])
attributes(data)$variable.labels[39] <- "[Sessions with patient(s)] Who pays for the following components of Psychotherapy experience?"
data[, 39] <- factor(data[, 39], levels=c("A1","A2","A3","A4"),labels=c("I pay","State / 3rd party pays","It is FREE","I don't have it"))
names(data)[39] <- "q_0016_SQ005"

table(data$q_0016_SQ005)
barplot(table(data$q_0016_SQ004), main="[Sessions with patient(s)] Who pays for the following components of Psychotherapy experience?")

data[, 40] <- as.character(data[, 40])
attributes(data)$variable.labels[40] <- "[Self-experience *] Who pays for the following components of Psychotherapy experience?"
data[, 40] <- factor(data[, 40], levels=c("A1","A2","A3","A4"),labels=c("I pay","State / 3rd party pays","It is FREE","I don't have it"))
names(data)[40] <- "q_0016_SQ006"

table(data$q_0016_SQ006)
barplot(table(data$q_0016_SQ004), main="[Self-experience *] Who pays for the following components of Psychotherapy experience?")

data[, 41] <- as.numeric(data[, 41])
attributes(data)$variable.labels[41] <- "Would you be motivated to undertake training in Psychotherapy, if financing is not an issue?"
data[, 41] <- factor(data[, 41], levels=c(1,2),labels=c("Yes","No"))
names(data)[41] <- "q_0017"

table(data$q_0017)
pie(table(data$q_0017), main="Would you be motivated to undertake training in Psychotherapy, if financing is not an issue?")

data[, 42] <- as.numeric(data[, 42])
attributes(data)$variable.labels[42] <- "What percentage of your annual salary do you intend to spend on funding your psychotherapy training In the next 12 months?"
names(data)[42] <- "q_0018"
hist(data$q_0018, main="What percentage of your annual salary do you intend to spend on funding your psychotherapy training In the next 12 months?")

data[, 43] <- as.character(data[, 43])
attributes(data)$variable.labels[43] <- "[I am satisfied with Psychotherapy component in my training programme] Please indicate how strongly you agree with the following statements."
data[, 43] <- factor(data[, 43], levels=c("SD","D","NAD","A","SA"),labels=c("Strongly Disagree","Disagree","Neutral","Agree","Strongly Agree"))
names(data)[43] <- "q_0019_SQ001"

table(data$q_0019_SQ001)
barplot(table(data$q_0019_SQ001), main ="[I am satisfied with Psychotherapy component in my training programme]")

data[, 44] <- as.character(data[, 44])
attributes(data)$variable.labels[44] <- "[I am satisfied with Psychotherapy training options in my country] Please indicate how strongly you agree with the following statements."
data[, 44] <- factor(data[, 44], levels=c("SD","D","NAD","A","SA"),labels=c("Strongly Disagree","Disagree","Neutral","Agree","Strongly Agree"))
names(data)[44] <- "q_0019_SQ002"

data[, 45] <- as.character(data[, 45])
attributes(data)$variable.labels[45] <- "[I am satisfied with the level of funding for Psychotherapy training within Psychiatry in my country] Please indicate how strongly you agree with the following statements."
data[, 45] <- factor(data[, 45], levels=c("SD","D","NAD","A","SA"),labels=c("Strongly Disagree","Disagree","Neutral","Agree","Strongly Agree"))
names(data)[45] <- "q_0019_SQ003"

#Field hidden

data[, 46] <- as.numeric(data[, 46])
attributes(data)$variable.labels[46] <- "[Psychotherapy is a mandatory part of the training curriculum that takes place within working hours.] Are you aware of UEMS (European Union of Medical Specialists) recommendations for training in Psychiatry in European countries?"
data[, 46] <- factor(data[, 46], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[46] <- "q_0021_SQ001"

data[, 47] <- as.numeric(data[, 47])
attributes(data)$variable.labels[47] <- "[Practical application of psychotherapy should be conducted in a defined number of cases.] Are you aware of UEMS (European Union of Medical Specialists) recommendations for training in Psychiatry in European countries?"
data[, 47] <- factor(data[, 47], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[47] <- "q_0021_SQ002"

data[, 48] <- as.numeric(data[, 48])
attributes(data)$variable.labels[48] <- "[The Theory of psychotherapy should be delivered over at least 120 hours.] Are you aware of UEMS (European Union of Medical Specialists) recommendations for training in Psychiatry in European countries?"
data[, 48] <- factor(data[, 48], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[48] <- "q_0021_SQ003"

data[, 49] <- as.numeric(data[, 49])
attributes(data)$variable.labels[49] <- "[Experience in psychotherapy should be gained with individuals as well as family and groups.] Are you aware of UEMS (European Union of Medical Specialists) recommendations for training in Psychiatry in European countries?"
data[, 49] <- factor(data[, 49], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[49] <- "q_0021_SQ004"

data[, 50] <- as.numeric(data[, 50])
attributes(data)$variable.labels[50] <- "[As a minimum, psychodynamic, CBT and systemic theory and methods should be applied, but integrative psychotherapies are highly recommended.] Are you aware of UEMS (European Union of Medical Specialists) recommendations for training in Psychiatry in European countries?"
data[, 50] <- factor(data[, 50], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[50] <- "q_0021_SQ005"

data[, 51] <- as.numeric(data[, 51])
attributes(data)$variable.labels[51] <- "[Personal therapeutic experience / feed-back on personal style is highly recommended.] Are you aware of UEMS (European Union of Medical Specialists) recommendations for training in Psychiatry in European countries?"
data[, 51] <- factor(data[, 51], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[51] <- "q_0021_SQ006"

data[, 52] <- as.numeric(data[, 52])
attributes(data)$variable.labels[52] <- "[Supervisors should be qualified.] Are you aware of UEMS (European Union of Medical Specialists) recommendations for training in Psychiatry in European countries?"
data[, 52] <- factor(data[, 52], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[52] <- "q_0021_SQ007"

data[, 53] <- as.numeric(data[, 53])
attributes(data)$variable.labels[53] <- "[Supervision should be provided on a regular basis for at least 100 hours. Individual but preferably also group supervision should be applied. At least 50 hours of supervision should be conducted on an individual basis.] Are you aware of UEMS (European Union of Medical Specialists) recommendations for training in Psychiatry in European countries?"
data[, 53] <- factor(data[, 53], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[53] <- "q_0021_SQ008"

data[, 54] <- as.numeric(data[, 54])
attributes(data)$variable.labels[54] <- "[Training should be publicly funded.] Are you aware of UEMS (European Union of Medical Specialists) recommendations for training in Psychiatry in European countries?"
data[, 54] <- factor(data[, 54], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[54] <- "q_0021_SQ009"

data[, 55] <- as.numeric(data[, 55])
attributes(data)$variable.labels[55] <- "[Psychotherapy is a mandatory part of the training curriculum that takes place within working hours.] Do you think these recommendations have been implemented in your Psychiatry training scheme, or any other in your country?"
data[, 55] <- factor(data[, 55], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[55] <- "q_0022_SQ001"

data[, 56] <- as.numeric(data[, 56])
attributes(data)$variable.labels[56] <- "[Practical application of psychotherapy should be conducted in a defined number of cases.] Do you think these recommendations have been implemented in your Psychiatry training scheme, or any other in your country?"
data[, 56] <- factor(data[, 56], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[56] <- "q_0022_SQ002"

data[, 57] <- as.numeric(data[, 57])
attributes(data)$variable.labels[57] <- "[The Theory of psychotherapy should be delivered over at least 120 hours.] Do you think these recommendations have been implemented in your Psychiatry training scheme, or any other in your country?"
data[, 57] <- factor(data[, 57], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[57] <- "q_0022_SQ003"

data[, 58] <- as.numeric(data[, 58])
attributes(data)$variable.labels[58] <- "[Experience in psychotherapy should be gained with individuals as well as family and groups.] Do you think these recommendations have been implemented in your Psychiatry training scheme, or any other in your country?"
data[, 58] <- factor(data[, 58], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[58] <- "q_0022_SQ004"

data[, 59] <- as.numeric(data[, 59])
attributes(data)$variable.labels[59] <- "[As a minimum, psychodynamic, CBT and systemic theory and methods should be applied, but integrative psychotherapies are highly recommended.] Do you think these recommendations have been implemented in your Psychiatry training scheme, or any other in your country?"
data[, 59] <- factor(data[, 59], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[59] <- "q_0022_SQ005"

data[, 60] <- as.numeric(data[, 60])
attributes(data)$variable.labels[60] <- "[Personal therapeutic experience / feed-back on personal style is highly recommended.] Do you think these recommendations have been implemented in your Psychiatry training scheme, or any other in your country?"
data[, 60] <- factor(data[, 60], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[60] <- "q_0022_SQ006"

data[, 61] <- as.numeric(data[, 61])
attributes(data)$variable.labels[61] <- "[Supervisors should be qualified.] Do you think these recommendations have been implemented in your Psychiatry training scheme, or any other in your country?"
data[, 61] <- factor(data[, 61], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[61] <- "q_0022_SQ007"

data[, 62] <- as.numeric(data[, 62])
attributes(data)$variable.labels[62] <- "[Supervision should be provided on a regular basis for at least 100 hours. Individual but preferably also group supervision should be applied. At least 50 hours of supervision should be conducted on an individual basis.] Do you think these recommendations have been implemented in your Psychiatry training scheme, or any other in your country?"
data[, 62] <- factor(data[, 62], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[62] <- "q_0022_SQ008"

data[, 63] <- as.numeric(data[, 63])
attributes(data)$variable.labels[63] <- "[Training should be publicly funded.] Do you think these recommendations have been implemented in your Psychiatry training scheme, or any other in your country?"
data[, 63] <- factor(data[, 63], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[63] <- "q_0022_SQ009"

data[, 64] <- as.character(data[, 64])
attributes(data)$variable.labels[64] <- "Please do not hesitate to leave your comments or suggestions in the free form text field below. We are very grateful for your participation and wish all the success in your future career."
names(data)[64] <- "q_0023"



