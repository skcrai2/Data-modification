# Data-modification
Using SAS to modify datasets

For this dataset, we are looking to solve the following tow problems:

Problem #1:

Write	a	program	to	read	the	Funddrive	data	into	the	data	set	Newfund.		Make	sure	you	save	the
Newfund data	set	in	a	permanent	library	(you	decide	the	library	name	and	location).		In	the	program,

1. Define	a	new	variable:	Year_Don	as	sum	of	donations	of	four	quarters.	Year_Don	has	variable	label:	
Yearly	Total	Donation

2. Define	permanent	variable	labels	using	LABEL	statement	for	each	variable.

3. Use	IF-THEN-ELSE	statement	to	define	the	following	new	variable.	For	Year_don:	
  a. define			Ydoncat	=’Low’	if	Year_Don	is	le	50	,
  b. Ydoncat	=	‘Modetate’			if	Year_don	between		51-100,	
  c. and	Ydoncat	=	‘High’ if	Year_don	is	gt	100.

4. Use	SELECT-WHEN-OTHERWISE	statement	to	define	a	new	variable,	AGEGP:
  a. AGEGP	is	YOUNG	when	age	is	34	or	younger,	
  b. AGEGP	is	MIDDLE	when	age	is	form	35	to	49,	
  c. AGEGP	is	SENIOR	when	age	is	50	or	older.
[NOTE:	Make	sure	you	define	the	LENGTH	statement	for	Ydoncat	and	Agegp	varibles.	]

5. Use	(DROP	=	)	option	to	drop	variables	Gender		AGE	from	the	output	data	set.

6. Use	PROC	CONTENTS	to	show	data	description	and	related	data	attributes	of	the	Newfund	data	set.

7. Use	PROC	PRINT	to	print	the	output	data	set	Newfund.

Problem	#2:

Read	the	SAS	data	set	Newfund	you	created	in	Program	1,	and	create	a	new	data	set, Fund_Avg	,	that	will	
consist	of	only	one	observation	with	variables	for	the	Average	Donation	for	each	quarter	and	yearly	average	
donation.	Note:	in	order	to	do	this,	you	need	to

1. Use	the	option	END	=		in	the	SET	statement.

2. Use	OUTPUT	statement	properly.

3. Use	(DROP	=	)	to	drop	Qtr1	Qtr2	Qtr3	and	Qtr4	AGEGP	Year_Don,	Ydoncat	from	Fund_Avg	data	set	
you	are	creating.

4. Use	PROC	PRINT	to	print	the	data	set	Fund_avg.	Make sure	you	provide	a	TITLE	statement	here.
