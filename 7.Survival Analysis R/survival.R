library('survival')
library('survminer')
data=read.csv("pancancerinfo.csv")
data
library("stringr")
data[,4]=str_replace_all(data[,4]," ","")
unique(data[,4])
fit=survfit(Surv(OS,Censor..alive.0..dead.1.)~Gender,data=data)
fit
ggsurvplot(fit,data=data)
ggsurvplot(fit,data=data,surv.median.line='hv')
ggsurvplot(fit,data=data,surv.median.line='hv',pval = T)
ggsurvplot(fit,data=data,surv.median.line='hv',pval = T,risk.table = T)


fit=survfit(Surv(OS,Censor..alive.0..dead.1.)~IDH_mutation_status,data=data)
fit
ggsurvplot(fit,data=data)
ggsurvplot(fit,data=data,surv.median.line='hv')
ggsurvplot(fit,data=data,surv.median.line='hv',pval = T)
ggsurvplot(fit,data=data,surv.median.line='hv',pval = T,risk.table = T)
fit=survfit(Surv(OS,Censor)~IDH_mutation_status+Gender,data=data)
