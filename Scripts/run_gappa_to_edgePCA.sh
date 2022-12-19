#!/bin/sh



metagenomas=$(ls */*.jplace)


#mv epa_result.jplace $metagenoma.jplace

/home/sgaraycochea/software/gappa/bin/gappa analyze edgepca --jplace-path $metagenomas --out-dir epca.all --file-prefix epca.phoD.B --allow-file-overwriting --write-phyloxml-tree --write-svg-tree
