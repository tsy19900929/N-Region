#!/bin/bash

fasta=`basename $1`
chr=$2

<$1 \
seqkit fx2tab \
| grep -w $chr \
| cut -f 2 \
| fold -w 1 \
| sed 's/n/N/' \
| nl \
>${fasta}.${chr}.B

<${fasta}.${chr}.B \
awk -v chr=$chr \
'BEGIN{i=1;j=1;p=0}\
$2=="N"{j=$1;p=1;next}\
{if(p==1){print chr"\t"i"\t"j;p=0};i=$1+1;j=$1+1}\
END{if(p==1){print chr"\t"i"\t"j}}' \
>${fasta}.${chr}.1-based.bed
