#!/bin/bash

#pritning most frequent top hits 

#first need to ensure all reads are only represented once in the BLAST output report 


awk '!x[$1]++' <1B_embryo_vs_octopus_blastoutfmt6 > 1B_blast.uniq.out
awk '!x[$1]++' <4B_embryo_vs_octopus_blastoutfmt6 > 4B_blast.uniq.out
awk '!x[$1]++' <240_kidney_vs_octopus_blastoutfmt6 > 240_blast.uniq.out
awk '!x[$1]++' <242_kidney_vs_octopus_blastoutfmt6 > 242_blast.uniq.out


awk -F '\t' '{print $1}' blast.uniq.out | sort | uniq -c | sort -nr > reads.txt #this command will check how many times certain reads appear in the report. We want 1

#extracting the frequency of certain annotations 

# change $2 if a different column has the names of hits listed

awk -F '\t' '{print $2}' blast.uniq.out | sort | uniq -c | sort -nr > 1B_frequent_hits
awk -F '\t' '{print $2}' 4B_blast.uniq.out | sort | uniq -c | sort -nr > 4B_frequent_hits
awk -F '\t' '{print $2}' 240_blast.uniq.out | sort | uniq -c | sort -nr > 240_frequent_hits
awk -F '\t' '{print $2}' 240_blast.uniq.out | sort | uniq -c | sort -nr > 242_frequent_hits
