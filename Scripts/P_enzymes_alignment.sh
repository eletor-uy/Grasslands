#!/bin/sh
metagenomas=$(cat $1) # include only samples name. 
models=$(ls *.hmm| cut -f1 -d\.)

for metagenoma in $metagenomas
do
echo "$metagenoma"
  for model in $models
  do
    echo $model
    /usr/local/bin/hmmsearch -o $model.vs.$metagenoma.hmmout --tblout $model.vs.$metagenoma.tblout --pfamtblout $model.vs.$metagenoma.pfamtblout --domtblout $model.vs.$metagenoma.domtblout -E 1e-5 $model.hmm  $metagenoma.350.1.faa 2>> errores.hmmsearch.log
    egrep -v "#" $model.vs.$metagenoma.tblout | awk '$5 < 1e-5 {print $1}' | sort -u > hits
    /home/sgaraycochea/software/easel/miniapps/esl-sfetch -f $metagenoma.350.1.faa hits > $metagenoma.$model.faa 2>> errores.fetch.log
    /usr/bin/mafft --genafpair --multipair --keeplength  --addfragments $metagenoma.$model.faa --reorder $model.ref.prot.aln.fasta  > $model.vs.$metagenoma.mafft.fasta    
  done
 
done
