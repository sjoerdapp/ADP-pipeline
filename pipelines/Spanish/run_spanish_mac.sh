#! /bin/bash

#Reset paths to work from directory other than Metaphor-ADP/pipelines/Spanish
INFILE=examples/spanish_text.txt
PATHTOTREETAGGER=../../external-tools/tree-tagger-3.2
PATHTOSPANISHTT=.
PATHTOSPANISHSCRIPTS=.

#tokenize
$PATHTOTREETAGGER/darwin/cmd/utf8-tokenize.perl $INFILE > ${INFILE/txt/tokens};
#for pre-built Spanish treetagger
$PATHTOSPANISHTT/tree-tagger-spanish-utf8 ${INFILE/txt/tokens} > ${INFILE/txt/tree.tagged}

#for ancora tags treetagger
#../../external-tools/tree-tagger-3.2/darwin/bin/tree-tagger -token -lemma ancora.treetagger.par  ${INFILE/txt/tokens} > ${INFILE/txt/ancora.tagged}

#create conll file
#python Scripts/to_malt.py ${INFILE/txt/ancora.tagged}
python $PATHTOSPANISHSCRIPTS/Scripts/to_malt.py ${INFILE/txt/tree.tagged}

#parse with maltparser-1.5
# not ready yet

#create prop file
#python Scripts/malt_to_prop.py <file>

#../../external-tools/tree-tagger-3.2/darwin/cmd/utf8-tokenize.perl examples/spanish_text.txt
#../../external-tools/tree-tagger-3.2/darwin/bin/tree-tagger -token -lemma ancora.treetagger.par examples/spanish_text.tokens
#./tree-tagger-spanish-utf8 examples/spanish_text.tokens
#python Scripts/to_malt.py examples/spanish_text.tree.tagged