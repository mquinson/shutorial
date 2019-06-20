#! /bin/sh

# Q1
sed 's/o//g' Ce_siecle_avait_deux_ans.txt > deux_ans-sans_o 

# Q2
(head -n -1 Ce_siecle_avait_deux_ans.txt | sed 's/[aeiouy]//g' ;tail -n 1 Ce_siecle_avait_deux_ans.txt) > deux_ans-sans_voyelle

# Q3
sed 's/\([rfv]oi[txs]\)\([,. ;]*\)$/\1 (poil aux doigts)\2/' Ce_siecle_avait_deux_ans.txt|sed 's/\(nee\)\([,. ;]*\)$/\1 (poil au nez)\2/'|sed 's/\(er\)\([,. ;!]*\)$/\1 (poil au nez)\2/' > deux_ans-poil_aux_dents
