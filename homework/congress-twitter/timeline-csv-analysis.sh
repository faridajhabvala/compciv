username=$1
mkdir -p ./data-hold
echo "Fetching tweets for $username into ./data-hold/$username-timeline.csv"
file=data-hold/$username-timeline.csv
t timeline -n 3200 --csv $username > $file
count=$(csvfix order -f 1 $file | wc -l)
lastdate=$(csvfix order -fn 'Posted at' $file | tail -n 1)
echo "Analyzing $count tweets by $username since $lastdate"
echo "Top 10 Hashtags by $username"
csvfix order -fn 'Text' $file | grep -oE '#[[:alnum:]]+' | sort | uniq -c | sort -rn | head -n 10
echo "Top 10 retweeted users by $username"
csvfix order -fn 'Text' $file | grep -oE 'RT @[[:alnum:]]+' | sort | uniq -c | sort -rn | head -n 10   
echo "Top 10 mentioned users (not including retweets) by $username"
csvfix order -fn 'Text' $file | grep -v 'RT' | grep -oE '@[[:alnum:]]+' | sort | uniq -c | sort -rn | head -n 10
echo "Top tweeted 10 words with 5+ letters by $username"
csvfix order -fn 'Text' $file | grep -oE '[[:alnum:]]{5,}' | sort | uniq -c | sort -rn | head -n 10

