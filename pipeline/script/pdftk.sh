#!/bin/bash
# run.sh - runs scripts from container
echo hello
echo commencing pdftk run > /output/log.txt

cd /input/
ls *.pdf |
while read pdf ; do
  echo === ${pdf}
  2> /dev/null pdftk ${pdf} dump_data 
#  echo $( 2> /dev/null pdftk ${pdf} dump_data | grep Number | cut -d: -f2 ) : ${pdf}
done > /output/output.txt

front=odd.pdf
back=even.pdf

# reverse page order for back side scans
pdftk ${back} cat end-1 output /working/${back}.forward.pdf

# collate front and back.forward
pdftk A=${front} B=/working/${back}.forward.pdf shuffle A B output /output/full.pdf

