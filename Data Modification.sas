/*read the Funddrive data into the data set Newfund*/

DATA work.Newfund;
	INFILE 'location\Funddrive.dat';
    INPUT Lastname $1-11 Gender $13 Age 16-17 Qtr1 19-21 Qtr2 24-26 Qtr3 28-30 Qtr4 32-34;
RUN;

/* Problem 1 #1 */

Data work.Newfund;
	set work.Newfund;
	Year_Don=sum(of Qtr1-Qtr4);
run;

proc print data=work.Newfund label;
	label Year_Don='Yearly Total Donation';
run;

/* Problem 1 #2 */

Data work.Newfund;
	set work.Newfund;
	label Lastname='Last Name'
	Gender='Gender'
	Age='Age'
	Qtr1='Quarter 1 Donation'
	Qtr2='Quarter 2 Donation'
	Qtr3='Quarter 3 Donation'
	Qtr4='Quarter 4 Donation'
	Year_Don='Yearly Total Donation';
run;

/* Problem 1 #3 */

Data work.Newfund_2;
	set work.Newfund;
	Length Ydoncat $8.;
	if	Year_Don <= 50 then	
		Ydoncat='Low';	
	else if	Year_Don > 50 and Year_Don<=100 then		
		Ydoncat='Moderate';	
	else Ydoncat='High';
run;

/* Problem 1 #4 */

Data work.Newfund_3;
	set work.Newfund_2;
	Length AGEGP $6.;
	select;
	when (age<=34) AGEGP='YOUNG';
	when (age<=49 and age>34) AGEGP='MIDDLE';	
	otherwise AGEGP='SENIOR';
end;
run;
 
/* Problem 1 #5 */

Data work.Newfund_4 (drop=Gender Age);
	set work.Newfund_3;
run;

/* Problem 1 #6*/

Proc Contents data=work.Newfund_4;
run;

/*Problem 1 #7*/

Proc Print data=work.Newfund_4;
run;

/* Problem #2 1-4 
Alternative Method*/

proc means noprint data=work.Newfund_4;
	VAR Qtr1 Qtr2 Qtr3 Qtr4 Year_Don;
	output out=totals MEAN(Qtr1 Qtr2 Qtr3 Qtr4 Year_Don)=MeanQtr1 MeanQtr2 MeanQtr3 MeanQtr4 MeanYear_Don;
run;

data totals (DROP=_TYPE_ _FREQ_);
	SET totals;
run;

proc print data=totals noobs;
	title "Overall Average Donations";
run;

/* Problem #2 1-4 
Recommended Method*/

proc means noprint data=work.Newfund_4;
	output out=totals mean=;
run;

data totals;
	set  work.Newfund_4 totals (in=in2);
	if n2 then name='Total';
run;

data Fund_avg (drop=Lastname AGEGP Ydoncat _TYPE_ _FREQ_ n2 name);
	set totals end=last;
	if last;
run;

proc print data=Fund_avg noobs label;
	label 	Qtr1=MeanQtr1 
			Qtr2=MeanQtr2 
			Qtr3=MeanQtr3 
			Qtr4=MeanQtr4 
			Year_Don=MeanYear_Don;
	title "Overall Average Donations";
run;
	
