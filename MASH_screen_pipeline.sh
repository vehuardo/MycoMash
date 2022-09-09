#!/bin/bash
# Sequences to be queried must be in "test_seqs" folder. Or change folder name accordingly below

for file in ./test_seqs/*.fastq.gz
do
    sample=${file}
    sample_name="${sample}"

    mash screen Myco_db_v2.msh ${sample} > ${sample}_vs_MycoDB_v2.tab
    sort -gr ${sample}_vs_MycoDB_v2.tab | head > ${sample}_vs_MycoDB_v2_sorted.txt
done