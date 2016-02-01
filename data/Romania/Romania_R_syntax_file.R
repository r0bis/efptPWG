#$Rev: 12179 $ .
data <- read.table("Romania_R_data_file.csv", sep=",", quote = "'", na.strings=c("","\"\""), stringsAsFactors=FALSE)

data[, 1] <- as.character(data[, 1])
attributes(data)$variable.labels[1] <- "First name"
names(data)[1] <- "firstname"

data[, 2] <- as.character(data[, 2])
attributes(data)$variable.labels[2] <- "Last name"
names(data)[2] <- "lastname"

data[, 3] <- as.character(data[, 3])
attributes(data)$variable.labels[3] <- "Email address"
names(data)[3] <- "email"

data[, 4] <- as.character(data[, 4])
attributes(data)$variable.labels[4] <- "Language code"
names(data)[4] <- "language"

data[, 5] <- as.character(data[, 5])
attributes(data)$variable.labels[5] <- "Invitation sent date"
names(data)[5] <- "sent"

data[, 6] <- as.character(data[, 6])
attributes(data)$variable.labels[6] <- "Last Reminder sent date"
names(data)[6] <- "remindersent"

data[, 7] <- as.character(data[, 7])
attributes(data)$variable.labels[7] <- "Total numbers of sent reminders"
names(data)[7] <- "remindercount"

data[, 8] <- as.character(data[, 8])
attributes(data)$variable.labels[8] <- "Uses left"
names(data)[8] <- "usesleft"

data[, 9] <- as.numeric(data[, 9])
attributes(data)$variable.labels[9] <- "id"
names(data)[9] <- "id"

data[, 10] <- as.character(data[, 10])
attributes(data)$variable.labels[10] <- "submitdate"
names(data)[10] <- "submitdate"

#Field hidden

data[, 11] <- as.character(data[, 11])
attributes(data)$variable.labels[11] <- "startlanguage"
names(data)[11] <- "startlanguage"

data[, 12] <- as.character(data[, 12])
attributes(data)$variable.labels[12] <- "token"
names(data)[12] <- "token"

data[, 13] <- as.character(data[, 13])
attributes(data)$variable.labels[13] <- "datestamp"
names(data)[13] <- "datestamp"

data[, 14] <- as.character(data[, 14])
attributes(data)$variable.labels[14] <- "startdate"
names(data)[14] <- "startdate"

data[, 15] <- as.character(data[, 15])
attributes(data)$variable.labels[15] <- "ipaddr"
names(data)[15] <- "ipaddr"

data[, 16] <- as.numeric(data[, 16])
attributes(data)$variable.labels[16] <- "Country"
data[, 16] <- factor(data[, 16], levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50),labels=c("Albania","Andorra","Armenia","Austria","Azerbaijan","Belarus","Belgium","Bosnia and Herzegovina","Bulgaria","Croatia","Cyprus","Czech Republic","Denmark","Estonia","Finland","France ","Georgia","Germany","Greece","Hungary","Iceland","Ireland","Israel","Italy","Kazakhstan","Latvia","Liechtenstein","Lithuania","Luxembourg","Macedonia","Malta","Moldova","Monaco","Montenegro","Netherlands","Norway","Poland","Portugal","Romania","Russia","San Marino","Serbia","Slovakia","Slovenia","Spain","Sweden","Switzerland","Turkey","Ukraine","United Kingdom"))
names(data)[16] <- "q_0000"

data[, 17] <- as.numeric(data[, 17])
attributes(data)$variable.labels[17] <- "Gender"
data[, 17] <- factor(data[, 17], levels=c(1,2),labels=c("Female","Male"))
names(data)[17] <- "q_0001"

data[, 18] <- as.numeric(data[, 18])
attributes(data)$variable.labels[18] <- "Age"
names(data)[18] <- "q_0002"

data[, 19] <- as.character(data[, 19])
attributes(data)$variable.labels[19] <- "Year of training"
data[, 19] <- factor(data[, 19], levels=c("S04A1","S04A2","S04A3","S04A4","S04A5","S04A6","S04A7","S04A8","S04A9","S0410"),labels=c("Year 1","Year 2","Year 3","Year 4","Year 5","Year 6","Year 7","Year 8","More than 8 years in training","I have recently finished training (within last 5 years)"))
names(data)[19] <- "q_0003"

