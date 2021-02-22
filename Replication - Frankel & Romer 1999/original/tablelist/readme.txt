"Does Trade Cause Growth?" by Jeffrey A. Frankel and David Romer
Data files (in ASCII form) and TSP programs

Please contact me (Tess Cyrus, tcyrus@is.dal.ca) if there are 
any questions.  The calculations of the instrumental-variables 
standard errors, in particular, are complicated, so don't 
hesitate to ask for clarification.

On this zip disk are the programs and data for the four tables 
in the June 1998 revision of "Does Trade Cause Growth?"  

Three text files give additional information.  The 
file country.txt lists the 162 countries used to derive fitted
trade shares, specifying which are in the 150-country and
98-country samples.  The file country2.txt lists the 62 countries
used in the gravity regressions.  The file descrip.txt lists the
variables included in each data file.

TABLE 1

The TSP program is table1.tsp.
The data files used are trade62.dat, dist62.dat, var62i.dat, 
var62j.dat, dist162.dat, var162i.dat, and var162j.dat.

TABLE 2

The TSP program is table2.tsp
The data files used are geog150.dat, info150.dat, popwork150.dat,
and area150.dat.

TABLE 3

(The instrumental-variables regressions in Tables 3 and 4 
require a complicated method of calculating the standard errors,
described in the Microsoft Word document stderror.doc, which
is included.  The TSP program stderror.tsp is the first program 
used in deriving the IV standard errors.)

The TSP program table3-1.tsp has the OLS regression from column 
(1), and the IV coefficients from column (2) (plus calculations 
used in determining the IV standard errors).  The TSP program 
table3-2.tsp has the IV standard errors from column (2).  (The 
standard errors are the square roots of the diagonal of V, in the 
last part of the program.)

The data files used are allgeog.dat, area150.dat, popwork150.dat,
and info150.dat

The TSP program table3-3.tsp has the OLS regression from column 
(3), and the IV coefficients from column (4).  The TSP program 
table3-4.tsp has the IV standard errors from column (4).

The data files used are allgeog98.dat, area98.dat, popwork98.dat,
and info98.dat.

TABLE 4

The TSP program table4-1.tsp has the OLS regression from column 
(1), and the IV coefficients from column (2).  The TSP program 
table4-2.tsp has the IV standard errors from column (2).

The TSP program table4-3.tsp has the OLS regression from column 
(3), and the IV coefficients from column (4).  The TSP program 
table4-4.tsp has the IV standard errors from column (4).

The TSP program table4-5.tsp has the OLS regression from column 
(5), and the IV coefficients from column (6).  The TSP program 
table4-6.tsp has the IV standard errors from column (6).

The TSP program table4-7.tsp has the OLS regression from column 
(7), and the IV coefficients from column (8).  The TSP program 
table4-8.tsp has the IV standard errors from column (8).

The TSP program table4-9.tsp has the OLS regression from column 
(9), and the IV coefficients from column (10).  The TSP program 
table4-10.tsp has the IV standard errors from column (10).

The data files used are allgeog98.dat, area98.dat, popwork98.dat, 
info98.dat, and hj98.dat.




***************************************************************

Addendum (4/24/01)

I recently encountered the following in a paper that uses these data:

"the common border variable was coded incorrectly between four pairs of countries (eight
observations) in the estimation sample.  They are (Switzerland, Norway), (Denmark,
Sweden), (Spain, France), and (Norway, Sweden).  In addition, the area variable for Saudi
Arabia is coded differently in the estimation sample and the prediction sample.  ... the value
used in the prediction sample, which is 865,000 squared miles [, appears to be the correct
one.]"

                                                       David Romer