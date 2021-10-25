#!/bin/bash
# Copy right to Jae Mun Choi at Calici, co. Ltd. 2021
# This script move files into sub directory of defined size

echo "######################################################################"
echo ""
echo " This script will move too many files into subdirectories "
echo "                                    by Jae Mun Choi, Ph.D "
echo " Usage: place this script one directory above and dive in the excute"
echo " by bash ../toomany2sub.sh"
echo ""
echo "######################################################################"

# Get the file numbners in each subdirectory and the name of directory from user 
echo "Enter number of files in subdirectory (example:1000):"
read dir_size
echo "I will split files by ${dir_size}"
echo "Enter the name of subdirectory you want to creat (example: dir):"
read dir_name
echo ""
echo "I will creat subdirectories ${dir_name} folled by number"
echo ""

# dir_size=1000
# dir_name="pdf"

# Display number of files in the direcotry
num_files=$((`find . -maxdepth 1 -type f | wc -l`))
echo "Number of files in this directory: ${num_files}"
num_dir=$((${num_files}/${dir_size}+1))
echo "Number of subdirectories for generation: ${num_dir}"
# n=$((`find . -maxdepth 1 -type f | wc -l`/$dir_size+1))

# For loop to generate subdirectories
for i in `seq 1 $num_dir`;
do
    echo "Now creating $dir_name$i"
    mkdir -p "$dir_name$i";
    find . -maxdepth 1 -type f | head -n $dir_size | xargs -i mv "{}" "$dir_name$i"
done
