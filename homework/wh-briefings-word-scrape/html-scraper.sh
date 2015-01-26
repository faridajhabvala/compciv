cat data-hold/* | pup 'p' | grep -oE '[[:alpha:]]{7,30}' | sort | uniq -c | sort -r | head -n 10

