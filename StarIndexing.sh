#!/bin/bash

#SBATCH -A b2014097
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J trim-galore-check
#SBATCH -o /proj/b2014097/nobackup/Niyaz/logs/star-index.out
#SBATCH -e /proj/b2014097/nobackup/Niyaz/logs/star-index.err

module load bioinfo-tools
module load star/2.5.3a

STAR --runMode genomeGenerate --runThreadN 4 --genomeDir /proj/b2014097/nobackup/Niyaz/STAR/STAR-Index/ --genomeFastaFiles /proj/b2014097/nobackup/Niyaz/STAR/GRCh38.p10.genome.fa --sjdbGTFfile /proj/b2014097/nobackup/Niyaz/STAR/gencode.v27.annotation.gtf --sjdbOverhang 99

## --sjdbOverhang (specifies the length of the genomic sequence around the annotated junction to be used in constructing the splice junctions database. 
## Ideally, this length should be equal to the ReadLength-1, where ReadLength is the length of the reads. For instance, for Illumina 2x100b paired-end reads, the ideal value is 100-1=99. 
## In case of reads of varying length, the ideal value is max(ReadLength)-1. In most cases, a generic value of 100 will work as well as the ideal value.)
