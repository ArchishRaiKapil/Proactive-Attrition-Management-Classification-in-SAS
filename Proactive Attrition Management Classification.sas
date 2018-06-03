/* Libname Statement */
libname d '/folders/myfolders/MEGA Case/Logistic/v2 (FINAL)';

/* Adding Raw Dataset */
proc import
datafile='/folders/myfolders/MEGA Case/Logistic/v2/Proactive Attrition Management.csv'
out=d.Raw_File
dbms=csv
replace;
getnames=yes;

/* Adding Label */
data d.Logistic_step_1;
set d.raw_file;
label
revenue="Mean monthly revenue"
mou="Mean monthly minutes of use"
recchrge="Mean total recumng charge"
directas="Mean number of director assisted calls"
overage="Mean overage minutes of use"
roam="Mean number of roaming calls"
changem="% Change in minutes of use"
changer="% Change in revenues"
dropvce="Mean number of dropped voice calls"
blckvce="Mean number of blocked voice calls"
unansvce="Mean number of unanswered voice calls"
custcare="Mean number of customer care calls"
threeway="Mean number of threeway calls"
mourec="Mean unrounded mou received voice calls"
outcalls="Mean number of outbound voice calls"
incalls="Mean number of inbound voice calls"
peakvce="Mean number of in and out peak voice calls"
opeakvce="Mean number of in and out off-peak voice calls"
dropblk="Mean number of dropped or blocked calls"
callfwdv="Mean number of call forwarding calls"
callwait="Mean number of call waiting calls"
churn="Chum between 31-60 days after obs date"
months="Months in Service"
uniqsubs="Number of Uniq Subs"
actvsubs="Number of Active Subs"
csa="Communications Service Area"
phones="# Handsets Issued"
models="# Models Issued"
eqpdays="Number of days of the current equipment"
customer="Customer ID"
age1="Age of first HH member"
age2="Age of second HH member"
children="Presence of children in HH"
credita="Highest credit rating - a"
creditaa="High credit rating - aa"
creditb="Good credit rating - b"
creditc="Medium credit rating - c "
creditde="Lowcreditrating-de"
creditgy="Very low credit rating - gy "
creditz="Lowest credit ratig - z "
pnzmrur="Pnzm code is rural"
pnzmub="Pnzm code is suburban"
pnzmtwn="Pnzm code is town"
refurb="Handset is refurbished "
webcap="Hanset is web capable "
truck="Subscriber owns a truck"
rv="Subscriber owns a recreational vehide "
occprof="Occupation - professional "
occcler="Occupation - derical "
occcrft="Occupation - crafts "
occstud="Occupation - student "
occhmkr="Occupation - homemaker "
OCC ret="Occupation - retired "
occself="Occupation - self-employed "
ownrent="Home ownership is missing"
marryun="Marital status unknown"
marryyes="Married"
marryno="Not Mamed"
mailord="Buys via mail order"
mailres="Responds to mál offers "
mailfiag="Has chosen not to be solicited by mail "
travel="Has traveled to non-US country "
COWfl="Owns a personal computer "
creditcd="Possesses a crecht cad "
retcalls="Number of calls previously made to retention team "
retaccpt="Number of previous retention offers accepted "
newcelly="Known to be a new cell phone user "
newcelln="Known not to be a new cell phone user "
refer="Number of referrals made by subscriber "
incmiss="Income data is messing"
income="Income (0>missing) "
mcycle="Owns a motorcyde"
creditad="Number of adjustments made to customer credit rating (up or down) "
setprcm="Missing data on handset price "
setprc="Handset pnce (O>missing)"
retcal I="Customer has made made call to retention team "
calibrat="Calibration sample =1; Validation sample =0; "
chumdep="Churn (missing for vahdation sample) "
PRIZMRUR="label not availabe"
PRIZMUB="label not availabe"
PRIZMTWN="label not availabe"
OCCRET="label not availabe"
MAILFLAG="label not availabe"
PCOWN="label not availabe"
RETCALL="label not availabe"
;
run;



