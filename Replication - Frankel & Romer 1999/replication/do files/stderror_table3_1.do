
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
log using stderror_table3_1.log, replace


** Sample of 150 countries

use tableA1_final

*************************************************************

* Manually add the 'Country' variable from tableA1_final.dta to
* allgeog150.dta for the purpose of merging those two datasets.

**************************************************************
** merge
merge 1:1 Country using "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\allgeog150.dta"
drop _merge
save "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\tableA1++.dta", replace

gen lwork = log(work)
gen larea = log(area)
gen lgdpw85 = log(gdpw85)


* IV regression with geogt as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt)
gen a0 = _b[_cons]
gen a1 = _b[open]
gen a2 = _b[lwork]
gen a3 = _b[larea]

* IV regression with geogt0 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt0)
gen a0g0 = _b[_cons]
gen a1g0 = _b[open]
gen a2g0 = _b[lwork]
gen a3g0 = _b[larea]

* IV regression with geogt1 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt1)
gen a0g1 = _b[_cons]
gen a1g1 = _b[open]
gen a2g1 = _b[lwork]
gen a3g1 = _b[larea]

* IV regression with geogt2 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt2)
gen a0g2 = _b[_cons]
gen a1g2 = _b[open]
gen a2g2 = _b[lwork]
gen a3g2 = _b[larea]

* IV regression with geogt3 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt3)
gen a0g3 = _b[_cons]
gen a1g3 = _b[open]
gen a2g3 = _b[lwork]
gen a3g3 = _b[larea]

* IV regression with geogt4 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt4)
gen a0g4 = _b[_cons]
gen a1g4 = _b[open]
gen a2g4 = _b[lwork]
gen a3g4 = _b[larea]

* IV regression with geogt5 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt5)
gen a0g5 = _b[_cons]
gen a1g5 = _b[open]
gen a2g5 = _b[lwork]
gen a3g5 = _b[larea]

* IV regression with geogt6 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt6)
gen a0g6 = _b[_cons]
gen a1g6 = _b[open]
gen a2g6 = _b[lwork]
gen a3g6 = _b[larea]

* IV regression with geogt7 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt7)
gen a0g7 = _b[_cons]
gen a1g7 = _b[open]
gen a2g7 = _b[lwork]
gen a3g7 = _b[larea]

* IV regression with geogt8 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt8)
gen a0g8 = _b[_cons]
gen a1g8 = _b[open]
gen a2g8 = _b[lwork]
gen a3g8 = _b[larea]

* IV regression with geogt9 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt9)
gen a0g9 = _b[_cons]
gen a1g9 = _b[open]
gen a2g9 = _b[lwork]
gen a3g9 = _b[larea]

* IV regression with geogt10 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt10)
gen a0g10 = _b[_cons]
gen a1g10 = _b[open]
gen a2g10 = _b[lwork]
gen a3g10 = _b[larea]

* IV regression with geogt11 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt11)
gen a0g11 = _b[_cons]
gen a1g11 = _b[open]
gen a2g11 = _b[lwork]
gen a3g11 = _b[larea]

* IV regression with geogt12 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt12)
gen a0g12 = _b[_cons]
gen a1g12 = _b[open]
gen a2g12 = _b[lwork]
gen a3g12 = _b[larea]

* IV regression with geogt13 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt13)
gen a0g13 = _b[_cons]
gen a1g13 = _b[open]
gen a2g13 = _b[lwork]
gen a3g13 = _b[larea]



* First column of da/db

gen da1db0 = (a0g0 - a0)/0.001
gen da1db1 = (a0g1 - a0)/0.001
gen da1db2 = (a0g2 - a0)/0.001
gen da1db3 = (a0g3 - a0)/0.001
gen da1db4 = (a0g4 - a0)/0.001
gen da1db5 = (a0g5 - a0)/0.001
gen da1db6 = (a0g6 - a0)/0.001
gen da1db7 = (a0g7 - a0)/0.001
gen da1db8 = (a0g8 - a0)/0.001
gen da1db9 = (a0g9 - a0)/0.001
gen da1db10 = (a0g10 - a0)/0.001
gen da1db11 = (a0g11 - a0)/0.001
gen da1db12 = (a0g12 - a0)/0.001
gen da1db13 = (a0g13 - a0)/0.001

* Second column

