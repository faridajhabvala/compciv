Date=$(date +"%Y-%m-%d_%H00")
filename="./data-hold/scrapes/$Date"


mkdir -p $filename

curl -s http://stash.compciv.org/usajobs.gov/OccupationalSeries.xml -o ./data-hold/OccupationalSeries.xml 

JobFamily=$(cat data-hold/OccupationalSeries.xml | grep -E "<JobFamily>" | cut -d '>' -f 2 |  grep -oE [0-9]* | sort | uniq)


for num in $JobFamily; do
  curl -s  "https://data.usajobs.gov/api/jobs?series=$num&NumberOfJobs=250&Page=1" -o "$filename/$num-1.json"
  echo "Donwloading Series $num, pg 1"

    pages=$(cat $filename/$num-1.json | jq -r '.Pages')

    for p in $(seq 2 $pages); do
        echo "Donwloading Series $num, pg $p"
        curl  -s "https://data.usajobs.gov/api/jobs?series=$num&NumberOfJobs=250&Page=$p" -o "$filename/$num-$p.json"
    done
done