data[, 20] <- as.numeric(data[, 20])
attributes(data)$variable.labels[20] <- "Are you receiving personal psychotherapy or have you received it in the past?"
data[, 20] <- factor(data[, 20], levels=c(1,2),labels=c("Yes","No"))
names(data)[20] <- "q_0004"

data[, 21] <- as.numeric(data[, 21])
attributes(data)$variable.labels[21] <- "[I am undertaking training in psychotherapy within my training programme in psychiatry] Are you training in psychotherapy?"
data[, 21] <- factor(data[, 21], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[21] <- "q_0005_S05A1"

data[, 22] <- as.numeric(data[, 22])
attributes(data)$variable.labels[22] <- "[I am undertaking training in psychotherapy on my own initiative (outside my training programme in psychiatry)] Are you training in psychotherapy?"
data[, 22] <- factor(data[, 22], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[22] <- "q_0005_S05A2"

data[, 23] <- as.numeric(data[, 23])
attributes(data)$variable.labels[23] <- "[I am not undertaking any training in psychotherapy] Are you training in psychotherapy?"
data[, 23] <- factor(data[, 23], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[23] <- "q_0005_S05A3"

data[, 24] <- as.numeric(data[, 24])
attributes(data)$variable.labels[24] <- "[I have completed full training in a psychotherapy specialty in the past] Are you training in psychotherapy?"
data[, 24] <- factor(data[, 24], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[24] <- "q_0005_S05A4"

data[, 25] <- as.character(data[, 25])
attributes(data)$variable.labels[25] <- "[Other] Are you training in psychotherapy?"
names(data)[25] <- "q_0005_other"

data[, 26] <- as.character(data[, 26])
attributes(data)$variable.labels[26] <- "You have indicated in answering the previous question that you are training to be a psychotherapist, or have already completed a full training in at least one psychotherapeutic modality. Would you please write in the box below, what modality you have trained in or are training now."
names(data)[26] <- "q_0006"

data[, 27] <- as.character(data[, 27])
attributes(data)$variable.labels[27] <- "Is psychotherapy important for your professional identity as a psychiatrist?"
data[, 27] <- factor(data[, 27], levels=c("A1","A2","A3"),labels=c("Yes","No","I don't know"))
names(data)[27] <- "q_0007"

data[, 28] <- as.numeric(data[, 28])
attributes(data)$variable.labels[28] <- "Do you want to practise psychotherapy after your training in psychiatry?"
data[, 28] <- factor(data[, 28], levels=c(1,2),labels=c("Yes","No"))
names(data)[28] <- "q_0008"

data[, 29] <- as.numeric(data[, 29])
attributes(data)$variable.labels[29] <- "[Psychodynamic (Psychoanalytic) Psychotherapy] What types of psychotherapy are you interested in?"
data[, 29] <- factor(data[, 29], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[29] <- "q_0009_SQ1"

data[, 30] <- as.numeric(data[, 30])
attributes(data)$variable.labels[30] <- "[Cognitive Behavioural Psychotherapy] What types of psychotherapy are you interested in?"
data[, 30] <- factor(data[, 30], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[30] <- "q_0009_SQ2"

data[, 31] <- as.numeric(data[, 31])
attributes(data)$variable.labels[31] <- "[Family / Systemic Therapy] What types of psychotherapy are you interested in?"
data[, 31] <- factor(data[, 31], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[31] <- "q_0009_SQ3"

data[, 32] <- as.numeric(data[, 32])
attributes(data)$variable.labels[32] <- "[Group modalities of psychotherapies] What types of psychotherapy are you interested in?"
data[, 32] <- factor(data[, 32], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[32] <- "q_0009_SQ4"

data[, 33] <- as.numeric(data[, 33])
attributes(data)$variable.labels[33] <- "[I am not interested in psychotherapy] What types of psychotherapy are you interested in?"
data[, 33] <- factor(data[, 33], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[33] <- "q_0009_Ax"

data[, 34] <- as.character(data[, 34])
attributes(data)$variable.labels[34] <- "[Other] What types of psychotherapy are you interested in?"
names(data)[34] <- "q_0009_other"

data[, 35] <- as.character(data[, 35])
attributes(data)$variable.labels[35] <- "Your comments on your preferences with regard to psychotherapy:"
names(data)[35] <- "q_0010"

data[, 36] <- as.numeric(data[, 36])
attributes(data)$variable.labels[36] <- "[Theoretical lectures or seminars in psychotherapy] The following experience in psychotherapy is a mandatory part of my training in psychiatry:"
data[, 36] <- factor(data[, 36], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[36] <- "q_0011_SQ001"

data[, 37] <- as.numeric(data[, 37])
attributes(data)$variable.labels[37] <- "[Conducting psychotherapy without supervision with a patient or group] The following experience in psychotherapy is a mandatory part of my training in psychiatry:"
data[, 37] <- factor(data[, 37], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[37] <- "q_0011_SQ002"

data[, 38] <- as.numeric(data[, 38])
attributes(data)$variable.labels[38] <- "[Conducting psychotherapy under supervision with a patient or group] The following experience in psychotherapy is a mandatory part of my training in psychiatry:"
data[, 38] <- factor(data[, 38], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[38] <- "q_0011_SQ003"

data[, 39] <- as.numeric(data[, 39])
attributes(data)$variable.labels[39] <- "[Personal psychotherapy] The following experience in psychotherapy is a mandatory part of my training in psychiatry:"
data[, 39] <- factor(data[, 39], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[39] <- "q_0011_SQ004"

data[, 40] <- as.character(data[, 40])
attributes(data)$variable.labels[40] <- "Are you qualified to practice psychotherapy after you finish your training in psychiatry?"
data[, 40] <- factor(data[, 40], levels=c("A1","A2","A3"),labels=c("Yes","No","Unsure"))
names(data)[40] <- "q_0012"

data[, 41] <- as.character(data[, 41])
attributes(data)$variable.labels[41] <- "[Other] Are you qualified to practice psychotherapy after you finish your training in psychiatry?"
names(data)[41] <- "q_0012_other"

data[, 42] <- as.character(data[, 42])
attributes(data)$variable.labels[42] <- "What types of psychoteherapy modalities are available for treatment of patients at the institution or hospital where you are training to become a psychiatrist?"
names(data)[42] <- "q_0013"

data[, 43] <- as.numeric(data[, 43])
attributes(data)$variable.labels[43] <- "[Individual supervision] How many hours of supervision do you have for your psychotherapy training per month?"
names(data)[43] <- "q_0014_SQ001"

data[, 44] <- as.numeric(data[, 44])
attributes(data)$variable.labels[44] <- "[Small group supervision (3 - 5 people)] How many hours of supervision do you have for your psychotherapy training per month?"
names(data)[44] <- "q_0014_SQ002"

data[, 45] <- as.numeric(data[, 45])
attributes(data)$variable.labels[45] <- "[Large group supervision (more than 5 people)] How many hours of supervision do you have for your psychotherapy training per month?"
names(data)[45] <- "q_0014_SQ003"

data[, 46] <- as.numeric(data[, 46])
attributes(data)$variable.labels[46] <- "[Generic Balint group] How many hours of supervision do you have for your psychotherapy training per month?"
names(data)[46] <- "q_0014_SQ004"

data[, 47] <- as.numeric(data[, 47])
attributes(data)$variable.labels[47] <- "[Other form of supervision (please explain in the freeform text box below)] How many hours of supervision do you have for your psychotherapy training per month?"
names(data)[47] <- "q_0014_SQ005"

data[, 48] <- as.character(data[, 48])
attributes(data)$variable.labels[48] <- "If you have chosen other form of supervision in the previous question, please describe what other form of supervision you receive."
names(data)[48] <- "q_0015"

data[, 49] <- as.character(data[, 49])
attributes(data)$variable.labels[49] <- "[Theorectical lectures / seminars] Who pays for the following components of psychotherapy experience?"
data[, 49] <- factor(data[, 49], levels=c("A1","A2","A3"),labels=c("I pay","State / 3rd party pays","I don't have it"))
names(data)[49] <- "q_0016_SQ001"

data[, 50] <- as.character(data[, 50])
attributes(data)$variable.labels[50] <- "[Supervision - individual] Who pays for the following components of psychotherapy experience?"
data[, 50] <- factor(data[, 50], levels=c("A1","A2","A3"),labels=c("I pay","State / 3rd party pays","I don't have it"))
names(data)[50] <- "q_0016_SQ002"

data[, 51] <- as.character(data[, 51])
attributes(data)$variable.labels[51] <- "[Supervision - group] Who pays for the following components of psychotherapy experience?"
data[, 51] <- factor(data[, 51], levels=c("A1","A2","A3"),labels=c("I pay","State / 3rd party pays","I don't have it"))
names(data)[51] <- "q_0016_SQ003"

data[, 52] <- as.character(data[, 52])
attributes(data)$variable.labels[52] <- "[Balint groups] Who pays for the following components of psychotherapy experience?"
data[, 52] <- factor(data[, 52], levels=c("A1","A2","A3"),labels=c("I pay","State / 3rd party pays","I don't have it"))
names(data)[52] <- "q_0016_SQ004"

data[, 53] <- as.character(data[, 53])
attributes(data)$variable.labels[53] <- "[Sessions with patient(s)] Who pays for the following components of psychotherapy experience?"
data[, 53] <- factor(data[, 53], levels=c("A1","A2","A3"),labels=c("I pay","State / 3rd party pays","I don't have it"))
names(data)[53] <- "q_0016_SQ005"

data[, 54] <- as.character(data[, 54])
attributes(data)$variable.labels[54] <- "[Self-experience *] Who pays for the following components of psychotherapy experience?"
data[, 54] <- factor(data[, 54], levels=c("A1","A2","A3"),labels=c("I pay","State / 3rd party pays","I don't have it"))
names(data)[54] <- "q_0016_SQ006"

data[, 55] <- as.numeric(data[, 55])
attributes(data)$variable.labels[55] <- "Would you be motivated to undertake training in psychotherapy, if financing is not an issue?"
data[, 55] <- factor(data[, 55], levels=c(1,2),labels=c("Yes","No"))
names(data)[55] <- "q_0017"

data[, 56] <- as.numeric(data[, 56])
attributes(data)$variable.labels[56] <- "What percentage of your annual salary do you intend to spend on funding your psychotherapy training In the next 12 months?"
names(data)[56] <- "q_0018"

data[, 57] <- as.character(data[, 57])
attributes(data)$variable.labels[57] <- "[I am satisfied with psychotherapy component in my training programme] Please indicate how strongly you agree with the following statements."
data[, 57] <- factor(data[, 57], levels=c("SD","D","NAD","A","SA"),labels=c("Strongly Disagree","Disagree","Neutral","Agree","Strongly Agree"))
names(data)[57] <- "q_0019_SQ001"

data[, 58] <- as.character(data[, 58])
attributes(data)$variable.labels[58] <- "[I am satisfied with psychotherapy training options in my country] Please indicate how strongly you agree with the following statements."
data[, 58] <- factor(data[, 58], levels=c("SD","D","NAD","A","SA"),labels=c("Strongly Disagree","Disagree","Neutral","Agree","Strongly Agree"))
names(data)[58] <- "q_0019_SQ002"

data[, 59] <- as.character(data[, 59])
attributes(data)$variable.labels[59] <- "[I am satisfied with the level of funding for psychotherapy training within psychiatry in my country] Please indicate how strongly you agree with the following statements."
data[, 59] <- factor(data[, 59], levels=c("SD","D","NAD","A","SA"),labels=c("Strongly Disagree","Disagree","Neutral","Agree","Strongly Agree"))
names(data)[59] <- "q_0019_SQ003"

#Field hidden

data[, 60] <- as.numeric(data[, 60])
attributes(data)$variable.labels[60] <- "[Psychotherapy is a mandatory part of the training curriculum that takes place within working hours.] Are you aware of UEMS (European Union of Medical Specialists) recommendations for training in psychiatry in European countries?"
data[, 60] <- factor(data[, 60], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[60] <- "q_0021_SQ001"

data[, 61] <- as.numeric(data[, 61])
attributes(data)$variable.labels[61] <- "[Practical application of psychotherapy should be conducted in a defined number of cases.] Are you aware of UEMS (European Union of Medical Specialists) recommendations for training in psychiatry in European countries?"
data[, 61] <- factor(data[, 61], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[61] <- "q_0021_SQ002"

data[, 62] <- as.numeric(data[, 62])
attributes(data)$variable.labels[62] <- "[The Theory of psychotherapy should be delivered over at least 120 hours.] Are you aware of UEMS (European Union of Medical Specialists) recommendations for training in psychiatry in European countries?"
data[, 62] <- factor(data[, 62], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[62] <- "q_0021_SQ003"

data[, 63] <- as.numeric(data[, 63])
attributes(data)$variable.labels[63] <- "[Experience in psychotherapy should be gained with individuals as well as family and groups.] Are you aware of UEMS (European Union of Medical Specialists) recommendations for training in psychiatry in European countries?"
data[, 63] <- factor(data[, 63], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[63] <- "q_0021_SQ004"

data[, 64] <- as.numeric(data[, 64])
attributes(data)$variable.labels[64] <- "[As a minimum, psychodynamic, CBT and systemic theory and methods should be applied, but integrative psychotherapies are highly recommended.] Are you aware of UEMS (European Union of Medical Specialists) recommendations for training in psychiatry in European countries?"
data[, 64] <- factor(data[, 64], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[64] <- "q_0021_SQ005"

data[, 65] <- as.numeric(data[, 65])
attributes(data)$variable.labels[65] <- "[Personal therapeutic experience / feed-back on personal style is highly recommended.] Are you aware of UEMS (European Union of Medical Specialists) recommendations for training in psychiatry in European countries?"
data[, 65] <- factor(data[, 65], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[65] <- "q_0021_SQ006"

data[, 66] <- as.numeric(data[, 66])
attributes(data)$variable.labels[66] <- "[Supervisors should be qualified.] Are you aware of UEMS (European Union of Medical Specialists) recommendations for training in psychiatry in European countries?"
data[, 66] <- factor(data[, 66], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[66] <- "q_0021_SQ007"

data[, 67] <- as.numeric(data[, 67])
attributes(data)$variable.labels[67] <- "[Supervision should be provided on a regular basis for at least 100 hours. Individual but preferably also group supervision should be applied. At least 50 hours of supervision should be conducted on an individual basis.] Are you aware of UEMS (European Union of Medical Specialists) recommendations for training in psychiatry in European countries?"
data[, 67] <- factor(data[, 67], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[67] <- "q_0021_SQ008"

data[, 68] <- as.numeric(data[, 68])
attributes(data)$variable.labels[68] <- "[Training should be publicly funded.] Are you aware of UEMS (European Union of Medical Specialists) recommendations for training in psychiatry in European countries?"
data[, 68] <- factor(data[, 68], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[68] <- "q_0021_SQ009"

data[, 69] <- as.numeric(data[, 69])
attributes(data)$variable.labels[69] <- "[Psychotherapy is a mandatory part of the training curriculum that takes place within working hours.] Do you think these recommendations have been implemented in your psychiatry training scheme, or any other in your country?"
data[, 69] <- factor(data[, 69], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[69] <- "q_0022_SQ001"

data[, 70] <- as.numeric(data[, 70])
attributes(data)$variable.labels[70] <- "[Practical application of psychotherapy should be conducted in a defined number of cases.] Do you think these recommendations have been implemented in your psychiatry training scheme, or any other in your country?"
data[, 70] <- factor(data[, 70], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[70] <- "q_0022_SQ002"

data[, 71] <- as.numeric(data[, 71])
attributes(data)$variable.labels[71] <- "[The Theory of psychotherapy should be delivered over at least 120 hours.] Do you think these recommendations have been implemented in your psychiatry training scheme, or any other in your country?"
data[, 71] <- factor(data[, 71], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[71] <- "q_0022_SQ003"

data[, 72] <- as.numeric(data[, 72])
attributes(data)$variable.labels[72] <- "[Experience in psychotherapy should be gained with individuals as well as family and groups.] Do you think these recommendations have been implemented in your psychiatry training scheme, or any other in your country?"
data[, 72] <- factor(data[, 72], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[72] <- "q_0022_SQ004"

data[, 73] <- as.numeric(data[, 73])
attributes(data)$variable.labels[73] <- "[As a minimum, psychodynamic, CBT and systemic theory and methods should be applied, but integrative psychotherapies are highly recommended.] Do you think these recommendations have been implemented in your psychiatry training scheme, or any other in your country?"
data[, 73] <- factor(data[, 73], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[73] <- "q_0022_SQ005"

data[, 74] <- as.numeric(data[, 74])
attributes(data)$variable.labels[74] <- "[Personal therapeutic experience / feed-back on personal style is highly recommended.] Do you think these recommendations have been implemented in your psychiatry training scheme, or any other in your country?"
data[, 74] <- factor(data[, 74], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[74] <- "q_0022_SQ006"

data[, 75] <- as.numeric(data[, 75])
attributes(data)$variable.labels[75] <- "[Supervisors should be qualified.] Do you think these recommendations have been implemented in your psychiatry training scheme, or any other in your country?"
data[, 75] <- factor(data[, 75], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[75] <- "q_0022_SQ007"

data[, 76] <- as.numeric(data[, 76])
attributes(data)$variable.labels[76] <- "[Supervision should be provided on a regular basis for at least 100 hours. Individual but preferably also group supervision should be applied. At least 50 hours of supervision should be conducted on an individual basis.] Do you think these recommendations have been implemented in your psychiatry training scheme, or any other in your country?"
data[, 76] <- factor(data[, 76], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[76] <- "q_0022_SQ008"

data[, 77] <- as.numeric(data[, 77])
attributes(data)$variable.labels[77] <- "[Training should be publicly funded.] Do you think these recommendations have been implemented in your psychiatry training scheme, or any other in your country?"
data[, 77] <- factor(data[, 77], levels=c(1,2,3),labels=c("Yes","No","Uncertain"))
names(data)[77] <- "q_0022_SQ009"

data[, 78] <- as.character(data[, 78])
attributes(data)$variable.labels[78] <- "Please do not hesitate to leave your comments or suggestions in the free form text field below. We are very grateful for your participation and wish all the success in your future career."
names(data)[78] <- "q_0023"

# Variable name was incorrect and was changed from 0000 to q_0000 .
# Variable name was incorrect and was changed from 0001 to q_0001 .
# Variable name was incorrect and was changed from 0002 to q_0002 .
# Variable name was incorrect and was changed from 0003 to q_0003 .
# Variable name was incorrect and was changed from 0004 to q_0004 .
# Variable name was incorrect and was changed from 0005_S05A1 to q_0005_S05A1 .
# Variable name was incorrect and was changed from 0005_S05A2 to q_0005_S05A2 .
# Variable name was incorrect and was changed from 0005_S05A3 to q_0005_S05A3 .
# Variable name was incorrect and was changed from 0005_S05A4 to q_0005_S05A4 .
# Variable name was incorrect and was changed from 0005_other to q_0005_other .
# Variable name was incorrect and was changed from 0006 to q_0006 .
# Variable name was incorrect and was changed from 0007 to q_0007 .
# Variable name was incorrect and was changed from 0008 to q_0008 .
# Variable name was incorrect and was changed from 0009_SQ1 to q_0009_SQ1 .
# Variable name was incorrect and was changed from 0009_SQ2 to q_0009_SQ2 .
# Variable name was incorrect and was changed from 0009_SQ3 to q_0009_SQ3 .
# Variable name was incorrect and was changed from 0009_SQ4 to q_0009_SQ4 .
# Variable name was incorrect and was changed from 0009_Ax to q_0009_Ax .
# Variable name was incorrect and was changed from 0009_other to q_0009_other .
# Variable name was incorrect and was changed from 0010 to q_0010 .
# Variable name was incorrect and was changed from 0011_SQ001 to q_0011_SQ001 .
# Variable name was incorrect and was changed from 0011_SQ002 to q_0011_SQ002 .
# Variable name was incorrect and was changed from 0011_SQ003 to q_0011_SQ003 .
# Variable name was incorrect and was changed from 0011_SQ004 to q_0011_SQ004 .
# Variable name was incorrect and was changed from 0012 to q_0012 .
# Variable name was incorrect and was changed from 0012_other to q_0012_other .
# Variable name was incorrect and was changed from 0013 to q_0013 .
# Variable name was incorrect and was changed from 0014_SQ001 to q_0014_SQ001 .
# Variable name was incorrect and was changed from 0014_SQ002 to q_0014_SQ002 .
# Variable name was incorrect and was changed from 0014_SQ003 to q_0014_SQ003 .
# Variable name was incorrect and was changed from 0014_SQ004 to q_0014_SQ004 .
# Variable name was incorrect and was changed from 0014_SQ005 to q_0014_SQ005 .
# Variable name was incorrect and was changed from 0015 to q_0015 .
# Variable name was incorrect and was changed from 0016_SQ001 to q_0016_SQ001 .
# Variable name was incorrect and was changed from 0016_SQ002 to q_0016_SQ002 .
# Variable name was incorrect and was changed from 0016_SQ003 to q_0016_SQ003 .
# Variable name was incorrect and was changed from 0016_SQ004 to q_0016_SQ004 .
# Variable name was incorrect and was changed from 0016_SQ005 to q_0016_SQ005 .
# Variable name was incorrect and was changed from 0016_SQ006 to q_0016_SQ006 .
# Variable name was incorrect and was changed from 0017 to q_0017 .
# Variable name was incorrect and was changed from 0018 to q_0018 .
# Variable name was incorrect and was changed from 0019_SQ001 to q_0019_SQ001 .
# Variable name was incorrect and was changed from 0019_SQ002 to q_0019_SQ002 .
# Variable name was incorrect and was changed from 0019_SQ003 to q_0019_SQ003 .
# Variable name was incorrect and was changed from 0021_SQ001 to q_0021_SQ001 .
# Variable name was incorrect and was changed from 0021_SQ002 to q_0021_SQ002 .
# Variable name was incorrect and was changed from 0021_SQ003 to q_0021_SQ003 .
# Variable name was incorrect and was changed from 0021_SQ004 to q_0021_SQ004 .
# Variable name was incorrect and was changed from 0021_SQ005 to q_0021_SQ005 .
# Variable name was incorrect and was changed from 0021_SQ006 to q_0021_SQ006 .
# Variable name was incorrect and was changed from 0021_SQ007 to q_0021_SQ007 .
# Variable name was incorrect and was changed from 0021_SQ008 to q_0021_SQ008 .
# Variable name was incorrect and was changed from 0021_SQ009 to q_0021_SQ009 .
# Variable name was incorrect and was changed from 0022_SQ001 to q_0022_SQ001 .
# Variable name was incorrect and was changed from 0022_SQ002 to q_0022_SQ002 .
# Variable name was incorrect and was changed from 0022_SQ003 to q_0022_SQ003 .
# Variable name was incorrect and was changed from 0022_SQ004 to q_0022_SQ004 .
# Variable name was incorrect and was changed from 0022_SQ005 to q_0022_SQ005 .
# Variable name was incorrect and was changed from 0022_SQ006 to q_0022_SQ006 .
# Variable name was incorrect and was changed from 0022_SQ007 to q_0022_SQ007 .
# Variable name was incorrect and was changed from 0022_SQ008 to q_0022_SQ008 .
# Variable name was incorrect and was changed from 0022_SQ009 to q_0022_SQ009 .
# Variable name was incorrect and was changed from 0023 to q_0023 .
