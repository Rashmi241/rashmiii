#Write a shell script that accept one or more file names as argument and convert all of them
#to uppercase, provided they exists in current directory.
for i in $*
do 
if [ -e $i ]
then
echo "------------------$i contents are-------------------------- "
cat $i | tr "[a-z]" "[A-Z]"
echo "-----------------------------------------------------------"
else
echo " $i file does not exist"
fi
done 
