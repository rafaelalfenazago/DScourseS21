## 1/28/2021

git remote -v
git remote add upstream https://github.com/tyleransom/DScourseS21.git
git pull upstream master
git push origin master

## 2/2/2021

##############
## COMMANDS ## 
##############

ls ## list folders and files
cd PoblemSets/ ## goes to a specific folder (use shift to complete)
cd .. ## gets back to the previous folder
ls -al ## list properties of files
ls -alh  
pwd ## what directory I'm in
mkdir demonstration ##create folder named "demonstration"
touch myfile1.txt ## create an empty file named "myfile1"
nano myfile1.txt ## edit the file you just created
head (or tail) myfile1.txt ##shows the 6 first rows of file
head -100 myfile1.txt ## shows 100 first rows of file
rm myfile1.txt ## delete a file
rmdir demonstration ## delete a folder (only work if the directory is already empty)
rm -rf FOLDER ## delete the folder and everything in the folder
cp myfile1.txt file1.txt ## copy file with new name "file1"
diff myfile.txt file1.txt ## compares what's different between two files
mv file1.txt newfile.txt ## change the name of file1 to "newfile"
mv [FILE] ProblemSets ## move file to folder "ProblemSets"
ls R* ## show all the files starting with "R"
ls R?AD.md ## substitutes a letter and find it in the folder
find .-size +100k ## find files grater than 100mb
more/less {FILE] ## like head, but you can scrow down the file
head -50 README.md > redirected.md ## create a new file called "redirected" with the 50 lines from README.md
tail -50 README.md >> redirected.md ## append the last 50 lines of README.md to "redirected"
echo "phrase" > redirected.md ## add this phrase to the file
head -50 README.md | wc -l ## how many lines in the file README.md


## contact supercomputer
ssh ouecon053@schooner.oscer.ou.edu
logout ## logout

## cloning folder from github to the super computer
git clone https://github.com/rafaelalfenazago/DScourseS21.git

################
## 02/04/2021 ##
################

## copy a file to OSCER
scp -p README.md ouecon053@schooner.oscer.ou.edu:/home/ouecon053/README_test.md

## Do I have R installed? (at OSCER)
which R
## open R in OSCER
R
## exit R in OSCER
ctr + d 

git rm [filename.txt] ## remove file from git
git push origin master ## update git

################
## 02/11/2021 ##
################

# changing the default .txt software (terminal and OSCER)
git config --global core dot. editor "nano" #or vin

#Adding Dr. Ransom’s folder as the upstream
git remote add upstream [URL]

#How to update your fork in github: 
cd ~/DScourseS21 #1
git fetch upstream #2
git merge upstream/master -m “message” #3	
git push origin master #4
##or
git pull upstream master


