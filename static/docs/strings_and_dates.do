import delimited data/ACSDT1Y2019.B02001_metadata_2020-10-09T060941.csv, varnames(nonames) rowrange(3:22)
rename v1 variable_name
rename v2 variable_description

*extract the last character -- note different syntax than substr() in R
gen last_char = substr(variable_name, 11, 1) 

*a quick way to generate a variable whose value depends on another variable
gen variable_type = "Estimate"
replace variable_type = "MOE" if last_char == "M"

*a potentially safer way if there's a chance of other cases
gen var_type = ""
replace var_type = "Estimate" if last_char == "E"
replace var_type = "MOE" if last_char == "M"

*Split a variable into columns
split variable_description, p("!!") gen(descrip)
rename descrip1 type
rename descrip2 total
rename descrip3 race
rename descrip4 race_detail

*Find whether a string occurs within another string
*Same function can be used to figure out where a string occurs within another one
gen type3 = strpos(variable_description, "Estimate")>0

*Replace a substring with another one inside a string variable
gen modified_description = subinstr(variable_description, "Margin of Error", "MOE", 1)
replace modified_description = subinstr(modified_description, "Total:", "", 1) 

*combine strings together
gen combo = last_char + " = " + variable_type

clear

*work with dates
import delimited data/transaction_dates.csv

*create a string version and convert to date, format as date
gen saledate_string = string(saledate, "%8.0f")
gen sale_date = date(saledate_string, "YMD")
format sale_date %td

gen sale_datetime_string = saledate_string + " " + string(hour, "%2.0f") + ":" + string(minute, "%2.0f") + ":" + string(second, "%2.0f")
gen double sale_datetime = clock(sale_datetime_string, "YMD hms")
format sale_datetime %tc
