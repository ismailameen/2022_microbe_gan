######################### 2022 GAN DATA ANALYSIS MICROBIAL DATA ##################################3

#####IMPORTS######

library(magrittr)
library(ggplot2)



################################### Data Loading ################################################3

######real data######
real <- read.csv('Data Preprocessing/Microbe_gan_prep/pcbi.1007896.s002.csv')
real<- real[-1,] %>% as.data.frame()
names(real)[names(real) == 'X'] <- 'Time'


real_1<- read.csv('cut1')
real_1<- real_1[-c(1)] %>% as.data.frame()
real_1<- real_1[-1,] %>% as.data.frame()
names(real_1)[names(real_1) == 'X'] <- 'Time'


real_2<- read.csv('cut2')
real_2<- real_2[-c(1)] %>% as.data.frame()
real_2<- real_2[-1,] %>% as.data.frame()
names(real_2)[names(real_2) == 'X'] <- 'Time'

real_12<- read.csv('cut12')
real_12<- real_12[-c(1)] %>% as.data.frame()
real_12<- real_12[-1,] %>% as.data.frame()
names(real_12)[names(real_12) == 'X'] <- 'Time'

######Synthetic Data######

#first number:
  #1=> normal conditions
  #2=> only adversarial
  #3=> no adversarial

#second number:
  #1 => standard 
  #2 => real missing first inflection
  #3 => real missing second inflection
  #4 => real missing both inflections



###Standard###

#normal
stand_synth1_1<- read.csv('Microbe_synthetic_1_1')
stand_synth1_1<- stand_synth1_1[-c(1)] %>% as.data.frame()
stand_synth1_1$Time <- seq(0, length.out=nrow(stand_synth1_1), by = 1/6)
stand_synth1_1$MEAN <- apply(stand_synth1_1[,1:8],1,mean)
stand_synth1_1$rtime<- rev(stand_synth1_1$Time)

#only adversarial

stand_synth2_1<- read.csv('Microbe_synthetic_2_1')
stand_synth2_1<- stand_synth2_1[-c(1)] %>% as.data.frame()
stand_synth2_1$Time <- seq(0, length.out=nrow(stand_synth2_1), by = 1/6)
t<- t(stand_synth2_1) %>% as.data.frame()
stand_synth2_1<- rev(t) %>% t() %>% as.data.frame()
stand_synth2_1$MEAN <- apply(stand_synth2_1[,1:8],1,mean)
stand_synth2_1$rtime<- rev(stand_synth2_1$Time)
# No adversarial

stand_synth3_1<- read.csv('Microbe_synthetic_3_1')
stand_synth3_1<- stand_synth3_1[-c(1)] %>% as.data.frame()
stand_synth3_1$Time <- seq(0, length.out=nrow(stand_synth3_1), by = 1/6)
stand_synth3_1$MEAN <- apply(stand_synth3_1[,1:8],1,mean)
stand_synth3_1$rtime<- rev(stand_synth3_1$Time)

### Missing First Inflection ###

#normal
synth1_2<- read.csv('Microbe_synthetic_1_2')
synth1_2<- synth1_2[-c(1,2)] %>% as.data.frame()
synth1_2$Time<- seq(0, length.out=nrow(synth1_2), by = 1/6)
synth1_2$MEAN<- apply(synth1_2[,1:8],1,mean)
synth1_2$rtime<-rev(synth1_2$Time)

#only adversarial 

synth2_2<- read.csv('Microbe_synthetic_2_2')
synth2_2<- synth2_2[-c(1,2)] %>% as.data.frame()
synth2_2$Time<- seq(0, length.out=nrow(synth2_2), by = 1/6)
t<- t(synth2_2) %>% as.data.frame()
synth2_2<- rev(t) %>% t() %>% as.data.frame()
synth2_2$MEAN<- apply(synth2_2[,1:8],1,mean)
synth2_2$rtime<-rev(synth2_2$Time)

#no adversarial