## Creating and updating files
git status #1
git add [new file] PS2/* #2
git status #3
git commit -m “message” #4
git push origin master #5

################
## 02/18/2021 ##
################

## create "bin" folder
mkdir bin

#copying files to bin
cd ~/DScourseS21/SLURM/
cp -p *batch ~/bin/

## make files readable (treat it like linux command) to the system
chmod +x *batch ##chmod = change mode


## Running jobs on OSCER
ls -al *batch
nano .bash_profile

logout
log in


which Rbatch
cd DScourseS21/SLURM/
ls
cat test.R
nano ~/bin/Rbatch
Rbatch test.R test.Rlog 00:00:02 rafael_zago@ou.edu
ls -lt


##################################
### 02/23/2021 - Webscraping #####
##################################

install.packages("rvest") ## R package that takes website data 
                          ## and organize it into an easy structure
library(rvest)
library(tidyverse)


## how to donwload the website into R
url <- "https://en.wikipedia.org/wiki/Men%27s_100_metres_world_record_progression"
m100 <- read_html(url)


## 1) click on "inspect" on the thing that you want to import
## so you know what to import
## 2) Find out the object, right click on it and "copy selector"

# object I want to download:
#mw-content-text > div.mw-parser-output > table:nth-child(8)


m100df <- read_html(url)%>% ## download the webpage
html_nodes("#mw-content-text > div.mw-parser-output > table:nth-child(8)") %>% ## address
  `[[`(1) %>% ## first element of the list
       html_table(fill=TRUE) ## transform html table into a table

## OR 

m100df_2 <- html_table(html_nodes(read_html(url), 
"#mw-content-text > div.mw-parser-output > table:nth-child(8)")[[1]])


### Trying by myself (2nd table)

m100df_1972_1976 <- read_html(url)%>% ## download the webpage
  html_nodes("#mw-content-text > div.mw-parser-output > table:nth-child(14)") %>% ## address
  `[[`(1) %>% ## first element of the list
  html_table(fill=TRUE) ## transform html table into a table

## (3rd table)
m100df_1977 <- read_html(url)%>% ## download the webpage
  html_nodes("#mw-content-text > div.mw-parser-output > table:nth-child(19)") %>% ## address
  `[[`(1) %>% ## first element of the list
  html_table(fill=TRUE) ## transform html table into a table

## How many types D. Trump lied
## see github TrumpLies.Rmd




install.packages("polite")
library(polite) ## check if you can/can't webscrape some site

url <- "https://en.wikipedia.org/wiki/Men%27s_100_metres_world_record_progression"
m100 <- read_html(url)
m100 <- scrape(bow(url))

m100df <- read_html(url)%>% ## download the webpage
  html_nodes("#mw-content-text > div.mw-parser-output > table:nth-child(8)") %>% ## address
  `[[`(1) %>% ## first element of the list
  html_table(fill=TRUE) ## transform html table into a table



####################
### 02/25/2021 #####
####################

install.packages("fredr")
## API (Application Program Interface) - 
## different applications can interact with each other
## such as download a json file and convert it to a table in R


install.packages("usethis")
## put your API keys into this file so you can 
## get it anytime you want
usethis::edit_r_environ()

## EXAMPLE OF USING DATAFROM FRED
library(tidyverse)
library(fredr)

## use FRED API Key
Sys.getenv("FRED_API_KEY")

########################################################
## example of how it works when using an R package    ##
## and an API                                         ##
##                                                    ##
## df <- some_api_function("FRED_series_we_want",     ##
##                     key=Sys.getenv("FRED_API_KEY"))##
########################################################

## 1) 
## download GNP data from FRED using API key

df <- fredr(
  series_id = "GNPCA",
  observation_start = as.Date("1948-01-01"),
  observation_end = as.Date("2020-01-01")
)

#### COVID example
install.packages("dplyr")
library(dplyr)
install.packages("pacman")
library(pacman)
pacman::p_load(tidyverse, magrittr, tsibble, zoo, COVID19)
df <- covid19(c("US"))
df.ts.us <- as_tsibble(df, key=id, index=date)
df.ts.us %<>% mutate(new_cases = difference(confirmed))


ggplot(df.ts.us, aes(date, new_cases)) + geom_hline(yintercept = 75000) + geom_line(aes(y=rollmean(new_cases, 7, na.pad=TRUE))) + labs(y = "New Daily Cases in US\n(7-day rolling average)", x = "Date") + theme_minimal()

df.ts.us %<>% mutate(new_deaths = difference(deaths),
                     CFR        = new_deaths/new_cases)

ggplot(df.ts.us, aes(date, CFR)) + geom_line(aes(y=rollmean(CFR, 7, na.pad=TRUE))) + labs(y = "US Case Fatality Rate\n(7-day rolling average)", x = "Date") + theme_minimal()

df.ok <- covid19(country=c("US"),level=2) %>% filter(key_alpha_2=="OK")
df.ts <- as_tsibble(df.ok, key=id, index=date)
df.ts %<>% mutate(new_cases = difference(confirmed))

ggplot(df.ts, aes(date, new_cases)) + geom_hline(yintercept = 750) + geom_line(aes(y=rollmean(new_cases, 7, na.pad=TRUE))) + labs(y = "New Daily Cases in Oklahoma\n(7-day rolling average)", x = "Date") + theme_minimal()
ggplot(df.ts %>% filter(date>"2020-10-01"), aes(date, new_cases)) + geom_hline(yintercept = 750) + geom_line(aes(y=rollmean(new_cases, 7, na.pad=TRUE))) + labs(y = "New Daily Cases in Oklahoma\n(7-day rolling average)", x = "Date") + theme_minimal()
ggplot(df.ts %>% filter(date>"2020-12-01"), aes(date, new_cases)) + geom_hline(yintercept = 750) + geom_line(aes(y=rollmean(new_cases, 7, na.pad=TRUE))) + labs(y = "New Daily Cases in Oklahoma\n(7-day rolling average)", x = "Date") + theme_minimal()

df.ts %<>% mutate(new_deaths = difference(deaths),
                  CFR        = new_deaths/new_cases)

ggplot(df.ts, aes(date, CFR)) + geom_line(aes(y=rollmean(CFR, 7, na.pad=TRUE))) + labs(y = "Case Fatality Rate in Oklahoma\n(7-day rolling average)", x = "Date") + theme_minimal()

# Cleveland County
df.clev <- covid19(country=c("US"),level=3) %>% filter(administrative_area_level_2=="Oklahoma" & administrative_area_level_3=="Cleveland")
df.ts <- as_tsibble(df.clev, key=id, index=date)
df.ts %<>% mutate(new_cases = difference(confirmed))

ggplot(df.ts, aes(date, new_cases)) + geom_hline(yintercept = 50) + geom_line(aes(y=rollmean(new_cases, 7, na.pad=TRUE))) + labs(y = "New Daily Cases in Cleveland County\n(7-day rolling average)", x = "Date") + theme_minimal()
ggplot(df.ts %>% filter(date>"2020-10-01"), aes(date, new_cases)) + geom_hline(yintercept = 50) + geom_line(aes(y=rollmean(new_cases, 7, na.pad=TRUE))) + labs(y = "New Daily Cases in Cleveland County\n(7-day rolling average)", x = "Date") + theme_minimal()
ggplot(df.ts %>% filter(date>"2020-12-01"), aes(date, new_cases)) + geom_hline(yintercept = 50) + geom_line(aes(y=rollmean(new_cases, 7, na.pad=TRUE))) + labs(y = "New Daily Cases in Cleveland County\n(7-day rolling average)", x = "Date") + theme_minimal()

## 3) 

## Another example
install.packages("rscorecard")
library(rscorecard)
## r college scorecard package
## https://github.com/btskinner/rscorecard

## using api key from us gov website
sc_key(Sys.getenv("US_GOV_API_KEY"))

## download some data 
df <- sc_init() %>% 
  sc_filter(region == 2, ccbasic == c(21,22,23), locale == 41:43) %>% 
  sc_select(unitid, instnm, stabbr, ugds) %>% 
  sc_year("latest") %>% 
  sc_get()
  
### archive.org

##################
##### March 4th ##
##################

# ggplot

library(datasets)
library(datasets)
library(ggplot2)

data(iris)
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + geom_point()

plen <- ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width))
plen + geom_point()  + coord_flip() ## "+" signs add more embelishments

## geom_smooth() - adds a regression line at ggplot

## ggplot cheat sheet
## https://rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf

## good practices for graphs
## https://socviz.co/gettingstarted.html

install.packages("ggthemes")

library("tidyverse")
library(ggthemes)

## mpg data set example
mpg <- as_tibble(mpg)
ggplot(data=mpg, 
       aes(x=cty, y=hwy)) 

ggplot(data=mpg, 
       aes(x=cty, y=hwy), geom_point()) ##wrong syntex

ggplot(data=mpg, 
       aes(x=cty, y=hwy)) + geom_point() ## correct syntex

ggplot(data=mpg, 
       aes(x=cty, y=hwy)) + geom_jitter() ## remove those dots on the same value in the x axis

ggplot(data=mpg, 
       aes(x=cty, y=hwy)) + geom_jitter() +
       theme_bw()  ## changing the background

ggplot(data=mpg, 
       aes(x=cty, y=hwy)) + geom_jitter() +
       theme_minimal()  ## changing the background

## 3rd dimensional visualization
mpg
?mpg

ggplot(data=mpg, 
       aes(x=cty, y=hwy, 
       size=as.factor(manufacturer))) + 
       geom_jitter() +
       theme_minimal()  ## by manufacturer, but very good use of "size"


ggplot(data=mpg, 
  aes(x=cty, y=hwy)) + 
  geom_jitter(aes(color=as.factor(manufacturer))) +
  theme_minimal()  ## by manufacturer, but still not very good 

ggsave("plot_name.png") ## saving ggplot to your directory

ggplot(data=mpg, 
       aes(x=cty, y=hwy)) + 
  geom_jitter(aes(color=as.factor(year))) +
  theme_minimal()  ## by year, but still not very good 

## adding a label

ggplot(data=mpg, 
       aes(x=cty, y=hwy)) + 
  geom_label(aes(label=as.factor(year))) +
  theme_minimal()

## other types of plots 

## kernel density

ggplot(data=mpg, 
       aes(x=cty)) + 
  geom_density() +
  theme_minimal()

## histogram

ggplot(data=mpg, 
       aes(x=cty)) + 
  geom_histogram() +
  theme_minimal()

## bar graph

ggplot(data=mpg, 
       aes(x=cty)) + 
  geom_bar() +
  theme_minimal()


## box plot

ggplot(data=mpg, 
       aes(y=cty)) + 
  geom_boxplot() +
  theme_minimal()

ggplot(data=mpg, 
       aes(y=cty, x=as.factor(year))) + 
  geom_boxplot() +
  theme_minimal()

ggplot(data=mpg, 
       aes(y=cty, x=as.factor(manufacturer))) + 
  geom_boxplot() +
  theme_minimal() + 
  theme(axis.text.x = 
          element_text(angle=45, hjust=1)) + ## change the lables on the x axis
  labs(y = "City Fuel Economy", ## add y axis label
       x= "Vehicle Make", 
       caption = paste0(
         "Number of observations:", dim(mpg[1])
       )) ## adding number of observations in the graph



ggplot(data=mpg, 
       aes(x=cty, y=hwy)) + 
  geom_jitter() +
  theme_minimal() +
  facet_wrap(vars(as.factor(manufacturer)),
             ncol=4) ##  scatter plot by manufacturer
                     ## in 4 columns
#changing themes
ggplot(data=mpg, 
       aes(x=cty, y=hwy)) + 
  geom_jitter() +
  theme_economist() +
  facet_wrap(vars(as.factor(year)),
             ncol=2) ##  scatter plot by year and with the economist theme
  

ggplot(data=mpg, 
       aes(x=cty, y=hwy)) + 
  geom_jitter() +
  theme_fivethirtyeight() +
  facet_wrap(vars(as.factor(year)),
             ncol=2)
   
ggplot(data=mpg, 
       aes(x=cty, y=hwy)) + 
  geom_jitter() +
  theme_tufte() +
  facet_wrap(vars(as.factor(year)),
             ncol=2)

ggplot(data=mpg, 
       aes(x=cty, y=hwy)) + 
  geom_jitter() +
  geom_rangeframe()+ ##adding the axis linking min and max for each variable
  theme_tufte() +
  facet_wrap(vars(as.factor(year)),
             ncol=2)
                
## hex graph
install.packages("hexbin")

ggplot(data=mpg, 
       aes(x=cty, y=hwy)) + 
  geom_hex() +
  theme_minimal()

ggplot(data=mpg, 
       aes(x=cty, y=hwy)) + 
  geom_bin2d() +
  theme_minimal()









