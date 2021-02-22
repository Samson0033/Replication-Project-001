
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
log using stderror.log, replace


* Generating the relevant variables for the fitted
* bilateral trade equation

use tableA1

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


* Add 0.001 to b0 and recompute trade share

gen b0new = b0 + 0.001

gen lftrdsh0 = b0new + b1*ldist + b2*lworki + b3*lareai + b4*lworkj ///
+ b5*lareaj + b6*lockij + b7*adj + b8*adjdist + b9*adjworki ///
+ b10*adjareai + b11*adjworkj + b12*adjareaj + b13*adjlij

gen ftrdsh0 = exp(lftrdsh0)


* Add 0.001 to b1 and recompute trade share

gen b1new = b1 + 0.001

gen lftrdsh1 = b0 + b1new*ldist + b2*lworki + b3*lareai + b4*lworkj ///
+ b5*lareaj + b6*lockij + b7*adj + b8*adjdist + b9*adjworki ///
+ b10*adjareai + b11*adjworkj + b12*adjareaj + b13*adjlij

gen ftrdsh1 = exp(lftrdsh1)


* Add 0.001 to b2 and recompute trade share

gen b2new = b2 + 0.001

gen lftrdsh2 = b0 + b1*ldist + b2new*lworki + b3*lareai + b4*lworkj ///
+ b5*lareaj + b6*lockij + b7*adj + b8*adjdist + b9*adjworki ///
+ b10*adjareai + b11*adjworkj + b12*adjareaj + b13*adjlij

gen ftrdsh2 = exp(lftrdsh2)


* Add 0.001 to b3 and recompute trade share

gen b3new = b3 + 0.001

gen lftrdsh3 = b0 + b1*ldist + b2*lworki + b3new*lareai + b4*lworkj ///
+ b5*lareaj + b6*lockij + b7*adj + b8*adjdist + b9*adjworki ///
+ b10*adjareai + b11*adjworkj + b12*adjareaj + b13*adjlij

gen ftrdsh3 = exp(lftrdsh3)


* Add 0.001 to b4 and recompute trade share

gen b4new = b4 + 0.001

gen lftrdsh4 = b0 + b1*ldist + b2*lworki + b3*lareai + b4new*lworkj ///
+ b5*lareaj + b6*lockij + b7*adj + b8*adjdist + b9*adjworki ///
+ b10*adjareai + b11*adjworkj + b12*adjareaj + b13*adjlij

gen ftrdsh4 = exp(lftrdsh4)


* Add 0.001 to b5 and recompute trade share

gen b5new = b5 + 0.001

gen lftrdsh5 = b0 + b1*ldist + b2*lworki + b3*lareai + b4*lworkj ///
+ b5new*lareaj + b6*lockij + b7*adj + b8*adjdist + b9*adjworki ///
+ b10*adjareai + b11*adjworkj + b12*adjareaj + b13*adjlij

gen ftrdsh5 = exp(lftrdsh5)


* Add 0.001 to b6 and recompute trade share

gen b6new = b6 + 0.001

gen lftrdsh6 = b0 + b1*ldist + b2*lworki + b3*lareai + b4*lworkj ///
+ b5*lareaj + b6new*lockij + b7*adj + b8*adjdist + b9*adjworki ///
+ b10*adjareai + b11*adjworkj + b12*adjareaj + b13*adjlij

gen ftrdsh6 = exp(lftrdsh6)


* Add 0.001 to b7 and recompute trade share

gen b7new = b7 + 0.001

gen lftrdsh7 = b0 + b1*ldist + b2*lworki + b3*lareai + b4*lworkj ///
+ b5*lareaj + b6*lockij + b7new*adj + b8*adjdist + b9*adjworki ///
+ b10*adjareai + b11*adjworkj + b12*adjareaj + b13*adjlij

gen ftrdsh7 = exp(lftrdsh7)


* Add 0.001 to b8 and recompute trade share

gen b8new = b8 + 0.001

