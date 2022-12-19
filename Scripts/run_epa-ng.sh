#!/bin/sh

metagenomas=$(cat $1) # include only samples names
models=$(ls *.hmm| cut -f1 -d\.) 


for model in $models
do
echo "$model"
mkdir $model
cd $model

cp /home/sgaraycochea/Metagenomica_suelos/analisis_metagenomas/grass_mundo_place_analisis/P_enzymes_ref_aln/$model.ref.prot.aln.fasta .

cp /home/sgaraycochea/Metagenomica_suelos/analisis_metagenomas/grass_mundo_place_analisis/ref_tree/$model\_ref_prot_aln.fasta.treefile .

cp /home/sgaraycochea/Metagenomica_suelos/analisis_metagenomas/grass_mundo_place_analisis/bestModel_trees/$model.raxml.bestModel .



for metagenoma in $metagenomas
do
echo "$metagenoma"

mkdir $metagenoma.epa.out
cd $metagenoma.epa.out

epa-ng --split ../$model.ref.prot.aln.fasta  /home/sgaraycochea/Metagenomica_suelos/analisis_metagenomas/grass_mundo_place_analisis/place_analisis_all/$model.vs.$metagenoma.mafft.fasta



epa-ng --ref-msa reference.fasta --tree ../$model\_ref_prot_aln.fasta.treefile --query query.fasta --model ../$model.raxml.bestModel

cd ..
		

done

cd ..


done
