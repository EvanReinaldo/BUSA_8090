#!/bin/bash

#sort both file so the gene has the same value
#i use -r means reverse so the header is still at top
sort annotation.txt -r > annotation_sorted.txt
sort expression.txt -r > expression_sorted.txt

#use the join command to join sorted both file
join expression_sorted.txt annotation_sorted.txt > joinresult.txt

#command to not print the third column, which is metabolism that we don't need
awk '{$3=""; print $0}' joinresult.txt > finalresult.txt

#reference
#https://unix.stackexchange.com/questions/222121/how-to-remove-a-column-or-multiple-columns-from-file-using-shell-command
