#!/bin/bash
rm wordcount.txt
rm 2264.txt
wget https://www.gutenberg.org/files/2264/2264.txt
sed -e  's/[^A-Za-z]/ /g' 2264.txt | tr 'A-Z' 'a-z' | tr ' ' '\n' | grep -v '^$'| sort | uniq -c | sort -rn | sed 's/ //g' >>wordcount.txt
filename='wordcount.txt'
n=0
c=0
g=0
declare -A map
while read var; 
do
   word=${var//[^a-z]/}
   count=${var//[^0-9]/}
   if [[ $count -gt 100 ]]
    then
    g=$((g+count))    
    map[$word]=$((count))
    fi
c=$((c+count))
n=$((n+1))
echo " $n : word =$word count=$count"
done < $filename
echo "======================================="
echo ""
echo "total unique words are:-"$n
echo "total words in documentation are:-"$c
echo ""
echo "======================================="
echo ""
echo "Threshold value is 100"
echo "showing percentage graph:-(By rankings)"
for k in "${!map[@]}"
do
    echo $k ' - ' ${map["$k"]}
done |
sort -rn -k3
echo ""
echo "======================================="
echo ""
echo "percentage based on top frequent words having more than 100 frequency threshold(addition of word count throughtout document)"
echo "total word count in this category:-"$c
v1=$(bc <<<"scale=2;$c/100")
for k in "${!map[@]}"
do
    p=$(bc <<<"scale=5;${map["$k"]}/$v1")
    echo "word=$k  count=${map["$k"]}  percentage=$p %"
done |
sort -rn -k3
echo ""
echo "======================================="
echo ""
echo "percentage based on top frequent words having more than 100 frequency threshold(addition of top frequent word count only)"
echo "total word count in this category:-"$g
v2=$(bc <<<"scale=2;$g/100")
for word in "${!map[@]}"
do
    p=$(bc <<<"scale=2;${map["$word"]}/$v2")
    echo "word=$word count=${map["$word"]} percentage=$p %"
    # pt=$((p+1))
    # s="["
    # for i in {1..$pt}
    # do
    # s+="="
    # done
    # for i in {$((pt+1))..100}
    # do
    # s+="."
    # done
    # s+="]"
    # echo $s
done | 
sort -rn -k3
echo ""
echo "======================================="