synth3_2<- read.csv('Microbe_synthetic_3_2')
synth3_2<- synth3_2[-c(1,2)] %>% as.data.frame()
synth3_2$Time<- seq(0, length.out=nrow(synth3_2), by = 1/6)
synth3_2$MEAN<- apply(synth3_2[,1:8],1,mean)
synth3_2$rtime<-rev(synth3_2$Time)


### Missing second Inflection ###

#normal

synth1_3<- read.csv('Microbe_synthetic_1_3')
synth1_3<- synth1_3[-c(1,2)] %>% as.data.frame()
synth1_3$Time<- seq(0, length.out=nrow(synth1_3), by = 1/6)
synth1_3$MEAN<- apply(synth1_3[,1:8],1,mean)
synth1_3$rtime<-rev(synth1_3$Time)
#only adversarial

synth2_3<- read.csv('Microbe_synthetic_2_3')
synth2_3<- synth2_3[-c(1,2)] %>% as.data.frame()
synth2_3$Time<- seq(0, length.out=nrow(synth2_3), by = 1/6)
t<- t(synth2_3) %>% as.data.frame()
synth2_3<- rev(t) %>% t() %>% as.data.frame()
synth2_3$MEAN<- apply(synth2_3[,1:8],1,mean)
synth2_3$rtime<-rev(synth2_3$Time)

# no adversarial

synth3_3<- read.csv('Microbe_synthetic_3_3')
synth3_3<- synth3_3[-c(1,2)] %>% as.data.frame()
synth3_3$Time<- seq(0, length.out=nrow(synth3_3), by = 1/6)
synth3_3$MEAN<- apply(synth3_3[,1:8],1,mean)
synth3_3$rtime<-rev(synth3_3$Time)

### missing both inflections ###

#normal 

synth1_4<- read.csv('Microbe_synthetic_1_4')
synth1_4<- synth1_4[-c(1,2)] %>% as.data.frame()
synth1_4$Time<- seq(0, length.out=nrow(synth1_4), by = 1/6)
synth1_4$MEAN<- apply(synth1_4[,1:8],1,mean)
synth1_4$rtime<-rev(synth1_4$Time)
#only adversarial

synth2_4<- read.csv('Microbe_synthetic_2_4')
synth2_4<- synth2_4[-c(1,2)] %>% as.data.frame()
synth2_4$Time<- seq(0, length.out=nrow(synth2_4), by = 1/6)
t<- t(synth2_4) %>% as.data.frame()
synth2_4<- rev(t) %>% t() %>% as.data.frame()
synth2_4$MEAN<- apply(synth2_4[,1:8],1,mean)
synth2_4$rtime<-rev(synth2_4$Time)
#no adversarial

synth3_4<- read.csv('Microbe_synthetic_3_4')
synth3_4<-synth3_4[-c(1,2)] %>% as.data.frame()
synth3_4$Time<- seq(0, length.out=nrow(synth3_4), by = 1/6)
synth3_4$MEAN<- apply(synth3_4[,1:8],1,mean)
synth3_4$rtime<-rev(synth3_4$Time)

#######################################  PLOTTING ###############################################33

#### PreSmoothing #####


plot(real$Time, real$MEAN, col = 'blue')
points(stand_synth1_1$Time, stand_synth1_1$MEAN, col = 'red')
points(stand_synth2_1$rtime, stand_synth2_1$MEAN, col = 'green')
points(stand_synth3_1$Time, stand_synth3_1$MEAN, col = 'orange')
title(main = "Standard data Averaged over 8 replicates")


plot(real_1$Time, real_1$MEAN, col = 'blue')
points(synth1_2$Time, synth1_2$MEAN, col = 'red')
points(synth2_2$rtime,synth2_2$MEAN, col = 'green')
points(synth3_2$Time, synth3_2$MEAN, col = 'orange')
title(main = "cut1 data Averaged over 8 replicates")


