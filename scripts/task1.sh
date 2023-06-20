# script to take directory as input and recursively count the directories and files within it.
# This also provides the summary at last
# show proper error if path not exist.

echo Enter path for directory
read path

    
# path="/home/vikrant/Data/IESoft/TrainingV2/scripts"

# cd $path

# find -type f | wc -l

echo ""
echo Directory: $path
cd $path

echo For given directory
totalFiles=$(find . -type f | wc -l)
totalDirs=$(find . -type d | wc -l)

echo Number of files: $totalFiles
echo Number of dirs: $totalDirs

echo ""
echo Details of sub-directory and files
count(){
    pwd
    echo '--------------' Directory: $1 '------------------------------'
    cd $1

    fileCount=$(find . -maxdepth 1 -type f | wc -l)
    echo Number of files: $fileCount

    dirCount=$(find . -maxdepth 1 -type d | wc -l)
    echo Number of dirs: $dirCount

    for i in $(find . -maxdepth 1 -type d ! -path '.');
    do  
        count $i
        
    done
    cd ..
}

count $path

echo ""
echo status: complete