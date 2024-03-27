DASH=$(perl -se 'print "-" x $N' -- -N=${#1})
echo -e "\n${DASH}\n${1}\n${DASH}"