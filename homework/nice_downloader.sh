for url in http://www.example.com http://www.wikipedia.org http://www.cnn.com
do
  fname=$( echo $url | tr -d '[:punct:]')  
  if [[ -a $fname ]]; then
    echo "Already exists: $fname"
  else
    echo "Downloading $url into $fname"
  fi
done
