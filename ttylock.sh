echo "enter the passw0rd"
stty -echo
read p1
stty -echo
echo `confirm the password`
stty -echo
read p2
stty -echo
while [ "$p1"!="$p2" ]
do
echo -n "password doesnot match.enter the password"
stty -echo
read p2
stty -echo
done clear
echo "terminal locked"
echo "enter the password to unlock"
stty -echo
read p3
stty -echo
while [ "$p1"!="$p2" ]
do
clear
echo "terminal locked"
echo -n "password doesn0t match renter the password"
read p3
done
echo "terminal unlocked"

