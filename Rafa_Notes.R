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


usethis::edit_r_environ()


## EXAMPLE OF USING DATAFROM FRED

## use FRED API Key
sys.getenv("FRED_API_KEY")


library(tidyverse)
library(fredr)

## use your FRED API key
df <- sum_api_function("FRED_series_we_want", 
                     key=Sys.getenv("FRED_API_KEY"))

## download data from FRED using API key
df <- fredr(
  series_id = "GNPCA",
  observation_start = as.Date("1948-01-01"),
  observation_end = as.Date("2020-01-01")
)


## ANOTHER EXAMPLE 
install.packages("rscorecard")
library(rscorecard)

## using api key from us gov website
sc_key(Sys.getenv("US_GOV_API_KEY"))

## download some data 

df <- sc_init() %>%
  sc_filter(region ==2, ccbasic==c(21,22,23),
  sc_select(unitid, instnm, stabbr, uods) %>%
  sc_year("latest")%>%... ##(see when watching the class)
  
### archive.org
  
  






