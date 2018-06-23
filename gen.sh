#!/bin/bash

echo -n "input str file name: "
read dataFile

if [ ! -f ${dataFile} ]; then
	echo -e "Error! The str data file name: " ${dataFile} "not exist! \nexit"
	exit 1
fi

echo -n "input output dir:"
read outDir

if [ ! -d ${outDir} ]; then
	echo "outDir: " ${outDir} " not exist! going to mkdir it" 
	mkdir ${outDir}
	echo "mkdir " ${outDir} "OK"
fi

str=$(cat ${dataFile})

for((i=1; i <= ${#str}; i++))
do
echo ${str:((i-1)):1}>${outDir}/${i}
gzip ${outDir}/${i}
mv ${outDir}/${i}.gz ${outDir}/${i}
done

echo "genStrgzipFiles success."
