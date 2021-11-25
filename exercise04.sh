#!/bin/bash
$ grep -w -E '(kappa|trihard)' 1.csv | wc -l
$ grep -w -E '(kappa|trihard)' 2.csv | wc -l
$ grep -w -E '(kappa|trihard)' 3.csv | wc -l
$ grep -w -E '(kappa|trihard)' 4.csv | wc -l
$ grep -w -E '(kappa|trihard)' 5.csv | wc -l
$ grep -w -E '(kappa|trihard)' 6.csv | wc -l
$ grep -w -E '(kappa|trihard)' 7.csv | wc -l
$ grep -w -E '(kappa|trihard)' 8.csv | wc -l
$ grep -w -E '(kappa|trihard)' 9.csv | wc -l
$ grep -w -E '(kappa|trihard)' 10.csv | wc -l
$ grep -w -E '(kappa|trihard)' 11.csv | wc -l
$ grep -w -E '(kappa|trihard)' 12.csv | wc -l
$ grep -w -E '(kappa|trihard)' 13.csv | wc -l
$ grep -w -E '(kappa|trihard)' *.csv | wc -l
$ cut -d, -f2 *.csv > user_list.txt
$ grep -E '(911|110)' user_list.txt | wc -l
