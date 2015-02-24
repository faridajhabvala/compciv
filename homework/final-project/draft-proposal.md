Project Proposal
Farida Jhabvala Romero
February 23, 2015

Project: Write a program that monitors accidents in all nine Bay Area counties and reports those incidents either on a website, or/and through Twitter as they happen or at the end of the day. Information provided would include time, date, location, and any other information provided by 511 (such as if delays are expected).

I would also like to add a link to a Google Maps page with the location of the accident. 

Data: The first data set is available on the 511.org site (Current incidents tab): http://traffic.511.org/LatestNews#CurrentIncidents

511.org also offers a Traffic Data Feed that provides incidents and travel time data.  I will need to set up an account with them to get access to the feed and see what other information I can get from there (http://www.511.org/developer-resources_traffic-data-feed.asp)

Program idea:
Donwloader.sh
-Download each page or data feed at certain times of the day; 

Analyzer.sh
- Read each row and convert date and other data to form that computer can read;
- Filter accidents and other incidents that may affect traffic, except for construction;
- Echo it out 

Mapper.sh
-Grab latitude and longitude coordinates for each incident (if available)
-Add those to Google map link
-Produce link to Google map

Joiner.sh
-Echo single incidents to a website or Twitter, with link to a Google map for each incident.
-Maybe: At the end of the day or week, produce a report of all the accidents (something that says, total X number of accidents) with a link to map of all the accidents.






