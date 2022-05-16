#Write a shell script that displays all the links to a file specified as the first argument to the
#script. The second argument, which is optional, can be used to specify in which the search is to
#begin. If this second argument is not present, the search is to begin in the current working
#directory. In either case, the starting directory as well as its subdirectories at all levels must be
#searched. The script need not include error checking.
if [ "$2"!=" " ]
then
cwd='pwd'
cd =$2
link=`ls -l $1 | tr -s " " -f 2`
cd $cwd
else
link=`ls -l $1 | tr -s " " -f 2`
fi
echo "no of links of file $1:$link"