gen lftrdsh8 = b0 + b1*ldist + b2*lworki + b3*lareai + b4*lworkj ///
+ b5*lareaj + b6*lockij + b7*adj + b8new*adjdist + b9*adjworki ///
+ b10*adjareai + b11*adjworkj + b12*adjareaj + b13*adjlij

gen ftrdsh8 = exp(lftrdsh8)


* Add 0.001 to b9 and recompute trade share

gen b9new = b9 + 0.001

gen lftrdsh9 = b0 + b1*ldist + b2*lworki + b3*lareai + b4*lworkj ///
+ b5*lareaj + b6*lockij + b7*adj + b8*adjdist + b9new*adjworki ///
+ b10*adjareai + b11*adjworkj + b12*adjareaj + b13*adjlij

gen ftrdsh9 = exp(lftrdsh9)


* Add 0.001 to b10 and recompute trade share

gen b10new = b10 + 0.001

gen lftrdsh10 = b0 + b1*ldist + b2*lworki + b3*lareai + b4*lworkj ///
+ b5*lareaj + b6*lockij + b7*adj + b8*adjdist + b9*adjworki ///
+ b10new*adjareai + b11*adjworkj + b12*adjareaj + b13*adjlij

gen ftrdsh10 = exp(lftrdsh10)


* Add 0.001 to b11 and recompute trade share

gen b11new = b11 + 0.001

gen lftrdsh11 = b0 + b1*ldist + b2*lworki + b3*lareai + b4*lworkj ///
+ b5*lareaj + b6*lockij + b7*adj + b8*adjdist + b9*adjworki ///
+ b10*adjareai + b11new*adjworkj + b12*adjareaj + b13*adjlij

gen ftrdsh11 = exp(lftrdsh11)


* Add 0.001 to b12 and recompute trade share

gen b12new = b12 + 0.001

gen lftrdsh12 = b0 + b1*ldist + b2*lworki + b3*lareai + b4*lworkj ///
+ b5*lareaj + b6*lockij + b7*adj + b8*adjdist + b9*adjworki ///
+ b10*adjareai + b11*adjworkj + b12new*adjareaj + b13*adjlij

gen ftrdsh12 = exp(lftrdsh12)


* Add 0.001 to b13 and recompute trade share

gen b13new = b13 + 0.001

gen lftrdsh13 = b0 + b1*ldist + b2*lworki + b3*lareai + b4*lworkj ///
+ b5*lareaj + b6*lockij + b7*adj + b8*adjdist + b9*adjworki ///
+ b10*adjareai + b11*adjworkj + b12*adjareaj + b13new*adjlij

gen ftrdsh13 = exp(lftrdsh13)

**********************************

collapse (sum) ftrdsh ftrdsh0 ftrdsh1 ftrdsh2 ftrdsh3 ftrdsh4 ftrdsh5 ///
ftrdsh6 ftrdsh7 ftrdsh8 ftrdsh9 ftrdsh10 ftrdsh11 ftrdsh12 ///
ftrdsh13, by(country_code)


gen geogt0 = ftrdsh0*100*1000
gen geogt1 = ftrdsh1*100*1000
gen geogt2 = ftrdsh2*100*1000
gen geogt3 = ftrdsh3*100*1000
gen geogt4 = ftrdsh4*100*1000
gen geogt5 = ftrdsh5*100*1000
gen geogt6 = ftrdsh6*100*1000
gen geogt7 = ftrdsh7*100*1000
gen geogt8 = ftrdsh8*100*1000
gen geogt9 = ftrdsh9*100*1000
gen geogt10 = ftrdsh10*100*1000
gen geogt11 = ftrdsh11*100*1000
gen geogt12 = ftrdsh12*100*1000
gen geogt13 = ftrdsh13*100*1000

drop ftrdsh ftrdsh0 ftrdsh1 ftrdsh2 ftrdsh3 ftrdsh4 ftrdsh5 ///
ftrdsh6 ftrdsh7 ftrdsh8 ftrdsh9 ftrdsh10 ftrdsh11 ftrdsh12 ftrdsh13

drop if country_code >= 151

save "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\allgeog150.dta", replace


log close
