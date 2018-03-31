#!/bin/bash

#SBATCH -p batch
#SBATCH -n 20
#SBATCH -N 1 
#SBATCH --time=3-00:00
#SBATCH --mem=40GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au

module load BLAST+/2.6.0-foss-2016b-Python-2.7.13

ReadsDIR=/fast/users/a1654797/Homology_with_octopus/STAR_alignments/Cuttlefish/first_alignment_default/fasta_format
outDIR=/fast/users/a1654797/Homology_with_octopus/BLAST_aligned_reads/Uniprot
DataDIR=//fast/users/a1654797/Second_try/Trinotate_annotation/second_annotation/database

echo "Initialising files:"
date

if [ -d $outDIR ]; then
    echo "Folder $outDIR exists ..."
else
    mkdir $outDIR
fi

cd ${ReadsDIR}

READS=$(ls *_default.fasta)


for f in ${READS} ;
do 

	readname=${f%_default.fasta}
	echo "BLASTing ${readname} aganist Octopus"


	blastx -query $ReadsDIR/${readname}_default.fasta -db $DataDIR/uniprot_sprot.pep \
	        -out $outDIR/${readname}_blastoutfmt6 \
        	-evalue 1e-5 -num_threads 16 -max_target_seqs 1 -outfmt 6


done
