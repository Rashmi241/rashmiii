#Write a shell script that accepts the filename, starting and ending line number as an
#argument and display all the lines between the given line number.
if [ $# -eq 3 ]
then
	if [ -f $1 ]
	then
		if [ $2 -gt 0 ] && [ $3 -gt 0 ]
		then
		   l=`wc -l $1 | cut -d " " -f 1`
		   if [ $2 -le $l -a $3 -le $l -a $3 -gt $2 ]
		   then
		      head -n $3 $1 | tail -n +$2
		   else
		      echo enter valid startingline and ending line
		   fi
		else
		   echo linenumbers must greater than 0
		fi
	else
	   echo Enter valid filename
	fi   
else
 echo Enter filename,starting and ending line
fi	
