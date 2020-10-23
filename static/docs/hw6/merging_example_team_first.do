clear

*Basic steps:
*Read in one data set, prepare it for merging and then save

import delimited data/team_info.csv
save team_info, replace

*Read in the second data set, prepare it for merging
import delimited data/sales_data.csv, clear
rename team_name sales_team

*Merge the datasets together. 
*The second dataset you prepared will be in memory and is the "master" data
*The first dataset you prepared is saved on disk and will be the "using" data
merge 1:m sales_team using team_info

*Check that the output of your merge makes sense
**List observations only in sales data
list if _merge == 1

**List observations only in team info
list if _merge == 2

**Drop data with typos
keep if _merge == 3

drop _merge

** compute total sales per team and average by sales people
collapse (sum) sale_total, by(sales_team num_team_members)

** compute average sales per person for each team
gen avg_sales_pp = sale_total/num_team_members
