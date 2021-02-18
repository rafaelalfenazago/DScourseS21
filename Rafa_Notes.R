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