/****** capping outlier ***/
data d.Logistic_step_2;
set d.Logistic_step_1;
IF REVENUE<33.64 THEN REVENUE=33.64;
IF MOU<158.25 THEN MOU=158.25;
IF RECCHRGE<30 THEN RECCHRGE=30;
IF CHANGEM<-83 THEN CHANGEM=-83;
IF CHANGER<-7.11 THEN CHANGER=-7.11;
IF DROPVCE<0.67 THEN DROPVCE=0.67;
IF UNANSVCE<5.33 THEN UNANSVCE=5.33;
IF MOUREC<8.43 THEN MOUREC=8.43;
IF OUTCALLS<3.33 THEN OUTCALLS=3.33;
IF PEAKVCE<23 THEN PEAKVCE=23;
IF OPEAKVCE<11 THEN OPEAKVCE=11;
IF DROPBLK<1.67 THEN DROPBLK=1.67;
IF MONTHS<11 THEN MONTHS=11;
IF EQPDAYS<204 THEN EQPDAYS=204;
IF INCOME<1 THEN INCOME=1;
IF REVENUE>135.39 THEN REVENUE=135.39;
IF MOU>1580.25 THEN MOU=1580.25;
IF RECCHRGE>85 THEN RECCHRGE=85;
IF DIRECTAS>4.21 THEN DIRECTAS=4.21;
IF OVERAGE>190.375 THEN OVERAGE=190.375;
IF ROAM>5.09 THEN ROAM=5.09;
IF CHANGEM>345.25 THEN CHANGEM=345.25;
IF CHANGER>46.218 THEN CHANGER=46.218;
IF DROPVCE>22 THEN DROPVCE=22;
IF BLCKVCE>17.33 THEN BLCKVCE=17.33;
IF UNANSVCE>97.67 THEN UNANSVCE=97.67;
IF CUSTCARE>9.33 THEN CUSTCARE=9.33;
IF THREEWAY>1.33 THEN THREEWAY=1.33;
IF MOUREC>440.938 THEN MOUREC=440.938;
IF OUTCALLS>90.33 THEN OUTCALLS=90.33;
IF INCALLS>35.67 THEN INCALLS=35.67;
IF PEAKVCE>279.67 THEN PEAKVCE=279.67;
IF OPEAKVCE>242 THEN OPEAKVCE=242;
IF DROPBLK>35.33 THEN DROPBLK=35.33;
IF CALLFWDV>0 THEN CALLFWDV=0;
IF CALLWAIT>8.67 THEN CALLWAIT=8.67;
IF MONTHS>37 THEN MONTHS=37;
IF UNIQSUBS>3 THEN UNIQSUBS=3;
IF ACTVSUBS>2 THEN ACTVSUBS=2;
IF PHONES>4 THEN PHONES=4;
IF MODELS>3 THEN MODELS=3;
IF EQPDAYS>865.75 THEN EQPDAYS=865.75;
IF AGE1>62 THEN AGE1=62;
IF AGE2>62 THEN AGE2=62;
IF REFER>0 THEN REFER=0;
IF CREDITAD>0 THEN CREDITAD=0;
IF SETPRC>149.99 THEN SETPRC=149.99;
IF INCOME>9 THEN INCOME=9;
run;

proc means data=d.logistic_step_2;
var
REVENUE
MOU
RECCHRGE
DIRECTAS
OVERAGE
ROAM
CHANGEM
CHANGER
DROPVCE
BLCKVCE
UNANSVCE
CUSTCARE
THREEWAY
MOUREC
OUTCALLS
INCALLS
PEAKVCE
OPEAKVCE
DROPBLK
CALLFWDV
CALLWAIT
MONTHS
UNIQSUBS
ACTVSUBS
PHONES
MODELS
EQPDAYS
AGE1
AGE2
REFER
CREDITAD
SETPRC
INCOME;
run;



