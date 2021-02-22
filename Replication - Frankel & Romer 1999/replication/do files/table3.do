
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
log using table3.log, replace


** 150 country sample

use tableA1_final

gen lwork = log(work)
gen larea = log(area)
gen lgdpw85 = log(gdpw85)

* OLS regression of log income per person on trade share and the two size measures
eststo: quietly reg lgdpw85 open lwork larea

* IV regression of log income per person on trade share and the two size measures
eststo: quietly ivregress 2sls lgdpw85 lwork larea (open = geogt)

* First-stage regression summary statistics
estat firststage

clear

** 98 country sample

use tableA1_final_98

gen lwork = log(work)
gen larea = log(area)
gen lgdpw85 = log(gdpw85)

* OLS regression of log income per person on trade share and the two size measures
eststo: quietly reg lgdpw85 open lwork larea

* IV regression of log income per person on trade share and the two size measures
eststo: quietly ivregress 2sls lgdpw85 lwork larea (open = geogt)

* First-stage regression summary statistics
estat firststage


esttab, se ar2

log close
