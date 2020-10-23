clear

*Basic steps:
*Read in one data set, prepare it for merging and then save

import delimited data/sales_data.csv
save sales_data, replace

*Read in the second data set, prepare it for merging
import delimited data/team_info.csv, clear
rename sales_team team_name

*Merge the datasets together. 
*The second dataset you prepared will be in memory and is the "master" data
*The first dataset you prepared is saved on disk and will be the "using" data
merge 1:m team_name using sales_data

*Check that the output of your merge makes sense
**List observations only in team info
list if _merge == 1

**List observations only in sales data
list if _merge == 2

**Drop data with typos
keep if _merge == 3

drop _merge

** compute total sales per team and average by sales people
collapse (sum) sale_total, by(team_name num_team_members)

** compute average sales per person for each team
gen avg_sales_pp = sale_total/num_team_members