/**** missing value imputation for categorical****/
data d.Logistic_step_3;
set d.Logistic_step_2;
IF CHILDREN=. then CHILDREN=0;
IF CREDITA=. then CREDITA=0;
IF CREDITAA=. then CREDITAA=0;
IF CREDITB=. then CREDITB=0;
IF CREDITC=. then CREDITC=0;
IF CREDITDE=. then CREDITDE=0;
IF CREDITGY=. then CREDITGY=0;
IF CREDITZ=. then CREDITZ=0;
IF PRIZMRUR=. then PRIZMRUR=0;
IF PRIZMUB=. then PRIZMUB=0;
IF PRIZMTWN=. then PRIZMTWN=0;
IF REFURB=. then REFURB=0;
IF WEBCAP=. then WEBCAP=1;
IF TRUCK=. then TRUCK=0;
IF RV=. then RV=0;
IF OCCPROF=. then OCCPROF=0;
IF OCCCLER=. then OCCCLER=0;
IF OCCCRFT=. then OCCCRFT=0;
IF OCCSTUD=. then OCCSTUD=0;
IF OCCHMKR=. then OCCHMKR=0;
IF OCCRET=. then OCCRET=0;
IF OCCSELF=. then OCCSELF=0;
IF OWNRENT=. then OWNRENT=0;
IF MARRYUN=. then MARRYUN=0;
IF MARRYYES=. then MARRYYES=0;
IF MARRYNO=. then MARRYNO=0;
IF MAILORD=. then MAILORD=0;
IF MAILRES=. then MAILRES=0;
IF MAILFLAG=. then MAILFLAG=0;
IF TRAVEL=. then TRAVEL=0;
IF PCOWN=. then PCOWN=0;
IF CREDITCD=. then CREDITCD=1;
IF RETCALLS=. then RETCALLS=0;
IF RETACCPT=. then RETACCPT=0;
IF NEWCELLY=. then NEWCELLY=0;
IF NEWCELLN=. then NEWCELLN=0;
IF MCYCLE=. then MCYCLE=0;
IF SETPRCM=. then SETPRCM=1;
IF RETCALL=. then RETCALL=0;
run;

/* Finding Mode and Mean Values for missing value imputation*/
proc means data=d.Logistic_step_3;
var
REVENUE
MOU
RECCHRGE
DIRECTAS
OVERAGE
ROAM
CHANGEM
CHANGER
DROPVCE
BLCKVCE
UNANSVCE
CUSTCARE
THREEWAY
MOUREC
OUTCALLS
INCALLS
PEAKVCE
OPEAKVCE
DROPBLK
CALLFWDV
CALLWAIT
MONTHS
UNIQSUBS
ACTVSUBS
PHONES
MODELS
EQPDAYS
AGE1
AGE2
REFER
CREDITAD
SETPRC
INCOME
;
run;

proc univariate data=d.Logistic_step_3;
var
CHILDREN
CREDITA
CREDITAA
CREDITB
CREDITC
CREDITDE
CREDITGY
CREDITZ
PRIZMRUR
PRIZMUB
PRIZMTWN
REFURB
WEBCAP
TRUCK
RV
OCCPROF
OCCCLER
OCCCRFT
OCCSTUD
OCCHMKR
OCCRET
OCCSELF
OWNRENT
MARRYUN
MARRYYES
MARRYNO
MAILORD
MAILRES
MAILFLAG
TRAVEL
PCOWN
CREDITCD
RETCALLS
RETACCPT
NEWCELLY
NEWCELLN
MCYCLE
SETPRCM
RETCALL
;
run;

