mkdir -p data-hold

curl http://www.cdph.ca.gov/certlic/facilities/Pages/Counties.aspx -o ./data-hold/counties.html

cat data-hold/counties.html | pup '#linkitem' | pup 'a[href] attr{href}' | while read -r line; do
    echo $line 
    mkdir -p data-hold/all-counties
    curl -s http://www.cdph.ca.gov/$line -o ./data-hold/all-counties/$(basename $line)
done


