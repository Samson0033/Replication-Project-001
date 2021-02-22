
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
log using figure1+table2.log, replace

use tableA1_final

* Scatter Plot Actual Trade Share vs Constructed Trade Share
scatter open geogt, ytitle("Actual Trade Share") xtitle("Constructed Trade Share")

* Correlation between Actual Trade Share vs Constructed Trade Share
cor open geogt


***************************************
gen lwork = log(work)
gen larea = log(area)


* Regression of Actual Trade Share on Constructed Trade Share
reg open geogt

* regression of Actual trade share on log population and log area
reg open lwork larea

* regression of Actual Trade Share on Constructed trade share,
* log population and log area
reg open geogt lwork larea

* Partial correlations of Constructed Trade Share
pcorr geogt open lwork larea


*output to a table
eststo: quietly reg open geogt
eststo: quietly reg open lwork larea
eststo: quietly reg open geogt lwork larea
esttab, se ar2

log close