plot(real_2$Time, real_2$MEAN, col = 'blue')
points(synth1_3$Time, synth1_3$MEAN, col = 'red')
points(synth2_3$rtime,synth2_3$MEAN, col = 'green')
points(synth3_3$Time, synth3_3$MEAN, col = 'orange')
title(main = "cut2 data Averaged over 8 replicates")

plot(real_12$Time, real_12$MEAN, col = 'blue')
points(synth1_4$Time, synth1_4$MEAN, col = 'red')
points(synth2_4$rtime,synth2_4$MEAN, col = 'green')
points(synth3_4$Time, synth3_4$MEAN, col = 'orange')
title(main = "cut12 data Averaged over 8 replicates")

#### Loess smoothing #####

#smoothing standard

smoo1_1<- loess(MEAN~Time, data = stand_synth1_1, span= 0.65)
stand_synth1_1$smooth<- predict(smoo1_1)

smoo2_1<- loess(MEAN~rtime, data = stand_synth2_1, span = 0.9)
stand_synth2_1$smooth<- predict(smoo2_1)

smoo3_1<- loess(MEAN~Time, data = stand_synth3_1, span = 0.01)
stand_synth3_1$smooth<- predict(smoo3_1)

#smoothing cut1

smoo1_2<- loess(MEAN~Time, data = synth1_2, span = 0.65)
synth1_2$smooth<- predict(smoo1_2)

smoo2_2<- loess(MEAN~rtime, data = synth2_2, span = 0.65)
synth2_2$smooth<- predict(smoo2_2)

smoo3_2<- loess(MEAN~Time, data = synth3_2, span = 0.01)
synth3_2$smooth<- predict(smoo3_2)

#smoothing cut2

smoo1_3<- loess(MEAN~Time, data = synth1_3, span = 0.65)
synth1_3$smooth<- predict(smoo1_3)

smoo2_3<- loess(MEAN~rtime, data = synth2_3, span = 0.65)
synth2_3$smooth<- predict(smoo2_3)

smoo3_3<- loess(MEAN~Time, data = synth3_3, span = 0.01)
synth3_3$smooth<- predict(smoo3_3)

#smoothing cut12

smoo1_4<- loess(MEAN~Time, data = synth1_4, span = 0.65)
synth1_4$smooth<- predict(smoo1_4)

smoo2_4<- loess(MEAN~rtime, data = synth2_4, span = 0.65)
synth2_4$smooth<- predict(smoo2_4)

smoo3_4<- loess(MEAN~Time, data = synth3_4, span = 0.01)
synth3_4$smooth<- predict(smoo3_4)


##### Post Smoothing Plots #####

plot(real$Time, real$MEAN, col = 'blue')
points(stand_synth1_1$Time, stand_synth1_1$smooth, col = 'red')
points(stand_synth2_1$rtime, stand_synth2_1$smooth, col = 'green')
points(stand_synth3_1$Time, stand_synth3_1$smooth, col = 'orange')
title(main = "Standard data Averaged over 8 replicates (smoothed)")

plot(real_1$Time, real_1$MEAN, col = 'blue')
points(synth1_2$Time, synth1_2$smooth, col = 'red')
points(synth2_2$rtime,synth2_2$smooth, col = 'green')
points(synth3_2$Time, synth3_2$smooth, col = 'orange')
title(main = "cut1 data Averaged over 8 replicates (smoothed)")

plot(real_2$Time, real_2$MEAN, col = 'blue')
points(synth1_3$Time, synth1_3$smooth, col = 'red')
points(synth2_3$rtime,synth2_3$smooth, col = 'green')
points(synth3_3$Time, synth3_3$smooth, col = 'orange')
title(main = "cut2 data Averaged over 8 replicates (smoothed)")

plot(real_12$Time, real_12$MEAN, col = 'blue')
points(synth1_4$Time, synth1_4$smooth, col = 'red')
points(synth2_4$rtime,synth2_4$smooth, col = 'green')
points(synth3_4$Time, synth3_4$smooth, col = 'orange')
title(main = "cut12 data Averaged over 8 replicates (smoothed)")



