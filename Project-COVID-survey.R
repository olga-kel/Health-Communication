###### install and load required packages 

install.packages("openxlsx")
install.packages("ggplot2")
install.packages("scales")
install.packages("plyr")
install.packages("lessR")
install.packages("ggrepel")
install.packages("MASS")
install.packages("dplyr")
install.packages("sjPlot")
library(openxlsx)
library(ggplot2)
library(scales)
library(plyr)
library(lessR)
library(ggrepel)
library(MASS)
library(dplyr)
library(sjPlot)


###### read in the data set: replace the path with your location of the file "peru_neu_1.xlsx"
peru <- read.xlsx("C:/Users/peru_neu_1.xlsx")

###### transform the categories to be factors
peru$School_cat <- as.factor(ifelse(peru$School_cat == 0, '0',
                                    ifelse(peru$School_cat == 1, '1', 
                                           ifelse(peru$School_cat == 2, '2', 
                                                  ifelse(peru$School_cat == 3, '3',
                                                         ifelse(peru$School_cat == 4, '4',
                                                                ifelse(peru$School_cat == 5 , '5', '-')))))))

###### calculate the shares of correct and incorrect answers to question 22
count(subset(peru,q22==1)$q22)
129/144

count(subset(peru,q22==0)$q22)
14/144

###### perform logit-regression for different model specifications with "q22" being the dependent variable
bm1 <- glm(q22 ~ Lang,
           family = binomial(link = "logit"),
           data = peru_neu, na.action = na.exclude)
summary(bm1)

bm2 <- glm(q22 ~ Gender + Age + Lang,
           family = binomial(link = "logit"),
           data = peru_neu, na.action = na.exclude)
summary(bm2)

bm3 <- glm(q22 ~ Gender + Age + Lang + Profession,
           family = binomial(link = "logit"),
           data = peru_neu, na.action = na.exclude)
summary(bm3)

q22model1 <- glm(q22 ~ TV + Family + Health.Centers + Central.Government + Local.Government + Social.Media + Internet + Friends + Community.Announcements + Radio + Everything + Others + Nothing,
                 family = binomial(link = "logit"),
                 data = peru, na.action = na.exclude)
summary(q22model1)

###### examine the correlation 
cor(peru$Local.Government, peru$Central.Government)

###### an additional model specification 
q22model2 <- glm(q22 ~ TV + Family + Health.Centers + Central.Government + Local.Government + Social.Media + Internet + Friends + Community.Announcements + Radio + Everything + Others + Nothing + Gender + Age_cat + Profession + School_cat + Main_lang,
                 family = binomial(link = "logit"),
                 data = peru, na.action = na.exclude)
summary(q22model2)

####### plot the results 
count(peru$q22[peru$q22 == 1])

count(peru$TV[peru$TV == 1])/144
count(subset(peru,q22==1 & TV == 1)$q22)/144

0.4861/0.5208

###### store the results for "TV" and "q22" in a data frame
q22TV <- data.frame(
  TV=c(1,0),
  value=c(0.9334, 0.0666),
  Answer = c("Right", "Wrong")
)

####### plot the results in a piechart
ggplot(q22TV, aes(x="", y=value, fill=Answer))+
  geom_bar(width = 1, stat = "identity")+
  coord_polar("y", start=0)+ 
  blank_theme + 
  theme(axis.text.x=element_blank()) +
  geom_text(aes(y = value/3 + c(0, cumsum(value)[-length(value)]), 
                label = percent(value)),colour = "black", size=5) +
  ggtitle("TV compared to answer") + 
  theme(plot.title = element_text(hjust = 0.5))
  


###### calculate the share of correct and incorrect answers to question 23
count(subset(peru,q213==1)$q213)
116/144

count(subset(peru,q213==0)$q213)
28/144

