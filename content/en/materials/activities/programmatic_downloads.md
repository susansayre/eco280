---
title: "Downloading data programmatically"
author: "Susan Sayre"
weight: 7
output: 
  md_document:
    preserve_yaml: true
    pandoc_args: ["--wrap=preserve"]
---

This page includes information and code related to the activities demonstrated in class on 11/9/20 and 11/18/20. The Slack posts with the recording links are: [11/9 recording](https://smi-eco280-02-202101.slack.com/archives/C019JD2AK7H/p1604946887000500) and [11/18 recording](https://smi-eco280-02-202101.slack.com/archives/C019JD2AK7H/p1605725331001200).

## General information

In many cases, data that we wish to download is available online in many separate files that share a common structure. If the number of files is large enough, we may want to write a program to download the data. Even if the number of files are small, it can be helpful to write a program to download the data so that you can share your program *without* the data and let someone else run the code. In general, code files are small, while data is large. As a result, it is convenient to avoid storing data on places like github or emailing large datafiles back and forth.

While the focus here is on constructing short programs to download files, the techniques are more general. We can write functions or construct forvalues or foreach loops to accomplish many types of repetitive tasks.

## Single loops

For our single loop example, we're going to construct a program to download the annual aqi data by county in the US for the years 2014 through 2018. The files are available on the [EPA Air data page](https://aqs.epa.gov/aqsweb/airdata/download_files.html#Annual)

### R

The code to download, unzip and read-in a single file is

```
download.file(url = "https://aqs.epa.gov/aqsweb/airdata/annual_aqi_by_county_2014.zip"),
                destfile = "aqi_data/2014.zip")
  unzip("aqi_data2014.zip", exdir = "aqi_data")
  aqi_data <- read_csv("aqi_data/annual_aqi_by_county_2014.csv"),
                       skip = 1,
                       col_names = c("state",
                                     "county",
                                     "year",
                                     "aqi_days",
                                     "aqi_good",
                                     "aqi_moderate",
                                     "aqi_sensitive",
                                     "aqi_unhealthy",
                                     "aqi_v_unhealthy",
                                     "aqi_hazardous",
                                     "max_aqi",
                                     "p90_aqi",
                                     "med_aqi",
                                     "days_co",
                                     "days_no2",
                                     "days_ozone", 
                                     "days_so2",
                                     "days_pm2.5",
                                     "days_pm10"))
```

Note that the `aqi_data` folder must exist before running this code. To turn this into a loop, we need to construct a function that take the year as an argument and puts the year into the relevant parts of the code.

The general code to construct a function in R looks like this:

```
function_name <- function(argument) {
  
  code statements that are executed when the function is called
  anytime you use the object argument, it is replaced with the value
}
```

As a simple example, this code creates a function to compute the mean of a vector

```
compute_mean <- function(x_vector){
  mean_x = sum(x_vector)/length(x_vector)
}
```

In our example, we construct a function to read in the data using this code

```
download_aqi_data <- function(year){

  download.file(url = str_c("https://aqs.epa.gov/aqsweb/airdata/annual_aqi_by_county_", year, ".zip"),
                destfile = str_c("aqi_data/", year, ".zip"))
  unzip(str_c("aqi_data/", year, ".zip"), exdir = "aqi_data")
  aqi_data <- read_csv(str_c("aqi_data/annual_aqi_by_county_", year, ".csv"),
                       skip = 1,
                       col_names = c("state",
                                     "county",
                                     "year",
                                     "aqi_days",
                                     "aqi_good",
                                     "aqi_moderate",
                                     "aqi_sensitive",
                                     "aqi_unhealthy",
                                     "aqi_v_unhealthy",
                                     "aqi_hazardous",
                                     "max_aqi",
                                     "p90_aqi",
                                     "med_aqi",
                                     "days_co",
                                     "days_no2",
                                     "days_ozone", 
                                     "days_so2",
                                     "days_pm2.5",
                                     "days_pm10"))
}
```

When we run this section, R will add the function `download_aqi_data` to the Functions section of our environment tab. We can then call the function by running something like

```
data_2014 <- download_aqi_data(2014)
```

The next step is to use the `lapply` function to run the code for many possible values of year. We first construct a list of years

```
years <- seq(2014,2018,1)
```

Then, we run

```
air_data <- lapply(years, download_aqi_data) %>% bind_rows()
```

which is short-hand for saying run the following series of commands and stack the rows together

```
download_aqi_data(2014)
download_aqi_data(2015)
download_aqi_data(2016)
download_aqi_data(2017)
download_aqi_data(2018)
```

R does also have the ability to construct for loops like Stata, although it is generally discouraged for speed reasons. You can read about how to construct [for loops here](https://www.r-bloggers.com/2015/12/how-to-write-the-first-for-loop-in-r/).

### Stata

While we can write functions in Stata as well, the simpler way to accomplish this task is using a for loop. First, we find the code to download, unzip and load a single file.

```
copy https://aqs.epa.gov/aqsweb/airdata/annual_aqi_by_county_2014.zip aqi_2014.zip
unzipfile aqi_2014.zip, replace
import delimited annual_aqi_by_county_2014.csv, clear
save aqi_data_2014, replace

```

Since we're looping through values, we can use a `forvalues` loop to do this for several different years.

```
forvalues i = 2014/2018 {
	copy https://aqs.epa.gov/aqsweb/airdata/annual_aqi_by_county_`i'.zip aqi_`i'.zip
	unzipfile aqi_`i'.zip, replace
	import delimited annual_aqi_by_county_`i'.csv, clear
    save aqi_data_`i', replace
}
```
To combine the datasets together, we use the append function and a separate loop. First, we clear the data and then we sequentially add each of the files we created before.

```
clear
forvalues i = 2014/2018 {
	append using aqi_data_`i'
	}
```

## Double loops

The loops above work well when only one element changes. But sometimes we need to iterate across two different dimensions. For instance, if we want to download the annual aqi data for both counties and CBSAs, we want to loop through the different geographies **and** through the different years. In that case we need to create a double loop.

### R
As is typical, there are several ways to do this. R has options for defining functions with two different arguments and looping through both loops, but we're going to use a simpler approach to minimize the different syntax options we need to keep track of. To do this, we're going to define a second function inside our first function.

```
years <- seq(2015,2017,1)
geographies <- c("county", "cbsa")

download_yearly_data <- function(year){
  
  download_geography_data <- function(geography) {
    
    download.file(url = str_c("https://aqs.epa.gov/aqsweb/airdata/annual_aqi_by_", geography, "_", year, ".zip"),
                  destfile = str_c("aqi_data/", geography, "_", year, ".zip"))
    unzip(str_c("aqi_data/", geography, "_", year, ".zip"), exdir = "aqi_data")
    aqi_data <- read_csv(str_c("aqi_data/annual_aqi_by_", geography, "_", year, ".csv"),
                         skip = 1,
                         col_names = c("geo1",
                                       "geo2",
                                       "year",
                                       "aqi_days",
                                       "aqi_good",
                                       "aqi_moderate",
                                       "aqi_sensitive",
                                       "aqi_unhealthy",
                                       "aqi_v_unhealthy",
                                       "aqi_hazardous",
                                       "max_aqi",
                                       "p90_aqi",
                                       "med_aqi",
                                       "days_co",
                                       "days_no2",
                                       "days_ozone", 
                                       "days_so2",
                                       "days_pm2.5",
                                       "days_pm10")) %>% 
      mutate(geo2 = as.character(geo2))
  }
  
  aqi_year_data <- lapply(geographies, download_geography_data) %>% bind_rows()
  
}

aqi_data <- lapply(years, download_yearly_data) %>% bind_rows()

```

In this example, we had to change the geographic identifier variables to allow us to combine the two different types of files together.


### Stata

In Stata, we'll used a nested for loop. Our original loop was a `forvalues` loop that is designed specifically for looping through (numeric) values. Since our second loop is through different strings, we need to use a `foreach` loop. 
We first construct a nested loop to download, unzip and load all the files.

```
forvalues i = 2014/2015 {

	foreach j in "county" "cbsa" {
		copy https://aqs.epa.gov/aqsweb/airdata/annual_aqi_by_`j'_`i'.zip aqi_`j'_`i'.zip
		unzipfile aqi_`j'_`i'.zip, replace
		import delimited annual_aqi_by_`j'_`i'.csv, clear
		save aqi_data_`j'_`i', replace
	}
}
clear

```

Next, we consider how to combine the datasets together. There are a couple of options here. First, we could combine all the data together this way:

```
forvalues i = 2014/2015 {
	foreach j in "county" "cbsa" {
		append using aqi_data_`j'_`i'
	}
}
```

This will work although the first half of our data will have variables for the state and county but not the cbsa or cbsacode and the second half will be the reverse. It might be more natural to create two separate datasets. We could do this with two separate loops or with a double loop nested in the other order.

```
foreach j in "county" "cbsa" {
	 forvalues i = 2014/2015 {
		append using aqi_data_`j'_`i'
	}
	
	save aqi_data_`j'
	clear
}
```