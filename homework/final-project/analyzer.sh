cat data-hold/all-counties/*.aspx | sed 's/\xc2\xa0//g' | sed 's/<br>/###/g' | pup '#ctl00_PlaceHolderMain_ctl00__ControlWrapper_RichHtmlField p text{}' |  grep -vE '^ *$\n' | sed  -E ':a;N;$!ba;s/\n*###\n*/|/g' | while read -r line; do      
echo $line ; done | sed 's/(PDF)/ /g' | cut -d '|' -f 1 | sort | uniq -c | sort -rn | head -n 50 
