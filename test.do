********************************************************************************
*Author: Taka Masaki
*Last updated: 1/14/2020
*Description: This do file is created as a demo on how to use GitHub
********************************************************************************
clear
set obs 100
gen y=rnormal()
gen e=rnormal()
gen x=0.5*y + e
reg y x

sum y x e
kdensity y //create conflict here