gen da2db0 = (a1g0 - a1)/0.001
gen da2db1 = (a1g1 - a1)/0.001
gen da2db2 = (a1g2 - a1)/0.001
gen da2db3 = (a1g3 - a1)/0.001
gen da2db4 = (a1g4 - a1)/0.001
gen da2db5 = (a1g5 - a1)/0.001
gen da2db6 = (a1g6 - a1)/0.001
gen da2db7 = (a1g7 - a1)/0.001
gen da2db8 = (a1g8 - a1)/0.001
gen da2db9 = (a1g9 - a1)/0.001
gen da2db10 = (a1g10 - a1)/0.001
gen da2db11 = (a1g11 - a1)/0.001
gen da2db12 = (a1g12 - a1)/0.001
gen da2db13 = (a1g13 - a1)/0.001

* Third column

gen da3db0 = (a2g0 - a2)/0.001
gen da3db1 = (a2g1 - a2)/0.001
gen da3db2 = (a2g2 - a2)/0.001
gen da3db3 = (a2g3 - a2)/0.001
gen da3db4 = (a2g4 - a2)/0.001
gen da3db5 = (a2g5 - a2)/0.001
gen da3db6 = (a2g6 - a2)/0.001
gen da3db7 = (a2g7 - a2)/0.001
gen da3db8 = (a2g8 - a2)/0.001
gen da3db9 = (a2g9 - a2)/0.001
gen da3db10 = (a2g10 - a2)/0.001
gen da3db11 = (a2g11 - a2)/0.001
gen da3db12 = (a2g12 - a2)/0.001
gen da3db13 = (a2g13 - a2)/0.001


* Fourth column

gen da4db0 = (a3g0 - a3)/0.001
gen da4db1 = (a3g1 - a3)/0.001
gen da4db2 = (a3g2 - a3)/0.001
gen da4db3 = (a3g3 - a3)/0.001
gen da4db4 = (a3g4 - a3)/0.001
gen da4db5 = (a3g5 - a3)/0.001
gen da4db6 = (a3g6 - a3)/0.001
gen da4db7 = (a3g7 - a3)/0.001
gen da4db8 = (a3g8 - a3)/0.001
gen da4db9 = (a3g9 - a3)/0.001
gen da4db10 = (a3g10 - a3)/0.001
gen da4db11 = (a3g11 - a3)/0.001
gen da4db12 = (a3g12 - a3)/0.001
gen da4db13 = (a3g13 - a3)/0.001


clear

**********************************************************
**********************************************************

** Sample of 98 countries


use tableA1_final_98

*************************************************************

* Manually add the 'Country' variable from tableA1_final.dta to
* allgeog98.dta for the purpose of merging those two datasets.

**************************************************************
** merge
merge 1:1 Country using "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\allgeog98.dta"
drop _merge
save "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\tableA1++_98.dta", replace

gen lwork = log(work)
gen larea = log(area)
gen lgdpw85 = log(gdpw85)

* OLS regression of log income per person on trade share and the two size measures
reg lgdpw85 open lwork larea

* IV regression with geogt as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt)
gen a0 = _b[_cons]
gen a1 = _b[open]
gen a2 = _b[lwork]
gen a3 = _b[larea]

* IV regression with geogt0 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt0)
gen a0g0 = _b[_cons]
gen a1g0 = _b[open]
gen a2g0 = _b[lwork]
gen a3g0 = _b[larea]

* IV regression with geogt1 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt1)
gen a0g1 = _b[_cons]
gen a1g1 = _b[open]
gen a2g1 = _b[lwork]
gen a3g1 = _b[larea]

* IV regression with geogt2 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt2)
gen a0g2 = _b[_cons]
gen a1g2 = _b[open]
gen a2g2 = _b[lwork]
gen a3g2 = _b[larea]

* IV regression with geogt3 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt3)
gen a0g3 = _b[_cons]
gen a1g3 = _b[open]
gen a2g3 = _b[lwork]
gen a3g3 = _b[larea]

* IV regression with geogt4 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt4)
gen a0g4 = _b[_cons]
gen a1g4 = _b[open]
gen a2g4 = _b[lwork]
gen a3g4 = _b[larea]

* IV regression with geogt5 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt5)
gen a0g5 = _b[_cons]
gen a1g5 = _b[open]
gen a2g5 = _b[lwork]
gen a3g5 = _b[larea]

* IV regression with geogt6 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt6)
gen a0g6 = _b[_cons]
gen a1g6 = _b[open]
gen a2g6 = _b[lwork]
gen a3g6 = _b[larea]

* IV regression with geogt7 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt7)
gen a0g7 = _b[_cons]
gen a1g7 = _b[open]
gen a2g7 = _b[lwork]
gen a3g7 = _b[larea]