###### different model specifications for "q23" as dependent variable 
q213model1 <- glm(q213 ~ TV + Family + Health.Centers + Central.Government + Local.Government + Social.Media + Internet + Friends + Community.Announcements + Radio + Everything + Others + Nothing + Gender + Age_cat + Profession + School_cat + Main_lang,
                 family = binomial(link = "logit"),
                 data = peru, na.action = na.exclude)
summary(q213model1)

q213model2 <- glm(q213 ~ TV + Family + Health.Centers + Central.Government + Local.Government + Social.Media + Internet + Friends + Community.Announcements + Radio + Everything + Others + Nothing,
                  family = binomial(link = "logit"),
                  data = peru, na.action = na.exclude)
summary(q213model2)


###### model specification with correct answers being the dependent variable
ra <- polr(as.factor(right.answers) ~ Gender + Age + Profession , data = peru)
summary(ra)

###### correlation 
cor(peru_f_2$q25, peru_f_2$School_cat)

###### filter data set
peru_f <- filter(peru, q25 != 2)
peru_f_2 <- filter(peru_f,  School_cat != "?")

###### plot
plot( x = peru_f_2$q25, y = peru_f_2$School_cat, xaxt="n", xlab="q2.5", ylab = "level of education")
axis(1, c(0,1))

###### model specification with "q211" being the dependent variable
q211 <- polr(as.factor(q211) ~ Gender + Age, data = peru)
summary(q211)

###### change the name of column to Social Media
names(peru)[names(peru) == "Redes.de.comunicación.social.(Facebook,.Twitter,.Messenger,.Telegram,.WhatsApp)" ] <- "Social Media"

###### model specifications with "TV" being the dependent variable 
tvmodel1 <- glm(TV ~ Age_cat + Gender + School_cat + Profession + Main_lang,
                    family = binomial(link = "logit"), 
                    data = peru, 
                    na.action = na.exclude)
summary(tvmodel1)

tvmodel2 <- glm(TV ~ Age_cat + Main_lang,
               family = binomial(link = "logit"), 
               data = peru, 
               na.action = na.exclude)
summary(tvmodel2)

###### model specifications with "family" being the dependent variable 
familymodel1 <- glm(Family ~ Age_cat + Gender + School_cat + Profession + Main_lang,
                family = binomial(link = "logit"), 
                data = peru, 
                na.action = na.exclude)
summary(familymodel1)

familymodel2 <- glm(Family ~ Age_cat + Gender,
                family = binomial(link = "logit"), 
                data = peru, 
                na.action = na.exclude)
summary(familymodel2)

###### model specifications with "social media" being the dependent variable 
smmodel1 <- glm(Social.Media ~ Age_cat + Gender + School_cat + Profession + Main_lang,
                    family = binomial(link = "logit"), 
                    data = peru, 
                    na.action = na.exclude)

summary(smmodel1)

###### plot the results
plot_model(smmodel1, sort.est = TRUE, vline.color = "red")

###### transform the column "Main_lang" to binary values 
peru$Main_lang_b <- peru$Main_lang
peru$Main_lang_b[peru$Main_lang_b=="Spanish"] <- 1
peru$Main_lang_b[peru$Main_lang_b=="Quechua"] <- 0

###### calculate the probability to use social media (1): 
sum(subset(peru,Social.Media==1 & Main_lang == "Spanish")$Social.Media)/144
sum(subset(peru,Social.Media==1 & Main_lang == "Quechua")$Social.Media)/144

###### calculate the probability to not use social media (0):
count(subset(peru,Social.Media==0 & Main_lang == "Spanish")$Social.Media)/144
count(subset(peru,Social.Media==0 & Main_lang == "Quechua")$Social.Media)/144

 
110/144

0.2361/0.7639

0.3091 * exp(2.7836)

###### correlation between social media and internet
cor(peru$Social.Media, peru$Internet)

###### sum up the social media use per age group
SMA <- sum(subset(peru, Age_cat == "A")$Social.Media)
SMB <- sum(subset(peru, Age_cat == "B")$Social.Media)
SMC <- sum(subset(peru, Age_cat == "C")$Social.Media)
SMD <- sum(subset(peru, Age_cat == "D")$Social.Media)
SM <- SMA + SMB + SMC + SMD

