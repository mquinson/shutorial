sed 's/o//g' Ce_siecle_avait_deux_ans.txt > deux_ans-sans_o
(head -n -1 Ce_siecle_avait_deux_ans.txt | sed 's/[aeiouyAEIOUY]//g' ;tail -n 1 Ce_siecle_avait_deux_ans.txt) > deux_ans-sans_voyelle
sed 's/\([rfv]oi[txs]\)\([,. ;]*\)$/\1 (poil aux doigts)\2/' Ce_siecle_avait_deux_ans.txt \
  | sed  's/\(nee\)\([,. ;]*\)$/\1 (poil au nez)\2/' \
  | sed 's/\(er\)\([,. ;!]*\)$/\1 (poil au nez)\2/'  \
  | sed 's/\(ole\)\([,. ;]*\)$/\1 (poil aux guiboles)\2/' > deux_ans-poil_aux_dents
  
tr [a-zA-Z] [n-za-mN-ZA-M] <Ce_siecle_avait_deux_ans.txt > deux_ans-rot13

cat "Sept d'un coup.txt" | tr '\n' '9'|sed -e 's/99/\n/g' -e 's/9 /\n /g' -e 's/9$/\n/' -e 's/9/ /g' -e 's/\([[:alnum:],.] \) */\1/g' > 7_lignes.txt
shtrl-check
