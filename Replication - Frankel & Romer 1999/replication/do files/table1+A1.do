
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
log using table1+A1.log, replace


**************************************************************************
*																		 *
*		 			 PART I: BILATERAL TRADE EQUATION					 *
*		   																 *
**************************************************************************

* Loading the data
use table1

* Drop observations where bilateral trade is 0
drop if trade==0

* Generating the relevant variables for the bilateral trade regression
gen trdsh = trade/gdpi
gen ltrdsh = log(trdsh)

gen lworki = log(worki)
gen lworkj = log(workj)
gen lareai = log(areai)
gen lareaj = log(areaj)
gen ldist = log(dist)

gen adjdist = adj * ldist
gen lockij = locki + lockj
gen adjlij = adj * lockij
gen adjworki = adj * lworki
gen adjworkj = adj * lworkj
gen adjareai = adj * lareai
gen adjareaj = adj * lareaj

* Estimating the bilateral trade equation
reg ltrdsh ldist lworki lareai lworkj lareaj lockij adj adjdist adjworki adjareai adjworkj adjareaj adjlij

* Storing then coefficients from the bileteral trade equation

gen b0 = _b[_cons]
gen b1 = _b[ldist]
gen b2 = _b[lworki]
gen b3 = _b[lareai]
gen b4 = _b[lworkj]
gen b5 = _b[lareaj]
gen b6 = _b[lockij]
gen b7 = _b[adj]
gen b8 = _b[adjdist]
gen b9 = _b[adjworki]
gen b10 = _b[adjareai]
gen b11 = _b[adjworkj]
gen b12 = _b[adjareaj]
gen b13 = _b[adjlij]

save "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\beta.dta", replace

keep b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13

save "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\beta.dta", replace


**************************************************************************
*																		 *
*		  PART II: CONSTRUCTED TRADE SHARE
*		   																 *
**************************************************************************


*Merging with the coefficient dataset

****** I first manually add the 'country_code' variable
* to the coefficient dataset for the purpose of merging


*****I then fill in the missing values

replace b0 = b0[_n-1] if missing(b0)
replace b1 = b1[_n-1] if missing(b1)
replace b2 = b2[_n-1] if missing(b2)
replace b3 = b3[_n-1] if missing(b3)
replace b4 = b4[_n-1] if missing(b4)
replace b5 = b5[_n-1] if missing(b5)
replace b6 = b6[_n-1] if missing(b6)
replace b7 = b7[_n-1] if missing(b7)
replace b8 = b8[_n-1] if missing(b8)
replace b9 = b9[_n-1] if missing(b9)
replace b10 = b10[_n-1] if missing(b10)
replace b11 = b11[_n-1] if missing(b11)
replace b12 = b12[_n-1] if missing(b12)
replace b13 = b13[_n-1] if missing(b13)

save "beta.dta", replace

clear 

use tableA1

* Generating the relevant variables for the fitted
* bilateral trade equation

gen lworki = log(worki)
gen lworkj = log(workj)
gen lareai = log(areai)
gen lareaj = log(areaj)
gen ldist = log(dist)
gen adjdist = adj * ldist
gen lockij = locki + lockj
gen adjlij = adj * lockij
gen adjworki = adj * lworki
gen adjworkj = adj * lworkj
gen adjareai = adj * lareai
gen adjareaj = adj * lareaj

merge m:m country_code using "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\beta.dta"

*Calculating the fitted trade share (geogt)

gen lftrdsh = b0 + b1*ldist + b2*lworki + b3*lareai + b4*lworkj ///
+ b5*lareaj + b6*lockij + b7*adj + b8*adjdist + b9*adjworki ///
+ b10*adjareai + b11*adjworkj + b12*adjareaj + b13*adjlij

gen ftrdsh = exp(lftrdsh)
collapse (sum) ftrdsh, by(country_code)
gen geogt = ftrdsh*100*1000

log close
