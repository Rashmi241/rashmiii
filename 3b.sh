
#write a shell script to implement terminal locking.it should prompt for the user for a password. 
#After accepting the password entered by the user, it must prompt again for the matching password 
#as confirmation and if match occurs, 
#it must lock the keyword until a matching password is entered again by the user. 
#Note the script must be written to disregard BREAK, control-D. 
#No time limit need to be implemented for the lock duration
echo "\nEnter a password:\n"
stty -echo
read p1
stty echo
echo "\nConfirm your password\n"
stty -echo
read p2
stty echo
while [ "$p1" != "$p2" ]
do
echo "\nPassword doesnot match, re-enter the password:\n"
stty -echo
read p2
stty echo
done
clear
echo "-------------TERMINAL LOCKED--------------"
echo "\nEnter the password to unlock:\n"
stty -echo
read p3
stty echo
while [ "$p1" != "$p3" ]
do
clear
echo "-------------TERMINAL LOCKED--------------"
echo "\nPassword doesnot match,re-enter the password:\n"
stty -echo
read p3
stty echo
done
echo "\nTerminal unlock\n"

   
