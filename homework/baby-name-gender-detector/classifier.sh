if [[ -z $@ ]]; then
echo " You need to give me a name"
else

for name in "$@"; do


datafile='data-hold/namesample.txt'


# this step matches every line with the $name followed 
#   immediately by a comma
#   So that "Pat" doesn't match "Patrick" and "Patty"
name_matches=$(cat $datafile | grep "^$name,")

# we'll set up a couple of variables at 0
# and for each value in $name_matches, sum up the
# baby count by gender
m_count=0
f_count=0  

# for each value in $name_matches
for row in $name_matches; do
  # get the baby count, which is in the third column, i.e.
  # Jessie,F,999
  # and set it to the `babies` variable
  babies=$(echo $row | cut -d ',' -f '3')
  if [[ $row =~ ',M,' ]]
    then
      m_count=$((m_count + babies))
    else
       f_count=$((f_count + babies))
   fi

done

# The for-loop needed to sum up the babies is done

# let's calculate a percentage of babies that are female
#  and make it a whole number, i.e.
#  num_of_girl_babies 
#     divided by (boys + girls), then multipled by 100
total_babies=$((m_count + f_count))

if [[ $total_babies -eq 0 ]]; then
   g_and_pct="NA,0"
else

  pct_female=$((100 * f_count / total_babies))  pct_female=$((100 * f_count / total_babies))

  if [[ $pct_female -ge 50 ]]; then
    g_and_pct="F,$pct_female"
  else
    pct_male=$((100 * m_count / total_babies))
    g_and_pct="M,$pct_male"
  fi

fi

echo $name,$g_and_pct,$total_babies


done
fi