############################ Kullback Liebler ###############################################3
install.packages("philentropy")
library(philentropy)

####presmoothing####

#standard

#getting the KL for the cut real datasets: serves to normalize 


stand_synth1_1<- stand_synth1_1[-(429:543),]
s1_1<- stand_synth1_1$MEAN
r1_1<- real$MEAN %>% as.numeric()
X1_1<- rbind(s1_1, r1_1) 
kl1_1<- KL(X1_1, est.prob = 'empirical')

s2_1<- stand_synth2_1$MEAN
r2_1<- real$MEAN %>% as.numeric()
X2_1<- rbind(s2_1, r2_1) 
kl2_1<- KL(X2_1, est.prob = 'empirical')

stand_synth3_1<- stand_synth3_1[-(429:430),]
s3_1<- stand_synth3_1$MEAN
r3_1<- real$MEAN %>% as.numeric()
X3_1<- rbind(s3_1, r3_1) 
kl3_1<- KL(X3_1, est.prob = 'empirical')



#cut1

r_orig<- real$MEAN %>% as.data.frame()
r_orig<- r_orig[-c(393:428),] %>% as.numeric()
r_cut1<- real_1$MEAN %>% as.numeric()
X1<- rbind(r_cut1, r_orig)
kl1<- KL(X1, est.prob= 'empirical')


synth1_2<- synth1_2[-(392:473),]
s1_2<- synth1_2$MEAN
r1_2<- real$MEAN %>% as.numeric()
X1_2<- rbind(s1_2, r1_2)
kl1_2<- KL(X1_2, est.prob = 'empirical')

#synth2_2<- synth2_2[-(392:473),]
s2_2<- synth2_2$MEAN
r2_2<- real$MEAN %>% as.numeric()
X2_2<- rbind(s2_2, r2_2)
kl2_2<- KL(X2_2, est.prob = 'empirical')

synth3_2<- synth3_2[-(392:467),]
s3_2<- synth3_2$MEAN
r3_2<- real$MEAN %>% as.numeric()
X3_2<- rbind(s3_2, r3_2)
kl3_2<- KL(X3_2, est.prob = 'empirical')

#cut2

r_orig<- real$MEAN %>% as.data.frame()
r_orig<- r_orig[-c(405:428),] %>% as.numeric()
r_cut2<- real_2$MEAN %>% as.numeric()
X2<- rbind(r_cut1, r_orig)
kl2<- KL(X2, est.prob= 'empirical')


synth1_3<- synth1_3[-(404:465),]
s1_3<- synth1_3$MEAN
r1_3<- real$MEAN %>% as.numeric()
X1_3<- rbind(s1_3, r1_3)
kl1_3<- KL(X1_2, est.prob = 'empirical')

#synth2_2<- synth2_2[-(392:473),]
s2_3<- synth2_3$MEAN
r2_3<- real$MEAN %>% as.numeric()
X2_3<- rbind(s2_3, r2_3)
kl2_3<- KL(X2_3, est.prob = 'empirical')

synth3_3<- synth3_3[-(404:480),]
s3_3<- synth3_3$MEAN
r3_3<- real$MEAN %>% as.numeric()
X3_3<- rbind(s3_3, r3_3)
kl3_3<- KL(X3_3, est.prob = 'empirical')


#cut12

r_orig<- real$MEAN %>% as.data.frame()
r_orig<- r_orig[-c(367:428),] %>% as.numeric()
r_cut1<- cut1$MEAN %>% as.numeric()
X12<- rbind(r_cut1, r_orig)
kl12<- KL(X12, est.prob= 'empirical')


synth1_4<- synth1_4[-(367:465),]
s1_4<- synth1_4$MEAN
r1_4<- real$MEAN %>% as.numeric()
X1_4<- rbind(s1_4, r1_4)
kl1_4<- KL(X1_4, est.prob = 'empirical')


