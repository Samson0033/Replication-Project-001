
**************************************************************************
*																		 *
*						about this .do file......						 *
*		   																 *
**************************************************************************

capture log close
version 14
clear all
set more off

cd "C:/Users/samso/Google Drive/University of Notre Dame/Spring 2020/Econometrics II/Writing Assignment/Stata"

* Opening a log-file
log using convert_data.log, replace




**************************************************************************
*																		 *
*	 PART I: CONVERTING THE 62-COUNTRY DATASETS INTO STATA FORMAT		 *
*		   																 *
**************************************************************************

*trade62
infile country_code trade using "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Data\tablelist\trade62.dat"
save "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\trade62.dta", replace
clear

*dist62
infile country_code dist adj using "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Data\tablelist\dist62.dat"
save "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\dist62.dta", replace
clear

*var62i
infile country_code gdpi locki worki areai using "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Data\tablelist\var62i.dat"
save "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\var62i.dta", replace
clear

*var62j
infile country_code gdpj lockj workj areaj using "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Data\tablelist\var62j.dat"
save "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\var62j.dta", replace
clear


**************************************************************************
*																		 *
*		 PART II: PREPARING THE 62-COUNTRY DATASETS FOR MERGING			 *
*		   																 *
**************************************************************************


* I then add the 'country_code' variable in the datasets trade62.dta 
* and dist62.dta to the remaining datasets just for the purpose of merging
* them all. This is done manually. I drop country_code afterwards.



**************************************************************************
*																		 *
*		   	  PART III: MERGING THE 62-COUNTRY DATASETS					 *
*		   																 *
**************************************************************************

use trade62
merge 1:1 country_code using "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\dist62.dta"
drop _merge
save "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\table1.dta", replace
merge 1:1 country_code using "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\var62i.dta"
drop _merge
merge 1:1 country_code using "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\var62j.dta"
drop _merge
save "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\table1.dta", replace
drop country_code
save "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\EconometricsII\Writing Assignment\Stata\table1.dta", replace
clear



**************************************************************************
*																		 *
*	 PART IV: CONVERTING THE 162-COUNTRY DATASETS INTO STATA FORMAT		 *
*		   																 *
**************************************************************************

*dist162
infile country_code dist adj using "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Data\tablelist\dist162.dat"
save "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\dist162.dta", replace
clear

*var162i
infile country_code locki worki areai using "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Data\tablelist\var162i.dat"
save "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\var162i.dta", replace
clear

*var162j
infile country_code lockj workj areaj using "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Data\tablelist\var162j.dat"
save "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\var162j.dta", replace
clear


**************************************************************************
*																		 *
*	   PART V: PREPARING THE 162-COUNTRY DATASETS FOR MERGING			 *
*		   																 *
**************************************************************************


* I then add the 'country_code' variable in the dataset var162i to the 
* remaining datasets just for the purpose of merging them all. This is 
* done manually.


**************************************************************************
*																		 *
*		   	  PART VI: MERGING THE 162-COUNTRY DATASETS					 *
*		   																 *
**************************************************************************

use dist162
merge 1:1 country_code using "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\var162i.dta"
drop _merge
save "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\tableA1.dta", replace
merge 1:1 country_code using "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\var162j.dta"
drop _merge
save "C:\Users\samso\Google Drive\University of Notre Dame\Spring 2020\Econometrics II\Writing Assignment\Stata\tableA1.dta", replace
clear

log close
