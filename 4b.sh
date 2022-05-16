#Write a shell script that displays all the links to a file specified as the first argument to the
#script. The second argument, which is optional, can be used to specify in which the search is to
#begin. If this second argument is not present, the search is to begin in the current working
#directory. In either case, the starting directory as well as its subdirectories at all levels must be
#searched. The script need not include error checking.
if [ $# -eq 3 ]
then
if [ -f $1 ]
then
l =` cat $1 | wc -l`
if [ $2 -gt $3 -a $2 -gt $1 a $3 -gt $2 ]
then
head -n $1 $3 | tail -n +$2
else
echo "enter valid argument"
fi
else
echo "file doesnt exist"
fi
else
echo "entre the nunber of argument"
fi

    
