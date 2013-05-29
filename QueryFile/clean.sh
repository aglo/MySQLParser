#!/bin/sh
#
#   clean.sh in [out]
#
# This script will merge one sql statement into one line
# 
# And clean other statement:
#   *      [0-9]+ Connect | Quit | Query
#   *      SET        # Not Supported
#   *      Show       # Not Supported
#   *      Select 1   # Not Supported
#   *      commit     # Not Supported

if [ $# -eq 0 ] 
then
    echo "Warnning, feed me a input file!"
    echo "./clean.sh input_file [output_file]"
    exit 1
elif [ $# -eq 1 ] 
then
    IN_FILE="$1"
    OUT_FILE="$1.out"
    elif [ $# -eq 2 ] 
    then
        IN_FILE=$1
        OUT_FILE=$2
    else
        echo "Error, feed me too much! @_@"
        exit 1
fi

# delete "xxxxxxxx (Connect|Quit|...)"
sed '/[0-9]\+\ \(Quit\|Connect\|Close\)/d' < $IN_FILE > "tmp1"

# delete all "\n"
tr -d '\n' < "tmp1" > "tmp2"

# substitute "xxxxxxxxx Query" with "\n"
sed 's/[0-9]\+\ Query/\n/g' < "tmp2" > "tmp1"

# change multi-blank into one space
sed -e 's/[\ \r\t]\+/\ /g' -e 's/^\ //g' < "tmp1" > $OUT_FILE

#
rm tmp*

exit 0
