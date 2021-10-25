#!/bin/bash
# Copy right to Jae Mun Choi at Calici, co. Ltd. 2021
# This script move files into sub directory of defined size

dir_size=1000
dir_name="pmc"
n=$((`find . -maxdepth 1 -type f | wc -l`/$dir_size+1))
for i in `seq 1 $n`;
do
    mkdir -p "$dir_name$i";
    find . -maxdepth 1 -type f | head -n $dir_size | xargs -i mv "{}" "$dir_name$i"
done
