m=who | grep "`whoami`" | tr -s " " | cut -d " " -f4 | cut -c 4-5
h=who | grep "`whoami`" | tr -s " " | cut -d " " -f4 | cut -c 1-2
ch=`date +%H`
cm=`date +%M`
d=`expr $cm - $m` 
echo $d
if [ $d -lt 0 ]
then
	d=`expr $d + 60`
	echo $d
fi
hh=$h-$ch
echo $hh
if [ $hh -lt 0 ]
then
	hh=`expr $hh + 24`
	echo $hh
fi

echo "m: $m"