/**** missing value imputation for continious vaiables****/
data d.Logistic_step_3;
set d.Logistic_step_3;
IF REVENUE=. THEN REVENUE=57.9657479;
IF MOU=. THEN MOU=519.0494133;
IF RECCHRGE=. THEN RECCHRGE=47.6665117;
IF DIRECTAS=. THEN DIRECTAS=0.7135794;
IF OVERAGE=. THEN OVERAGE=31.9998265;
IF ROAM=. THEN ROAM=0.5624138;
IF CHANGEM=. THEN CHANGEM=23.7955914;
IF CHANGER=. THEN CHANGER=2.7746187;
IF DROPVCE=. THEN DROPVCE=5.4726855;
IF BLCKVCE=. THEN BLCKVCE=3.0565275;
IF UNANSVCE=. THEN UNANSVCE=26.5413711;
IF CUSTCARE=. THEN CUSTCARE=1.4530721;
IF THREEWAY=. THEN THREEWAY=0.1925432;
IF MOUREC=. THEN MOUREC=106.1318788;
IF OUTCALLS=. THEN OUTCALLS=23.6603227;
IF INCALLS=. THEN INCALLS=6.8147366;
IF PEAKVCE=. THEN PEAKVCE=87.3940152;
IF OPEAKVCE=. THEN OPEAKVCE=63.3955969;
IF DROPBLK=. THEN DROPBLK=9.2285203;
IF CALLFWDV=. THEN CALLFWDV=0;
IF CALLWAIT=. THEN CALLWAIT=1.3419432;
IF MONTHS=. THEN MONTHS=18.9539882;
IF UNIQSUBS=. THEN UNIQSUBS=1.4701395;
IF ACTVSUBS=. THEN ACTVSUBS=1.2865709;
IF PHONES=. THEN PHONES=1.7090054;
IF MODELS=. THEN MODELS=1.4980857;
IF EQPDAYS=. THEN EQPDAYS=394.6701444;
IF AGE1=. THEN AGE1=30.9942553;
IF AGE2=. THEN AGE2=20.7568729;
IF REFER=. THEN REFER=0;
IF CREDITAD=. THEN CREDITAD=0;
IF SETPRC=. THEN SETPRC=34.1835971;
IF INCOME=. THEN INCOME=4.5840641;
IF CHILDREN=. THEN CHILDREN=0;
IF CREDITA=. THEN CREDITA=0;
IF CREDITAA=. THEN CREDITAA=0;
IF CREDITB=. THEN CREDITB=0;
IF CREDITC=. THEN CREDITC=0;
IF CREDITDE=. THEN CREDITDE=0;
IF CREDITGY=. THEN CREDITGY=0;
IF CREDITZ=. THEN CREDITZ=0;
IF PRIZMRUR=. THEN PRIZMRUR=0;
IF PRIZMUB=. THEN PRIZMUB=0;
IF PRIZMTWN=. THEN PRIZMTWN=0;
IF REFURB=. THEN REFURB=0;
IF WEBCAP=. THEN WEBCAP=1;
IF TRUCK=. THEN TRUCK=0;
IF RV=. THEN RV=0;
IF OCCPROF=. THEN OCCPROF=0;
IF OCCCLER=. THEN OCCCLER=0;
IF OCCCRFT=. THEN OCCCRFT=0;
IF OCCSTUD=. THEN OCCSTUD=0;
IF OCCHMKR=. THEN OCCHMKR=0;
IF OCCRET=. THEN OCCRET=0;
IF OCCSELF=. THEN OCCSELF=0;
IF OWNRENT=. THEN OWNRENT=0;
IF MARRYUN=. THEN MARRYUN=0;
IF MARRYYES=. THEN MARRYYES=0;
IF MARRYNO=. THEN MARRYNO=0;
IF MAILORD=. THEN MAILORD=0;
IF MAILRES=. THEN MAILRES=0;
IF MAILFLAG=. THEN MAILFLAG=0;
IF TRAVEL=. THEN TRAVEL=0;
IF PCOWN=. THEN PCOWN=0;
IF CREDITCD=. THEN CREDITCD=1;
IF RETCALLS=. THEN RETCALLS=0;
IF RETACCPT=. THEN RETACCPT=0;
IF NEWCELLY=. THEN NEWCELLY=0;
IF NEWCELLN=. THEN NEWCELLN=0;
IF MCYCLE=. THEN MCYCLE=0;
IF SETPRCM=. THEN SETPRCM=1;
IF RETCALL=. THEN RETCALL=0;
run;

/*** Data reduction of continous variables by factor analysis ***/
ODS HTML FILE='/folders/myfolders/MEGA Case/Logistic/V2/Factor Analysis.XLS';
PROC FACTOR  data=d.logistic_step_3
method=principal scree mineigen=0 nfactor=10 rotate=varimax reorder out=factor;
var
ACTVSUBS
AGE1
AGE2
BLCKVCE
CALLWAIT
CHANGEM
CHANGER
CUSTCARE
DIRECTAS
DROPBLK
DROPVCE
EQPDAYS
INCALLS
INCOME
MODELS
MONTHS
MOU
MOUREC
OPEAKVCE
OUTCALLS
OVERAGE
PEAKVCE
PHONES
RECCHRGE
RETACCPT
RETCALLS
REVENUE
ROAM
SETPRC
THREEWAY
UNANSVCE
UNIQSUBS
;
run;
ods _all_ close;

