#Import the required libraries
library('survival')
library('survminer')
library('tidyr')
data(gbsg)

#survival probability with menopausal status
fit=survfit(Surv(gbsg$rfstime,gbsg$status) ~ meno,data = gbsg)
fit
ggsurvplot(fit,data=gbsg,legend.title="menopausal status",
           legend.labs=c("premenopausal","postmenopausal"))
ggsurvplot(fit,data=gbsg,surv.median.line='hv',
           legend.title="menopausal status",legend.labs=c("premenopausal","postmenopausal"))
ggsurvplot(fit,data=gbsg,surv.median.line='hv',pval = T,
           legend.title="menopausal status",legend.labs=c("premenopausal","postmenopausal"))
ggsurvplot(fit,data=gbsg,surv.median.line='hv',pval = T,risk.table = T,
           legend.title="menopausal status",legend.labs=c("premenopausal","postmenopausal"))

#survival probabilty with different age group
#making a categorical interval for age column
gbsg["age_group"] = cut(gbsg$age, c(20,40,60,80), c(1,2,3), include.lowest=TRUE)


fit=survfit(Surv(gbsg$rfstime/365,gbsg$status) ~ age_group,data = gbsg)
fit
ggsurvplot(fit,data=gbsg,legend.title = "Age Group",
           legend.labs = c("20-40", "40-60","60-80"))

ggsurvplot(fit,data=gbsg,surv.median.line='hv')
ggsurvplot(fit,data=gbsg,surv.median.line='hv',pval = T,
           legend.title = "Age Group",
           legend.labs = c("20-40", "40-60","60-80"))
ggsurvplot(fit,data=gbsg,surv.median.line='hv',pval = T,risk.table = T,
           legend.title = "Age Group",
           legend.labs = c("20-40", "40-60","60-80"))

#survival probabilty with tumor size (mm)
gbsg["tumor_class"] = cut(gbsg$size, c(0,20,50,120), c(1,2,3), include.lowest=TRUE)
fit=survfit(Surv(gbsg$rfstime/365,gbsg$status) ~ tumor_class,data = gbsg)
fit
ggsurvplot(fit,data=gbsg,legend.title = "Tumor Class",
           legend.labs = c("T1", "T2","T3"))

ggsurvplot(fit,data=gbsg,surv.median.line='hv')
ggsurvplot(fit,data=gbsg,surv.median.line='hv',pval = T,
           egend.title = "Tumor Class",
           legend.labs = c("T1", "T2","T3"))
ggsurvplot(fit,data=gbsg,surv.median.line='hv',pval = T,risk.table = T,
           egend.title = "Tumor Class",
           legend.labs = c("T1", "T2","T3"))


#survival probabilty with no. of positive lymph nodes
gbsg["nodes_class"] = cut(gbsg$nodes, c(1,4,10,51), c(1,2,3), include.lowest=TRUE)
fit=survfit(Surv(gbsg$rfstime/365,gbsg$status) ~ nodes_class,data = gbsg)
fit
ggsurvplot(fit,data=gbsg,legend.title = "Nodes Class",
           legend.labs = c("N1", "N2","N3"))

ggsurvplot(fit,data=gbsg,surv.median.line='hv')
ggsurvplot(fit,data=gbsg,surv.median.line='hv',pval = T,
           legend.title = "Nodes Class",
           legend.labs = c("N1", "N2","N3"))
ggsurvplot(fit,data=gbsg,surv.median.line='hv',pval = T,risk.table = T,
           legend.title = "Nodes Class",
           legend.labs = c("N1", "N2","N3"))

#survival analaysis with stage
fit=survfit(Surv(gbsg$rfstime/365,gbsg$status) ~ tumor_class+nodes_class,data = gbsg)
fit
ggsurvplot(fit,data=gbsg)