s2_4<- synth2_4$MEAN
r2_4<- realMEAN %>% as.numeric()
X2_4<- rbind(s2_4, r2_4)
kl2_4<- KL(X2_4, est.prob = 'empirical')

synth3_4<- synth3_4[-(367:445),]
s3_4<- synth3_4$MEAN
r3_4<- real$MEAN %>% as.numeric()
X3_4<- rbind(s3_4, r3_4)
kl3_4<- KL(X3_4, est.prob = 'empirical')

### organizing closeness by gan parameter

Standard<- c(kl1_1, kl1_2, kl1_3, kl1_4)
Adversarial<- c(kl2_1, kl2_2, kl2_3, kl2_4)
Non_Adversarial<-c(kl3_1, kl3_2, kl3_3, kl3_4)
cut_data<- c(0,kl1,kl2,kl12)

closeness_scores<- cbind(Standard, Adversarial, Non_Adversarial, cut_data) %>% as.data.frame()



#smaller value suggests greater closeness between distributions



#### Post smoothing ####

#standard
s1_1<- stand_synth1_1$smooth
r1_1<- real$MEAN %>% as.numeric()
X1_1<- rbind(s1_1, r1_1) 
kl1_1<- KL(X1_1, est.prob = 'empirical')

s2_1<- stand_synth2_1$smooth
r2_1<- real$MEAN %>% as.numeric()
X2_1<- rbind(s2_1, r2_1) 
kl2_1<- KL(X2_1, est.prob = 'empirical')


s3_1<- stand_synth3_1$smooth %>% abs()
r3_1<- real$MEAN %>% as.numeric()
X3_1<- rbind(s3_1, r3_1) 
kl3_1<- KL(X3_1, est.prob = 'empirical')


#cut 1


s1_2<- synth1_2$smooth
r1_2<- real$MEAN %>% as.numeric()
X1_2<- rbind(s1_2, r1_2)
kl1_2<- KL(X1_2, est.prob = 'empirical')


s2_2<- synth2_2$smooth
r2_2<- real$MEAN %>% as.numeric()
X2_2<- rbind(s2_2, r2_2)
kl2_2<- KL(X2_2, est.prob = 'empirical')

s3_2<- synth3_2$smooth %>% abs()
r3_2<- real$MEAN %>% as.numeric()
X3_2<- rbind(s3_2, r3_2)
kl3_2<- KL(X3_2, est.prob = 'empirical')

#cut 2


s1_3<- synth1_3$smooth
r1_3<- real$MEAN %>% as.numeric()
X1_3<- rbind(s1_3, r1_3)
kl1_3<- KL(X1_3, est.prob = 'empirical')


s2_3<- synth2_3$smooth
r2_3<- real$MEAN %>% as.numeric()
X2_3<- rbind(s2_3, r2_3)
kl2_3<- KL(X2_3, est.prob = 'empirical')


s3_3<- synth3_3$smooth %>% abs()
r3_3<- real$MEAN %>% as.numeric()
X3_3<- rbind(s3_3, r3_3)
kl3_3<- KL(X3_3, est.prob = 'empirical')



#cut12


s1_4<- synth1_4$smooth
r1_4<- real$MEAN %>% as.numeric()
X1_4<- rbind(s1_4, r1_4)
kl1_4<- KL(X1_4, est.prob = 'empirical')


s2_4<- synth2_4$smooth
r2_4<- real$MEAN %>% as.numeric()
X2_4<- rbind(s2_4, r2_4)
kl2_4<- KL(X2_4, est.prob = 'empirical')


s3_4<- synth3_4$smooth %>% abs()
r3_4<- real$MEAN %>% as.numeric()
X3_4<- rbind(s3_4, r3_4)
kl3_4<- KL(X3_4, est.prob = 'empirical')

