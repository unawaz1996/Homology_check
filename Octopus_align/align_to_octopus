#!/bin/bash 

#aligning reads using STAR with multiple patameters

#SBATCH -p highmem
#SBATCH -n 16
#SBATCH --time=3-00:00
#SBATCH --mem=300GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au


## Loading modules 

module load STAR/2.5.3a-foss-2016b
module load GCC/6.3.0-2.27
module load SAMtools/1.3.1-foss-2016b
module load BamTools/2.4.1-foss-2016uofa

# Directories 
ReadsDIR=//fast/users/a1654797/Second_try/Trimmed_sequences2nd/trim_galore
indexedDIR=//fast/users/a1654797/Octopus/Octupus_indexes

#Output
alignDIR=//fast/users/a1654797/STAR_alignments/Cuttlefish/Additional_parameters
alignOutDIR=//fast/users/a1654797/STAR_alignments/Cuttlefish/extendedAlignmentOutputData

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

#Parameter recording files
parameterDIR=${alignOutDIR}/Parameters
multimaps=${parameterDIR}/ParametersMaps.txt
mismatches=${parameterDIR}/ParametersMatch.txt



if [ -d $alignDIR ]; then
    echo "Folder $alignDIR exists ... replacing" >> ${record} 2>&1
    rm -r ${alignDIR}
    mkdir ${alignDIR}
else
    mkdir $alignDIR
    echo "Folder $alignDIR does not exist, making $alignDIR" >> ${record} 2>&1
fi

if [ -d $alignOutDIR ]; then
    echo "Folder $alignOutDIR exists ... replacing" >> ${record} 2>&1
    rm -r ${alignOutDIR}
    mkdir ${alignOutDIR}
else
    mkdir $alignOutDIR
    echo "Folder $alignOutDIR does not exist, making $alignOutDIR" >> ${record} 2>&1
fi

if [ -d $parameterDIR ]; then
    echo "Folder $parameterDIR exists ... replacing" >> ${record} 2>&1
    rm -r ${parameterDIR}
    mkdir ${parameterDIR}
else
    mkdir $parameterDIR
    echo "Folder $parameterDIR does not exist, making $parameterDIR" >> ${record} 2>&1
fi

if [ -f ${multimaps} ]; then
	rm ${multimaps}
	touch ${multimaps}
    echo "${multimaps} exists, replacing" >> ${record} 2>&1
else
    touch ${multimaps}
    echo "${multimaps} did not exist, now does" >> ${record} 2>&1
fi

if [ -f ${mismatches} ]; then
	rm ${mismatches}
	touch ${mismatches}
    echo "${mismatches} exists, replacing" >> ${record} 2>&1
else
    touch ${mismatches}
    echo "${mismatches} did not exist, now does" >> ${record} 2>&1
fi

#Alignment parameters 
SCORE=( "0.10" "0.25" "0.50")
MATCH=("0.10" "0.25" "0.50")

echo "Commencing alignments" >> ${record} 2>&1
TZ=Australia/Adelaide date >> ${record} 2>&1

# Move into reads folder
cd ${ReadsDIR}
READ=$(ls *_R1_val_1.fq)

for file in ${READ}; do

	for iScore in "${SCORE[@]}"; do

		for iMatch in "${MATCH[@]}"; do

			readname=${file%_R1_val_1.fq}

			echo "Running STAR for ${readname} with ${iScore} multimapping and ${iMatch} mismatches" >> ${record} 2>&1
			
			echo "${iMap}" >> ${multimaps}
			echo "${iMatch}" >> ${mismatches}

			#Run STAR
			STAR --genomeDir ${indexedDIR} --sjdbGTFfile ${indexedDIR}/Annotation/GCF_001194135.1_Octopus_bimaculoides_v2_0_genomic.gtf --readFilesIn ${ReadsDIR}/${readname}_R1_val_1.fq ${ReadsDIR}/${readname}_R2_val_2.fq --outFilterMatchNminOverLread ${iMatch} --outFilterScoreMinOverLread ${iScore} --outFileNamePrefix ${alignDIR}/${readname}.STAR.${iMatch}.${iScore}. --outSAMstrandField intronMotif --outSAMattributes All --outSAMtype BAM SortedByCoordinate --alignSoftClipAtReferenceEnds No  2> align.err

	 		cd ${alignDIR}
			# Make bam index
			echo "Making bam index" >> ${record} 2>&1
			samtools index ${readname}.STAR.${iMatch}.${iScore}.Aligned.sortedByCoord.out.bam 

			# Move alignment information files into separate folder
			mv ${readname}.STAR.${iMatch}.${iScore}.Log.out ${alignOutDIR} 
			mv ${readname}.STAR.${iMatch}.${iScore}.Log.final.out ${alignOutDIR} 
			mv ${readname}.STAR.${iMatch}.${iScore}.Log.progress.out ${alignOutDIR} 

			echo "Completed alignment for ${readname} with ${iScore} multimapping and ${iMatch} mismatches" >> ${record} 2>&1
			TZ=Australia/Adelaide date >> ${record} 2>&1

			cd ${ReadsDIR}

			cat ${record} | mail -s "finished Alignment for map: ${iScore} and mismatch: ${iMatch}" a1654797@student.adelaide.edu.au
		done

	done

	cd ${recordDIR}
	
	cat ${record} | mail -s "finished all Alignments" a1654797@student.adelaide.edu.au
	echo "Email sent"  >> ${record} 2>&1

done

echo "Exiting program" >> ${record} 2>&1
echo "Complete"
