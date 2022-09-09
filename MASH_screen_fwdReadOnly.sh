#!/bin/bash
# Must be in "Run" folder. (All isolates exist as folders in the current directory)

basedir=$(pwd)
runname=${basedir##*/}

# MASH

for dir in $(ls -d */)
do
    cd ${dir}
	R1=$(ls *R1_001.fastq.gz)
    # sketch screen (winner takes all) 
    mash screen -w -p 4 MycoDB_s1000.msh *R1_001.fastq.gz > ${R1%%_*}_screen.tab
    sort -gr ${R1%%_*}_screen.tab | head
    sort -gr ${R1%%_*}_screen.tab > ${R1%%_*}_MASH-hits_sorted.tab
	cd "${basedir}"
done

