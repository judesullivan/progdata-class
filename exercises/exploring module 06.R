# 3/1 Class -- Organizing Projects

library(gapminder)
library(tidyverse)

(gap_asia_2007 <- gapminder |> filter(year == 2007, continent == "Asia"))

write_csv(gap_asia_2007, "exported_file.csv")

#write file paths using here::here !!! creates relative file paths for different users

write_csv(gap_asia_2007, 
          here::here("data", "gap_asia_2007.csv")
)

#reading the exported file back in 

dat <- read_csv(here::here("data", "gap_asia_2007.csv"))
dat

#cols() function allows you to control the type of column
# .default means everthing else not specified 
# this is better than read_csv if the columns are not in an expected format once imported (e.g., a population column says chr for character instead of dbl for numeric)

dat <- read_csv(
  here::here("participation", "data", "gap_asia_2007.csv"),
  col_types = cols(
    country = col_factor(),
    continent = col_factor(),
    year = col_date(format = "%Y"),
    .default = col_double() # all other columns as numeric (double)
  )
)
dat

#last major argument is "na" --> what things should be treated as missing data

dat <- read_csv(
  here::here("participation", "data", "gap_asia_2007.csv"),
  col_types = cols(
    country = col_factor(),
    continent = col_factor(),
    year = col_date(format = "%Y"),
    .default = col_double() # all other columns as numeric (double)
  ),
  na = c("", "NA", -99, "No response")
)
dat

#read_csv2 is used for European documents that are delineated by a semicolon rather than a comma

#reading excel files

library(readxl)

readxl::read_excel()

#haven() used for files from statistical softwares like spss, stata, sas

(clevel <- haven::read_spss(
  here::here("participation", "data", "clevel.sav")
)
)