/* Variable Reduction (Categorical Variables- Chi Square)
proc freq data=c.Logistic_step_3;
tables churn*CHILDREN/chisq norow nocol nopercent;
tables churn*CREDITA/chisq norow nocol nopercent;
tables churn*CREDITAA/chisq norow nocol nopercent;
tables churn*CREDITB/chisq norow nocol nopercent;
tables churn*CREDITC/chisq norow nocol nopercent;
tables churn*CREDITCD/chisq norow nocol nopercent;
tables churn*CREDITDE/chisq norow nocol nopercent;
tables churn*CREDITGY/chisq norow nocol nopercent;
tables churn*CREDITZ/chisq norow nocol nopercent;
tables churn*MAILFLAG/chisq norow nocol nopercent;
tables churn*MAILORD/chisq norow nocol nopercent;
tables churn*MAILRES/chisq norow nocol nopercent;
tables churn*MARRYNO/chisq norow nocol nopercent;
tables churn*MARRYUN/chisq norow nocol nopercent;
tables churn*MARRYYES/chisq norow nocol nopercent;
tables churn*MCYCLE/chisq norow nocol nopercent;
tables churn*NEWCELLN/chisq norow nocol nopercent;
tables churn*NEWCELLY/chisq norow nocol nopercent;
tables churn*OCCCLER/chisq norow nocol nopercent;
tables churn*OCCCRFT/chisq norow nocol nopercent;
tables churn*OCCHMKR/chisq norow nocol nopercent;
tables churn*OCCPROF/chisq norow nocol nopercent;
tables churn*OCCRET/chisq norow nocol nopercent;
tables churn*OCCSELF/chisq norow nocol nopercent;
tables churn*OCCSTUD/chisq norow nocol nopercent;
tables churn*OWNRENT/chisq norow nocol nopercent;
tables churn*PCOWN/chisq norow nocol nopercent;
tables churn*PRIZMRUR/chisq norow nocol nopercent;
tables churn*PRIZMTWN/chisq norow nocol nopercent;
tables churn*PRIZMUB/chisq norow nocol nopercent;
tables churn*REFURB/chisq norow nocol nopercent;
tables churn*RETCALL/chisq norow nocol nopercent;
tables churn*RV/chisq norow nocol nopercent;
tables churn*SETPRCM/chisq norow nocol nopercent;
tables churn*TRAVEL/chisq norow nocol nopercent;
tables churn*TRUCK/chisq norow nocol nopercent;
tables churn*WEBCAP/chisq norow nocol nopercent;
run;


/**** Splitting Data ***/
data d.Logistic_model;
set d.logistic_step_3;
if CALIBRAT=1;
run;

data d.Logistic_validation;
set d.logistic_step_3;
if CALIBRAT=0;
run;

/* 1. COPIED ITERATION */
proc logistic data = d.logistic_model descending /*by default it models for zero(ascending option)*/ 
outest=model;
class
CHILDREN
CREDITC
CREDITDE
PRIZMUB
REFURB
MAILRES
RETCALL
;
model CHURN =
CHILDREN
CREDITC
CREDITDE
PRIZMUB
REFURB
MAILRES
RETCALL
EQPDAYS
OVERAGE
RECCHRGE
MOU
DROPBLK
ROAM
THREEWAY
AGE1
MONTHS
CHANGEM 
/stb lackfit;
output out=tmp p=newpred;
/*where New_customer=0;*/
run;

/* 2. ORIGNAL ITERATION */
proc logistic data = d.logistic_model descending /*by default it models for zero(ascending option)*/ 
outest=model;
class
CREDITA
CREDITAA
CREDITB
CREDITC
CREDITCD
CREDITDE
MAILORD
MAILRES
MARRYNO
MARRYUN
NEWCELLY
OCCRET
OWNRENT
PRIZMRUR
PRIZMTWN
PRIZMUB
REFURB
RETCALL
SETPRCM
WEBCAP
CHILDREN
;
model CHURN =
CHILDREN
CREDITA
CREDITAA
CREDITB
CREDITC
CREDITCD
CREDITDE
MAILORD
MAILRES
MARRYNO
MARRYUN
NEWCELLY
OCCRET
OWNRENT
PRIZMRUR
PRIZMTWN
PRIZMUB
REFURB
RETCALL
SETPRCM
WEBCAP
DROPBLK
THREEWAY
CUSTCARE
OUTCALLS
PHONES
SETPRC
EQPDAYS
REVENUE
DIRECTAS
AGE1
INCOME
ACTVSUBS
RETCALLS
CHANGER
MONTHS
CREDITAD
/selection=stepwise stb lackfit
SLENTRY=0.05 SLSTAY=0.1;
output out=tmp1 p=newpred;
/*where New_customer=0;*/
run;


