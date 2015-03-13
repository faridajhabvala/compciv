cat ./data-hold/*.csv | csvfix echo -osep '|' | grep -v 'Location' | while read -r line; do
   
   geofilename=./data-hold/geocodes/$(echo $line | csvfix order -smq -sep '|' -f 4 | tr ' ' '+').json
   latitude=$(cat $geofilename | jq '.results[0] .geometry .location .lat')
   longitude=$(cat $geofilename | jq '.results[0] .geometry .location .lng')

#   narrative="BLAHBLAHNARRATIVE"

   echo "$line|$latitude|$longitude|$narrative"
done

