cat data-hold/fldr.html data-hold/fldr2.html data-hold/fldr3.html | pup 'td:nth-of-type(3) text{}' | grep -oE '\b[[:upper:]]{2}\b'


