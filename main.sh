#!/bin/bash
if [[ -f .lvl ]]
then
echo
else
echo 3 > .lvl
fi
if [[ -f .lvl2 ]]
then
echo
else
echo 1 > .lvl2
fi

timea=$(cat .lvl)
timeb=$(cat .lvl2)
echo -n "A(fk), M(ejorar), S(alir)? > "
read aaa
clear
if [[ $aaa == A ]]
then
./afk $timea $timeb
elif [[ $aaa == M ]]
then
./nextlevel
elif [[ $aaa == S ]]
then
echo "Adios!"
exit
fi