Standard<- c(kl1_1, kl1_2, kl1_3, kl1_4)
Adversarial<- c(kl2_1, kl2_2, kl2_3, kl2_4)
Non_Adversarial<-c(kl3_1, kl3_2, kl3_3, kl3_4)
cut_data<- c(0, kl1,kl2,kl12)

closeness_scores_smooth<- cbind(Standard, Adversarial, Non_Adversarial, cut_data) %>% as.data.frame()


cut1<-read.csv('cut1')
cut2<-read.csv('cut2')
cut12<-read.csv('cut12')


### KL at inflection points...

#define inflection 1 at 67:103
#define inflection 2 at 127:151

r_in1<- real$MEAN[c(67:103)] %>% as.numeric()
r_in2<- real$MEAN[c(127:151)] %>% as.numeric()

#standard

s11_in1<- stand_synth1_1$MEAN[c(67:103)]
s21_in1<- stand_synth2_1$MEAN[c(67:103)]
s31_in1<- stand_synth3_1$MEAN[c(67:103)]


s11_in2<- stand_synth1_1$MEAN[c(127:151)]
s21_in2<- stand_synth2_1$MEAN[c(127:151)]
s31_in2<- stand_synth3_1$MEAN[c(127:151)]

X<- rbind(s11_in1, r_in1)
kl11_in1<- KL(X, est.prob = 'empirical')

X<- rbind(s21_in1, r_in1)
kl21_in1<- KL(X, est.prob = 'empirical')

X<- rbind(s31_in1, r_in1)
kl31_in1<- KL(X, est.prob = 'empirical')

X<- rbind(s11_in2, r_in2)
kl11_in2<- KL(X, est.prob = 'empirical')

X<- rbind(s21_in2, r_in2)
kl21_in2<- KL(X, est.prob = 'empirical')

X<- rbind(s31_in2, r_in2)
kl31_in2<- KL(X, est.prob = 'empirical')


# cut1

s12_in1<- synth1_2$MEAN[c(67:103)]
s22_in1<- synth2_2$MEAN[c(67:103)]
s32_in1<- synth3_2$MEAN[c(67:103)]


s12_in2<- synth1_2$MEAN[c(127:151)]
s22_in2<- synth2_2$MEAN[c(127:151)]
s32_in2<- synth3_2$MEAN[c(127:151)]

X<- rbind(s12_in1, r_in1)
kl12_in1<- KL(X, est.prob = 'empirical')

X<- rbind(s22_in1, r_in1)
kl22_in1<- KL(X, est.prob = 'empirical')

X<- rbind(s32_in1, r_in1)
kl32_in1<- KL(X, est.prob = 'empirical')

X<- rbind(s12_in2, r_in2)
kl12_in2<- KL(X, est.prob = 'empirical')

X<- rbind(s22_in2, r_in2)
kl22_in2<- KL(X, est.prob = 'empirical')

X<- rbind(s32_in2, r_in2)
kl32_in2<- KL(X, est.prob = 'empirical')

#cut 2

s13_in1<- synth1_3$MEAN[c(67:103)]
s23_in1<- synth2_3$MEAN[c(67:103)]
s33_in1<- synth3_3$MEAN[c(67:103)]

s13_in2<- synth1_3$MEAN[c(127:151)]
s23_in2<- synth2_3$MEAN[c(127:151)]
s33_in2<- synth3_3$MEAN[c(127:151)]

X<- rbind(s13_in1, r_in1)
kl13_in1<- KL(X, est.prob = 'empirical')

X<- rbind(s23_in1, r_in1)
kl23_in1<- KL(X, est.prob = 'empirical')

X<- rbind(s33_in1, r_in1)
kl33_in1<- KL(X, est.prob = 'empirical')

X<- rbind(s13_in2, r_in2)
kl13_in2<- KL(X, est.prob = 'empirical')

X<- rbind(s23_in2, r_in2)
kl23_in2<- KL(X, est.prob = 'empirical')

X<- rbind(s33_in2, r_in2)
kl33_in2<- KL(X, est.prob = 'empirical')

