#!/bin/bash 

resultdir=home/proyectos/microbioma/rastrojo/
workdir=/temporal/rastrojo/output

#--Check if workdir exits, if so delete it, and then create it 
if [ -d $workdir ]
	then
	rm -fr $workdir
fi
mkdir -p $workdir
cd $workdir # entering workdir

#--Copy required data to temporal folder
cp /home/proyectos/microbioma/rastrojo/data/file_R1.fastq $workdir
cp /home/proyectos/microbioma/rastrojo/data/file_R2.fastq $workdir

#--Running 
module load spades/3.15.4
spades.py --careful -t 24 -1 file_R1.fastq -2 file_R2.fastq -o assembly_output
module unload spades/3.15.4

#--Copy results 
cp -r assembly_output $resultdir

#--Remove working directory to release disk space 
rm -rf $workdir