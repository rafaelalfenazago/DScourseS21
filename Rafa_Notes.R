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

test