#cut 12

s14_in1<- synth1_4$MEAN[c(67:103)]
s24_in1<- synth2_4$MEAN[c(67:103)]
s34_in1<- synth3_4$MEAN[c(67:103)]

s14_in2<- synth1_4$MEAN[c(127:151)]
s24_in2<- synth2_4$MEAN[c(127:151)]
s34_in2<- synth3_4$MEAN[c(127:151)]

X<- rbind(s14_in1, r_in1)
kl14_in1<- KL(X, est.prob = 'empirical')

X<- rbind(s24_in1, r_in1)
kl24_in1<- KL(X, est.prob = 'empirical')

X<- rbind(s34_in1, r_in1)
kl34_in1<- KL(X, est.prob = 'empirical')


X<- rbind(s14_in2, r_in2)
kl14_in2<- KL(X, est.prob = 'empirical')

X<- rbind(s24_in2, r_in2)
kl24_in2<- KL(X, est.prob = 'empirical')

X<- rbind(s34_in2, r_in2)
kl34_in2<- KL(X, est.prob = 'empirical')


#Performance around inflection 1: col = algo, row = dataset

datasets<- c('Standard', 'Cut 1', 'Cut 2', 'Cut 1 & 2')

al1<- c(kl11_in1, kl12_in1, kl13_in1, kl14_in1)
al2<- c(kl21_in1, kl22_in1, kl23_in1, kl24_in1)
al3<- c(kl31_in1, kl32_in1, kl33_in1, kl34_in1)

closeness_scores_in1<- cbind(al1, al2, al3, datasets) %>% as.data.frame()



al1<- c(kl11_in2, kl12_in2, kl13_in2, kl14_in2)
al2<- c(kl21_in2, kl22_in2, kl23_in2, kl24_in2)
al3<- c(kl31_in2, kl32_in2, kl33_in2, kl34_in2)

closeness_scores_in2<- cbind(al1, al2, al3, datasets) %>% as.data.frame()





#Performance around infelction 2





#Final Plots

#STANDARD


plot(real$Time, real$MEAN, col = 'blue', xlab = 'Time (Hours)', ylab = 'Colony Size (Cells/mL)')
points(stand_synth1_1$Time, stand_synth1_1$MEAN, col = 'red')
points(stand_synth2_1$rtime, stand_synth2_1$MEAN, col = 'green')
points(stand_synth3_1$Time, stand_synth3_1$MEAN, col = 'orange')
legend('bottomright',title = 'GAN Algorithms',legend = c('Real', 'Algorithm 1', 
                                           'Algorithm 2', 'Algorithm 3'), 
       fill = c('blue', 'red', 'green', 'orange'), cex = 1)
title(main = "Standard data Averaged over 8 replicates")

plot(real$Time, real$MEAN, col = 'blue', xlab = 'Time (Hours)', ylab = 'Colony Size (Cells/mL)')
points(stand_synth1_1$Time, stand_synth1_1$smooth, col = 'red')
points(stand_synth2_1$rtime, stand_synth2_1$smooth, col = 'green')
points(stand_synth3_1$Time, stand_synth3_1$smooth, col = 'orange')
legend('bottomright',title = 'GAN Algorithms',legend = c('Real', 'Algorithm 1', 
                                                         'Algorithm 2', 'Algorithm 3'), 
       fill = c('blue', 'red', 'green', 'orange'), cex = 0.8)
title(main = "Standard data Averaged over 8 replicates (Smoothed)")

# CUT 1

plot(real_1$Time, real_1$MEAN, col = 'blue', xlab = 'Time (Hours)', ylab = 'Colony Size (Cells/mL)')
points(synth1_2$Time, synth1_2$MEAN, col = 'red')
points(synth2_2$rtime, synth2_2$MEAN, col = 'green')
points(synth3_2$Time, synth3_2$MEAN, col = 'orange')
legend('bottomright',title = 'GAN Algorithms',legend = c('Real', 'Algorithm 1', 
                                                         'Algorithm 2', 'Algorithm 3'), 
       fill = c('blue', 'red', 'green', 'orange'), cex = 1)
