# rtables workshop R in Medicine
# June 6, 2023
# Gabriel Becker and Adrian Waddell


# Install rtables packages and dependencies ----
install.packages(c("rtables", "remotes"))
remotes::install_github("insightsengineering/rtables", ref = "qtable_and_experimental_ard") # for workshop


# Getting started ----

# Data
library(rtables)

# synthetic adsl data
head(ex_adsl)
names(ex_adsl)

# R base table function
table(ex_adsl$ARM)
table(ex_adsl$SEX, ex_adsl$ARM)

# Now with qtable in rtables

library(rtables)
qtable(ex_adsl, "ARM")
qtable(ex_adsl, "SEX", "ARM")

# nested frequency tables
qtable(ex_adsl, c("COUNTRY", "SEX"), "ARM")

# using a aggregation function other than count
qtable(ex_adsl, c("COUNTRY", "SEX"), "ARM", avar = "AGE", afun = mean)

# multiple analysis values
fivenum2 <- \(x) setNames(as.list(fivenum(x)), c("min", "Q1", "MED", "Q3", "max"))
qtable(ex_adsl, "SEX", "ARM", avar = "AGE", afun = fivenum2)

# now using rtable's core way of defining a table

lyt <- basic_table() |>
  split_cols_by("ARM") |>
  split_rows_by("SEX") |>
  analyze("AGE", afun = fivenum2, format = "xx.xx")

build_table(lyt, ex_adsl)


# Basics of rtables ----

lyt <- basic_table() |>
  split_cols_by("ARM") |>
  analyze("AGE", mean, format = "xx.xx")

tbl <- build_table(lyt, ex_adsl)

print(tbl)


# Layout Generating Functions ----




# NAs > always shown in rtables
ex_adsl$COUNTRY[1] <- NA
table(ex_adsl$COUNTRY, ex_adsl$ARM, useNA = "always")
qtable(ex_adsl, "COUNTRY", "ARM", ...)

# using different aggregation function
aggregate(...)
qtable(ex_adsl, "COUNTRY", "ARM", aval = "AGE", afun = mean)



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
