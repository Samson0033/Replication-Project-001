
**************************************************************************
*																		 *
*					about this .do file ......							 *
*		   																 *
**************************************************************************

capture log close
version 14
clear all
set more off

cd "C:/Users/samso/Google Drive/University of Notre Dame/Spring 2020/Econometrics II/Writing Assignment/Stata"

* Opening a log-file
log using table4.log, replace


*convert data into Stata format
infile country_code gdpw85 gdpw60 avinv ngdelta avsch open using "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Data\tablelist\info150.dat"
save "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\info150.dta", replace

clear 

infile code1 code2 alnky phis lna using "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Data\tablelist\hj98.dat"
save "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\hj98.dta", replace

clear

infile code1 code2 code3 gdpw85 gdpw60 avinv ngdelta avsch open using "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Data\tablelist\info98.dat"
save "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\info98.dta", replace

merge 1:1 _n using "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\hj98.dta"
drop _merge
save "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\table4.dta", replace

clear

use tableA1_final_98
gen code1 = _n
merge 1:1 _n using "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\table4.dta"
drop _merge

gen lwork = log(work)
gen larea = log(area)
gen lgdpw85 = log(gdpw85)
gen lgdpw60 = log(gdpw60)
gen lgrow = lgdpw85 - lgdpw60

*Columns 1 and 2 of Table 4
eststo: quietly reg alnky open lwork larea
eststo: quietly ivregress 2sls alnky lwork larea (open = geogt)

*Columns 3 and 4 of Table 4
eststo: quietly reg phis open lwork larea
eststo: quietly ivregress 2sls phis lwork larea (open = geogt)

*Columns 5 and 6 of Table 4
eststo: quietly reg lna open lwork larea
eststo: quietly ivregress 2sls lna lwork larea (open = geogt)

*Columns 7 and 8 of Table 4
eststo: quietly reg lgdpw60 open lwork larea
eststo: quietly ivregress 2sls lgdpw60 lwork larea (open = geogt)

*Columns 9 and 10 of Table 4
eststo: quietly reg lgrow open lwork larea
eststo: quietly ivregress 2sls lgrow lwork larea (open = geogt)

esttab, se ar2


log close
