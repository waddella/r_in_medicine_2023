# r_in_medicine_2023
Tutorial in R in Medicine

# agenda


# getting startd
library(rtables)
names(ex_adsl)
View(ex_adsl)

# simple frequency table 1 variable
table(ex_adsl$ARM)
qtable(ex_adsl, "ARM")

# cross table
table(ex_adsl$COUNTRY, ex_adsl$ARM)
qtable(ex_adsl, "COUNTRY", "ARM")

# NAs > always shown in rtables
ex_adsl$COUNTRY[1] <- NA
table(ex_adsl$COUNTRY, ex_adsl$ARM, useNA = "always")
qtable(ex_adsl, "COUNTRY", "ARM", ...)

# using different aggregation function
aggregate(...)
qtable(ex_adsl, "COUNTRY", "ARM", aval = "AGE", afun = mean)

# nested
qtable(ex_adsl, c("COUNTRY", "SEX"), "ARM")

# nested 2
qtable(ex_adsl, c("COUNTRY", "SEX"), c("ARM", "ITTFL"))

# back to a simple example
qtable(ex_adsl, "COUNTRY", "ARM", aval = "AGE", afun = mean)

# multiple values
fivenum2 <- \(x) setNames(as.list(fivenum(x)), c("min", "Q1", "MED", "Q3", "max"))
qtable(ex_adsl, "COUNTRY", "ARM", aval = "AGE", afun = fivenum2)

# now to normal rtable framework
lyt <- basic_table() |>
  split_rows() |>
  split_cols() |>
  analyze()

basic_table(lyt, ex_adsl)

# nested 
lyt <- basic_table() |>
  split_rows() |>
  split_rows() |>
  split_cols() |>
  analyze()

basic_table(lyt, ex_adsl)


# what we learn today

# adverse events table

# .... now to rtables theory

 # faceting (ggplot2)
 #  - tables are graphic
 # layouts
 # row summaries
 # formatting (xx.xx)
 # N=xx & alternative counts
 # indent
 # ae table re-visitted

 # tlg-catalog
 # tern afun, sfun, hfun

 # model based table
 
 # split fun
 # tree
 # pathing (cross-checking & rmarkdown)
 # prune
