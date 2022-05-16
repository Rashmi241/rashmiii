

#Write s a shell script to find a file/s that matches a pattern given as command line argument
#in the home directory, display the contents of the file and copy the file into the directory
#~/mydir.

if [ $# -eq 1 ]
then
if [ -d ~/mydir ]
then
set -- `find ~ -name "$1"`
for i in $*
do
cp $i ~/mydir 2>er
done
if [ $# -eq 0 ]
then
echo "No such file"
else
cat $i
fi
else
echo "No such directory"
fi
else
echo "enter argument"
fi

    