* IV regression with geogt8 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt8)
gen a0g8 = _b[_cons]
gen a1g8 = _b[open]
gen a2g8 = _b[lwork]
gen a3g8 = _b[larea]

* IV regression with geogt9 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt9)
gen a0g9 = _b[_cons]
gen a1g9 = _b[open]
gen a2g9 = _b[lwork]
gen a3g9 = _b[larea]

* IV regression with geogt10 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt10)
gen a0g10 = _b[_cons]
gen a1g10 = _b[open]
gen a2g10 = _b[lwork]
gen a3g10 = _b[larea]

* IV regression with geogt11 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt11)
gen a0g11 = _b[_cons]
gen a1g11 = _b[open]
gen a2g11 = _b[lwork]
gen a3g11 = _b[larea]

* IV regression with geogt12 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt12)
gen a0g12 = _b[_cons]
gen a1g12 = _b[open]
gen a2g12 = _b[lwork]
gen a3g12 = _b[larea]

* IV regression with geogt13 as instrument
ivregress 2sls lgdpw85 lwork larea (open = geogt13)
gen a0g13 = _b[_cons]
gen a1g13 = _b[open]
gen a2g13 = _b[lwork]
gen a3g13 = _b[larea]



* First column of da/db

gen da1db0 = (a0g0 - a0)/0.001
gen da1db1 = (a0g1 - a0)/0.001
gen da1db2 = (a0g2 - a0)/0.001
gen da1db3 = (a0g3 - a0)/0.001
gen da1db4 = (a0g4 - a0)/0.001
gen da1db5 = (a0g5 - a0)/0.001
gen da1db6 = (a0g6 - a0)/0.001
gen da1db7 = (a0g7 - a0)/0.001
gen da1db8 = (a0g8 - a0)/0.001
gen da1db9 = (a0g9 - a0)/0.001
gen da1db10 = (a0g10 - a0)/0.001
gen da1db11 = (a0g11 - a0)/0.001
gen da1db12 = (a0g12 - a0)/0.001
gen da1db13 = (a0g13 - a0)/0.001

* Second column

gen da2db0 = (a1g0 - a1)/0.001
gen da2db1 = (a1g1 - a1)/0.001
gen da2db2 = (a1g2 - a1)/0.001
gen da2db3 = (a1g3 - a1)/0.001
gen da2db4 = (a1g4 - a1)/0.001
gen da2db5 = (a1g5 - a1)/0.001
gen da2db6 = (a1g6 - a1)/0.001
gen da2db7 = (a1g7 - a1)/0.001
gen da2db8 = (a1g8 - a1)/0.001
gen da2db9 = (a1g9 - a1)/0.001
gen da2db10 = (a1g10 - a1)/0.001
gen da2db11 = (a1g11 - a1)/0.001
gen da2db12 = (a1g12 - a1)/0.001
gen da2db13 = (a1g13 - a1)/0.001

* Third column

gen da3db0 = (a2g0 - a2)/0.001
gen da3db1 = (a2g1 - a2)/0.001
gen da3db2 = (a2g2 - a2)/0.001
gen da3db3 = (a2g3 - a2)/0.001
gen da3db4 = (a2g4 - a2)/0.001
gen da3db5 = (a2g5 - a2)/0.001
gen da3db6 = (a2g6 - a2)/0.001
gen da3db7 = (a2g7 - a2)/0.001
gen da3db8 = (a2g8 - a2)/0.001
gen da3db9 = (a2g9 - a2)/0.001
gen da3db10 = (a2g10 - a2)/0.001
gen da3db11 = (a2g11 - a2)/0.001
gen da3db12 = (a2g12 - a2)/0.001
gen da3db13 = (a2g13 - a2)/0.001


* Fourth column

gen da4db0 = (a3g0 - a3)/0.001
gen da4db1 = (a3g1 - a3)/0.001
gen da4db2 = (a3g2 - a3)/0.001
gen da4db3 = (a3g3 - a3)/0.001
gen da4db4 = (a3g4 - a3)/0.001
gen da4db5 = (a3g5 - a3)/0.001
gen da4db6 = (a3g6 - a3)/0.001
gen da4db7 = (a3g7 - a3)/0.001
gen da4db8 = (a3g8 - a3)/0.001
gen da4db9 = (a3g9 - a3)/0.001
gen da4db10 = (a3g10 - a3)/0.001
gen da4db11 = (a3g11 - a3)/0.001
gen da4db12 = (a3g12 - a3)/0.001
gen da4db13 = (a3g13 - a3)/0.001


log close
