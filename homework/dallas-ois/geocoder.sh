mkdir -p data-hold/geocodes
cat ./data-hold/*.csv | csvfix order -smq -f 4 | grep -v 'Location' | tr -d '"' | 
    tr ' ' '+' | while read -r addr; do
        echo $addr
        curl -sS "https://maps.googleapis.com/maps/api/geocode/json?address=$addr+Dallas+TX" -o data-hold/geocodes/$addr.json
        sleep 1.5
done
