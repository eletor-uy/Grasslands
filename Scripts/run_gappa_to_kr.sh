#!/bin/sh



metagenomas=$(ls */*.jplace)


#mv epa_result.jplace $metagenoma.jplace

/home/sgaraycochea/software/gappa/bin/gappa analyze krd --jplace-path $metagenomas --out-dir kr.all --file-prefix phoD --allow-file-overwriting 
