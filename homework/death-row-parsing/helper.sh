mkdir -p data-hold
curl http://www.tdcj.state.tx.us/death_row/dr_offenders_on_dr.html -o data-hold/txdr.html
curl http://www.tdcj.state.tx.us/death_row/dr_list_all_dr_1923-1973.html -o data-hold/txdr2.html 
curl http://www.dc.state.fl.us/activeinmates/deathrowroster.asp -o data-hold/fldr.html 
curl http://www.dc.state.fl.us/oth/deathrow/execlist.html -o data-hold/fldr2.html 
curl http://www.dc.state.fl.us/oth/deathrow/execlist2.html -o data-hold/fldr3.html 
curl http://www.cdcr.ca.gov/capital_punishment/docs/condemnedinmatelistsecure.pdf -o data-hold/cadr.pdf 

