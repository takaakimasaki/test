*===============================================================================
// Example - Equity Policy Lab, Poverty & Equity GP, World Bank
*===============================================================================
set more off
clear all
version 14

if (lower("`c(username)'")=="wb378870"){
	global main "C:\Users\wb378870\OneDrive - WBG\000.EquityPolicyLab\0.Example" //Paul Corral's Path
}
else{ //Place your path on the file below
	global main 
}
global dtapath 		"$main/1.data"
global dopath  		"$main/2.dofiles"
global outpath 		"$main/3.output"
global theadopath   "$dopath/0.ados"


*===============================================================================
// DO NOT MODIFY BEYOND THIS POINT
*===============================================================================

*===============================================================================
// DO FILES
*===============================================================================

do "$dopath/1.mean_comp.do"

shell "myexcel.xlsx"