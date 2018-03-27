#!/bin/bash 

#aligning the cuttlefish reads to the Octopus genome

#SBATCH -p batch
#SBATCH -n 12
#SBATCH --time=3-00:00
#SBATCH --mem=120GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au


## Loading modules 

module load STAR/2.5.3a-foss-2016b
module load GCC/6.3.0-2.27
module load SAMtools/1.3.1-foss-2016b
module load BamTools/2.4.1-foss-2016uofa


#directories to the locations of reads 

ReadsDIR=//fast/users/a1654797/Second_try/Trimmed_sequences2nd/trim_galore
indexedDIR=//fast/users/a1654797/Octopus/Octupus_indexes

#output directories 

alignDIR=//fast/users/a1654797/STAR_alignments/Cuttlefish/first_alignment_default 


#record
record=//fast/users/a1654797/STAR_alignments/Cuttlefish/record/recordAlignment2.txt 
recordDIR=//fast/users/a1654797/STAR_alignments/Cuttlefish/record

if [ -f ${record} ]; then
	rm ${record}
	touch ${record}
    echo "${record} exists, replacing" >> ${record} 2>&1
else
    touch ${record}
    echo "${record} did not exist, now does" >> ${record} 2>&1
fi

cd ${ReadsDIR}
READ=$(ls *_R1_val_1.fq)

for file in ${READ}; 
do
	readname=${file%_R1_val_1.fq}

	echo "Running STAR for ${readname} aganist Octopus genome" >> ${record} 2>&1
	STAR --genomeDir ${indexedDIR} --sjdbGTFfile $indexedDIR/Annotation/GCF_001194135.1_Octopus_bimaculoides_v2_0_genomic.gtf --readFilesIn ${ReadsDIR}/${readname}_R1_val_1.fq ${ReadsDIR}/${readname}_R2_val_2.fq --outFileNamePrefix ${alignDIR}/${readname}.STAR --outSAMstrandField intronMotif --outSAMattributes All --outSAMtype BAM SortedByCoordinate --alignSoftClipAtReferenceEnds No  2> align.err

done
