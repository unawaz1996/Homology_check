#!/bin/bash 

## Running magic blast to see accuracy of alignment 
## Date: 16-02-18

#SBATCH -p batch
#SBATCH -n 16
#SBATCH --time=2-00:00
#SBATCH --mem=120GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au


## Loading modules 
module load magicblast/1.3.0
module load GCC/6.3.0-2.27


ReadsDIR=//fast/users/a1654797/Second_try/Trimmed_sequences2nd/trim_galore
DatabaseDIR=//fast/users/a1654797/Octopus/Database_for_magicBlast
outDIR=/fast/users/a1654797/Magic_blast/Cuttlefish_Octopus/tab_format

if [ -d $outDIR]; then
	echo "echo $outDIR exists"
else 
	mkdir $outDIR
fi

cd ${ReadsDIR} 

FILES=$(ls *_R1_val_1.fq)


for f in ${FILES} ;
do 
	FILENAME=${f%_R1_val_1.fq}
	magicblast -db $DatabaseDIR/Octopus_database -infmt fastq -query ${ReadsDIR}/${FILENAME}_R1_val_1.fq  -query_mate ${ReadsDIR}/${FILENAME}_R2_val_2.fq -outfmt tabular -out $outDIR/${FILENAME}


done

echo "Program concludes:"
dat
