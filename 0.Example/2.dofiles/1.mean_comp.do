clear


*===============================================================================
// Bring in the data
*===============================================================================
use "$dtapath\auto", clear
	
	// Variables we want to compare over groups
	local misvar price mpg trunk length turn displacement gear_ratio
	// Variables denoting the groups you want to compare over
	local grupo foreign
	
	//Initiate a counter
	local a=0
	foreach x of local misvar{
		foreach y of local grupo{
			mean `x' [aw=weight], over(`y')
			mat prom`a' = e(b)'
			mata: v = st_matrix("e(V)")
			mata: v = st_matrix("V`a'",sqrt(diagonal(v)))
			mat A`a' = prom`a',V`a'
			mat coln A`a' = Mean StdErr
			
			local var`a' = "`x'"
			local grupo`a' = "`y'"
			local ++a
		} //end of misvar
	} //End of grupo
	
	//subtract one from counter, since the loop before added one
	local a=`a'-1
	clear 
	
	forval z= 0 / `a'{
		clear
		
		svmat2 A`z', rnames(group) names(col)
		gen variable = "`var`z''"
		gen variable_grupo = "`grupo`z''"
		
		cap append using `uno', force
		tempfile uno
		save `uno'	
	} //End of Z
	
	gen concat = variable_grupo + "_" + group + "_" + variable

order concat, first
export excel using "$outpath/myexcel.xlsx", sheet("muestra") sheetreplace first(var)
	
	
