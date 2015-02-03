bash tx.dr.sh | sed 's/^/TX,/'
bash fl.dr.sh | sed 's/^/FL,/' | sed 's/W./White/' | sed 's/B./Black/' | sed 's/H./Hispanic/' | sed 's/O./Other/'
bash ca.dr.sh | sed 's/^/CA,/' | sed 's/WHI/White/' | sed 's/BLA/Black/' | sed 's/HIS/Hispanic/' | sed 's/OTH/Other/'