###### store results in a data frame 
Dframesm <- data.frame(Age=c("25","25-34","35-50","50"), SM=c(SMA, SMB, SMC, SMD), SMp = c(SMA/SM, SMB/SM, SMC/SM, SMD/SM))

###### plot results for social media use
ggplot(Dframesm, aes(x=Age, y=SMp)) +
  geom_col(size=5, fill = 2) + 
  scale_x_discrete(labels=c("<25","25-34","35-50",">50")) + 
  scale_y_continuous(labels = percent_format()) + 
  ylab("Percent of social media users") + 
  xlab("Age") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))

###### different model specifications "for central government" as dependent variable
cgmodel1 <- glm(Central.Government ~ Age_cat + Gender + School_cat + Profession + Main_lang,
                family = binomial(link = "logit"), 
                data = peru, 
                na.action = na.exclude)
summary(cgmodel1)

cgmodel2 <- glm(Central.Government ~ Age_cat + School_cat + Main_lang,
                family = binomial(link = "logit"), 
                data = peru, 
                na.action = na.exclude)
summary(cgmodel2)

###### calculate probability to use central government (1): 
sum(subset(peru,Central.Government==1 & Main_lang == "Spanish")$Social.Media)/144
sum(subset(peru,Social.Media==1 & Main_lang == "Quechua")$Social.Media)/144

###### calculate probability to not use central government (0):
count(subset(peru,Social.Media==0 & Main_lang == "Spanish")$Social.Media)/144
count(subset(peru,Social.Media==0 & Main_lang == "Quechua")$Social.Media)/144

###### sum up the central government use per age group
CGS <- sum(subset(peru, Main_lang == "Spanish")$Central.Government)
CGQ <- sum(subset(peru, Main_lang == "Quechua")$Central.Government)
CG <- CGS + CGQ

###### store results in a data frame 
Dframecg <- data.frame(Main_lang=c("Spanish","Quechua"), CG=c(CGS, CGQ), CGp = c(CGS/CG, CGQ/CG))

###### plot results for central government use
ggplot(Dframecg, aes(x=Main_lang, y=CGp, fill = Main_lang)) +
  geom_col(size=5) +
  xlab("Main language") + 
  ylab("Percent of Central Government") +
  scale_y_continuous(labels = percent_format()) + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black")) + 
  guides(fill=guide_legend(title="Main language"))

###### model specification for "health centers" as dependent variable 
hcmodel1 <- glm(Health.Centers ~ Age_cat + Gender + School_cat + Profession + Main_lang,
                            family = binomial(link = "logit"), 
                            data = peru, 
                            na.action = na.exclude)
summary(hcmodel1)

###### model specification for "friends" as dependent variable
friendsmodel1 <- glm(Friends ~ Age_cat + Gender + School_cat + Profession + Main_lang,
                     family = binomial(link = "logit"), 
                     data = peru, 
                     na.action = na.exclude)

summary(friendsmodel1)

###### model specification for "community announcement" as dependent variable
camodel1 <- glm(Community.Announcements ~ Age_cat + Gender + School_cat + Profession + Main_lang,
                family = binomial(link = "logit"), 
                data = peru, 
                na.action = na.exclude)

summary(camodel1)

###### model specification for "radio" as dependent variable
radiomodel1 <- glm(Radio ~ Age_cat + Gender + School_cat + Profession + Main_lang,
                family = binomial(link = "logit"), 
                data = peru, 
                na.action = na.exclude)

summary(radiomodel1)

###### model specification for "everything" as dependent variable
everythingmodel1 <- glm(Everything ~ Age_cat + Gender + School_cat + Profession + Main_lang,
                   family = binomial(link = "logit"), 
                   data = peru, 
                   na.action = na.exclude)

summary(everythingmodel1)
