#5b.Write a shell script to display the calendar for current month with current date replaced by
#*or**depending on whether the date has one digit or two digits
date=`date +%d`
date=`expr $date + 0`
l=`cal | tr -d "[\137][\010]" | grep -wn "$date" | head -c 1`
if [ $date -gt 9 ]
then
	cal | tr -d "[\137][\010]" | sed "$l s/$date/**/"
else
	cal | tr -d "[\137][\010]" | sed "$l s/$date/*/"
fi