/* 3. NEW ITERATION */
proc logistic data = d.logistic_model descending /*by default it models for zero(ascending option)*/ 
outest=model;
class
CREDITA
CREDITAA
CREDITB
CREDITC
CREDITCD
CREDITDE
MAILORD
MAILRES
MARRYNO
MARRYUN
NEWCELLY
OCCRET
OWNRENT
PRIZMRUR
PRIZMTWN
PRIZMUB
REFURB
RETCALL
SETPRCM
WEBCAP
CHILDREN
;
model CHURN =
OUTCALLS
CUSTCARE
PHONES
REVENUE
DIRECTAS
INCOME
ACTVSUBS
RETCALLS
MOU
RECCHRGE
OVERAGE
CHANGEM
ROAM
AGE1
DROPBLK
THREEWAY
MONTHS
EQPDAYS
/selection=stepwise stb lackfit
SLENTRY=0.05 SLSTAY=0.1;
output out=tmp1 p=newpred;
/*where New_customer=0;*/
run;


/*** validation on development  ***/
data d.logistic_validation_out;
set d.logistic_validation;
Odds_ratio=
EXP(-0.2653
+
(CUSTCARE*-0.0233)+
(PHONES*0.1877)+
(ACTVSUBS*0.086)+
(RETCALLS*0.7299)+
(MOU*-0.00028)+
(RECCHRGE*-0.00446)+
(OVERAGE*0.00286)+
(CHANGEM*-0.00059)+
(ROAM*0.0405)+
(AGE1*-0.0048)+
(DROPBLK*0.0083)+
(THREEWAY*-0.1292)+
(MONTHS*-0.0344)+
(EQPDAYS*0.00206))
;
Prob=(Odds_ratio/(1+Odds_ratio));
run;

/* Deciling */
proc sort data=d.logistic_validation_out;
by descending prob;
run;

proc rank data=d.logistic_validation_out
groups=10 out=d.logistic_validation_out;
/*by descending prob;*/
var prob;
ranks probrank;
run;

data d.logistic_validation_out;
set d.logistic_validation_out;
probrank=probrank+1;
run;

proc sql;
create table val1O as
select probrank, count(probrank) as cnt,sum(churn) as churn_cnt, min(prob) as min_p, max(prob) as max_p from 
d.logistic_validation_out
group by probrank;
quit;

data logistic_validation_out_sort;
set d.logistic_validation_out;
run;

proc sort data=logistic_validation_out_sort;
by probrank;
run;

proc freq data=logistic_validation_out_sort;
table churn;
by probrank;
run;


/*** validation on development  ***/
data d.logistic_model_out;
set d.logistic_model;
Odds_ratio=
EXP(-0.2653
+
(CUSTCARE*-0.0233)+
(PHONES*0.1877)+
(ACTVSUBS*0.086)+
(RETCALLS*0.7299)+
(MOU*-0.00028)+
(RECCHRGE*-0.00446)+
(OVERAGE*0.00286)+
(CHANGEM*-0.00059)+
(ROAM*0.0405)+
(AGE1*-0.0048)+
(DROPBLK*0.0083)+
(THREEWAY*-0.1292)+
(MONTHS*-0.0344)+
(EQPDAYS*0.00206))
;
Prob=(Odds_ratio/(1+Odds_ratio));
run;

/* Deciling */
proc sort data=d.logistic_model_out;
by descending prob;
run;

proc rank data=d.logistic_model_out
groups=10 out=d.logistic_model_out;
/*by descending prob;*/
var prob;
ranks probrank;
run;

data d.logistic_model_out;
set d.logistic_model_out;
probrank=probrank+1;
run;

proc sql;
create table mod1O as
select probrank, count(probrank) as cnt,sum(churn) as churn_cnt, min(prob) as min_p, max(prob) as max_p from 
d.logistic_validation_out
group by probrank;
quit;


data logistic_model_out_sort;
set d.logistic_model_out;
run;

proc sort data=logistic_model_out_sort;
by probrank;
run;

proc freq data=logistic_model_out_sort;
table churn;
by probrank;
run;

