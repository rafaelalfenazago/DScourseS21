install.packages("dplyr")
library(dplyr)
install.packages("pacman")
library(pacman)
pacman::p_load(tidyverse, magrittr, tsibble, zoo, COVID19)
df <- covid19(c("Brazil"))
df.ts.brazil <- as_tsibble(df, key=id, index=date)
df.ts.brazil %<>% mutate(new_cases = difference(confirmed))


ggplot(df.ts.brazil, aes(date, new_cases)) + geom_hline(yintercept = 75000) + geom_line(aes(y=rollmean(new_cases, 7, na.pad=TRUE))) + labs(y = "New Daily Cases in Brazil\n(7-day rolling average)", x = "Date") + theme_minimal()

df.ts.brazil %<>% mutate(new_deaths = difference(deaths),
                     CFR        = new_deaths/new_cases)

ggplot(df.ts.brazil, aes(date, CFR)) + geom_line(aes(y=rollmean(CFR, 7, na.pad=TRUE))) + labs(y = "Brazil Case Fatality Rate\n(7-day rolling average)", x = "Date") + theme_minimal()
ggplot(df.ts.brazil, aes(date, new_deaths)) + geom_hline(yintercept = 1000) + geom_line(aes(y=rollmean(new_deaths, 7, na.pad=TRUE))) + labs(y = "New Daily Deaths in Brazil\n(7-day rolling average)", x = "Date") + theme_minimal()


## In SP
df.sp <- covid19(country=c("Brazil"),level=2) %>% filter(key_alpha_2=="SP")
df.ts <- as_tsibble(df.sp, key=id, index=date)
df.ts %<>% mutate(new_cases = difference(confirmed))

ggplot(df.ts, aes(date, new_cases)) + geom_hline(yintercept = 750) + geom_line(aes(y=rollmean(new_cases, 7, na.pad=TRUE))) + labs(y = "New Daily Cases in São Paulo\n(7-day rolling average)", x = "Date") + theme_minimal()
ggplot(df.ts %>% filter(date>"2020-10-01"), aes(date, new_cases)) + geom_hline(yintercept = 750) + geom_line(aes(y=rollmean(new_cases, 7, na.pad=TRUE))) + labs(y = "New Daily Cases in São Paulo\n(7-day rolling average)", x = "Date") + theme_minimal()
ggplot(df.ts %>% filter(date>"2020-12-01"), aes(date, new_cases)) + geom_hline(yintercept = 750) + geom_line(aes(y=rollmean(new_cases, 7, na.pad=TRUE))) + labs(y = "New Daily Cases in São Paulo\n(7-day rolling average)", x = "Date") + theme_minimal()

df.ts %<>% mutate(new_deaths = difference(deaths),
                  CFR        = new_deaths/new_cases)

ggplot(df.ts, aes(date, CFR)) + geom_line(aes(y=rollmean(CFR, 7, na.pad=TRUE))) + labs(y = "Case Fatality Rate in São Paulo\n(7-day rolling average)", x = "Date") + theme_minimal()
