mkdir tables 
cat ./data-hold/*.csv | grep -v 'Location' | csvfix echo -osep '|' | while read -r incident; do
#    csvfix order -smq -f 4 | grep -v 'Location' | tr -d '"' | 
    locationslug=$(echo $incident | csvfix order -sep '|' -smq -f 4 | tr ' ' '+') 
    geocoded_file="data-hold/geocodes/$locationslug.json" 
    longitude=$(cat $geocoded_file| jq '.results[0] .geometry .location .lng')
    latitude=$(cat $geocoded_file | jq '.results[0] .geometry .location .lat')


    pdf_file_url=$(echo $incident | csvfix order -smq -sep '|' -f 1)   
    pdf_file="data-hold/pdfs/$(basename $pdf_file_url)"
    pdftotext "$pdf_file"

  textfile="data-hold/pdfs/$(basename $pdf_file_url '.pdf').txt"
incident_sanspdf=$(echo $incident | tr '"' ' ' |  cut -d '|' -f 2,3,4,5,6,7,8,9,10,11,12)
    narrative=$(cat $textfile | sed ':a;N;$!ba;s/\n/ /g')
echo "case_number|date|location|suspect_status|suspect_weapon|suspects|officers|grand_jury|latitude|longitude|narrative"   
 echo "$incident_sanspdf|$latitude|$longitude|$narrative" 
done > tables/incidents.psv

echo "case_number, date, suspect_killed, suspect_weapon, last_name, first_name, race, gender"
cat ./tables/incidents.psv | while read -r rows; do
officernames=$(echo $rows | cut -d '|' -f 7 | grep -v 'officers' | sed "s/\/M/\/M#/g" | sed "s/\/F/\/M#/g" | grep -oE "[^#]+")
status=$(echo $rows | cut -d '|' -f 4 | grep -v 'suspect_status') 
casen=$(echo $rows | cut -d '|' -f 1 | grep -v 'case_number')
date=$(echo $rows | cut -d '|' -f 2 | grep -v 'date')
weapon=$(echo $rows | cut -d '|' -f 5 | grep -v 'suspect_weapon')
echo $casen $date $status $weapon $officernames 
done > tables/officers.psv