title(main = "Cut 1 data Averaged over 8 replicates")

plot(real_1$Time, real_1$MEAN, col = 'blue', xlab = 'Time (Hours)', ylab = 'Colony Size (Cells/mL)')
points(synth1_2$Time, synth1_2$smooth, col = 'red')
points(synth2_2$rtime, synth2_2$smooth, col = 'green')
points(synth3_2$Time, synth3_2$smooth, col = 'orange')
legend('bottomright',title = 'GAN Algorithms',legend = c('Real', 'Algorithm 1', 
                                                         'Algorithm 2', 'Algorithm 3'), 
       fill = c('blue', 'red', 'green', 'orange'), cex = 1)
title(main = "Cut 1 data Averaged over 8 replicates (Smoothed)")

# CUT 2
plot(real_2$Time, real_2$MEAN, col = 'blue', xlab = 'Time (Hours)', ylab = 'Colony Size (Cells/mL)')
points(synth1_3$Time, synth1_3$MEAN, col = 'red')
points(synth2_3$rtime, synth2_3$MEAN, col = 'green')
points(synth3_3$Time, synth3_3$MEAN, col = 'orange')
legend('bottomright',title = 'GAN Algorithms',legend = c('Real', 'Algorithm 1', 
                                                         'Algorithm 2', 'Algorithm 3'), 
       fill = c('blue', 'red', 'green', 'orange'), cex = 1)
title(main = "Cut 2 data Averaged over 8 replicates")

plot(real_2$Time, real_2$MEAN, col = 'blue', xlab = 'Time (Hours)', ylab = 'Colony Size (Cells/mL)')
points(synth1_3$Time, synth1_3$smooth, col = 'red')
points(synth2_3$rtime, synth2_3$smooth, col = 'green')
points(synth3_3$Time, synth3_3$smooth, col = 'orange')
legend('bottomright',title = 'GAN Algorithms',legend = c('Real', 'Algorithm 1', 
                                                         'Algorithm 2', 'Algorithm 3'), 
       fill = c('blue', 'red', 'green', 'orange'), cex = 1)
title(main = "Cut 2 data Averaged over 8 replicates (Smoothed)")

# CUT 12

plot(real_12$Time, real_12$MEAN, col = 'blue', xlab = 'Time (Hours)', ylab = 'Colony Size (Cells/mL)')
points(synth1_4$Time, synth1_4$MEAN, col = 'red')
points(synth2_4$rtime, synth2_4$MEAN, col = 'green')
points(synth3_4$Time, synth3_4$MEAN, col = 'orange')
legend('bottomright',title = 'GAN Algorithms',legend = c('Real', 'Algorithm 1', 
                                                         'Algorithm 2', 'Algorithm 3'), 
       fill = c('blue', 'red', 'green', 'orange'), cex = 1)
title(main = "Cut 1 & 2 data Averaged over 8 replicates")

plot(real_12$Time, real_12$MEAN, col = 'blue', xlab = 'Time (Hours)', ylab = 'Colony Size (Cells/mL)')
points(synth1_4$Time, synth1_4$smooth, col = 'red')
points(synth2_4$rtime, synth2_4$smooth, col = 'green')
points(synth3_4$Time, synth3_4$smooth, col = 'orange')
legend('bottomright',title = 'GAN Algorithms',legend = c('Real', 'Algorithm 1', 
                                                         'Algorithm 2', 'Algorithm 3'), 
       fill = c('blue', 'red', 'green', 'orange'), cex = 1)
title(main = "Cut 1 & 2 data Averaged over 8 replicates (Smoothed)")




####antics

stand_synth2_1$Time<- rev(stand_synth2_1$Time)

plot(stand_synth2_1$Time, stand_synth2_1$MEAN, col = 'green')
points(real$Time, real$MEAN)


