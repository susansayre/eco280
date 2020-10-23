clear

import excel data/nst-est2019-01.xlsx, cellrange("A4:M62") firstrow
rename A state_name

*remove leading . on state names
replace state_name = subinstr(state_name,".","",1)

*The trick below will rename all of the annual population estimates at once
rename (D-M) pop201#, addnumber(0)

keep state_name pop*
reshape long pop, i(state_name) j(year)

list in 1/6

reshape wide pop, i(state_name) j(year)

list in 1/6