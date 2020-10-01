log using "data_wrangling_final.smcl"

*import data
insheet using "data/clean_unemployment_data.csv"

*format string dates as dates
gen file_week_date = date(file_week_end, "MDY")
format file_week_date %td

gen claim_week_date = date(claim_week_end, "MDY")
format claim_week_date %td

drop file_week_end claim_week_end

*compute unemployment rate and check with rate from data
gen calculated_rate = round(continued_claim/covered_employment*100,.01)

preserve
keep if unemployment_rate != calculated_rate
restore

*pull out data for CT and MA
keep if inlist(state, "Connecticut", "Massachusetts")

*compute total monthly new claims by state
gen month = month(file_week_date)
gen year = year(file_week_date)

sort state year month
collapse (sum) initial_claims, by(state year month)

*graph monthly claims
gen month_start = mdy(month, 1, year)
format month_start %td
twoway (line initial_claims month_start), by(state)

log close
