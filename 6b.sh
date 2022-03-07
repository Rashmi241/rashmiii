#Write a shell script to list all the files in a directory whose filename is at least 10 characters.
#(use expr command to check the length).
for i in `ls`
do 
fl=`expr length $i`
if [ $fl -ge 10 ]
then 
echo $i
fi
 done
