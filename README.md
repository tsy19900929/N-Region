# usage example 1    
`bash N.sh test.fasta chr1`  
&nbsp; *you will get* ***test.fasta.chr1.1-based.bed***    
&nbsp;  
&nbsp;
# usage example 2
`hg19=ucsc.hg19.fasta`  
`cat $hg19 | grep '^>chr' | sed 's/>//' | xargs -i -P 24 bash N.sh $hg19 {}`  
`cat *hg19*.chr*.1-based.bed >hg19.N-Region`  
 &nbsp; *you will get* ***hg19.N-Region***   
 `cat hg19.N-Region | awk '{print $3-$2+1}' | datamash sum 1` will output 239850802 identical with http://genomewiki.ucsc.edu/index.php/Hg19_Genome_size_statistics
