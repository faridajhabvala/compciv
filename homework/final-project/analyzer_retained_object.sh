cat data-hold/all-counties/*.aspx | sed 's/\xc2\xa0//g' | sed 's/<br>/###/g' | pup '#ctl00_PlaceHolderMain_ctl00__ControlWrapper_RichHtmlField p text{}' |
grep -vE '^ *$\n' | sed  -E ':a;N;$!ba;s/\n*###\n*/|/g' | sed 's/(PDF)/ /g' | while read -r line; do
    echo $line | grep 'foreign object' | cut -d '|' -f 1 
done | sort | uniq -c | sort -rn 
