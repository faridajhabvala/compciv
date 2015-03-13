mkdir -p ./data-hold

curl  www.dallaspolice.net/ois/ois.html -o data-hold/main.html

for num in $(seq 3 9); do

curl www.dallaspolice.net/ois/ois_200$num.html -o data-hold/$num.html

done

for number in $(seq 10 12); do
    curl www.dallaspolice.net/ois/ois_20$number.html -o data-hold/$number.html

done

cd data-hold

for file in $(seq 3 12); do
cat $file.html | pup 'table table tr json{}' | 
  jq  --raw-output '.[] .children | [ 
    .[0] .children[0] .href, 
    .[0] .children[0] .text, 
    .[1] .text ,
    .[2] .text,
    .[3] .text,
    .[4] .text,
    .[5] .text,
    .[6] .text,
    .[7] .text
  ] | @csv' > $file.csv
done

