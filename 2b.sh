if [ $# -eq 1 ]
then
grep $1 /etc/passwd >ud
if [ $? -eq 0 ]
then
echo "user exist"
h=`cut -d ":" -f 6 ud` 
echo "home directory $1 is $h"
else
echo "user not found"
fi
else
echo "enter login name"
fi

