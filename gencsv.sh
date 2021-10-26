#!/bin/sh
for j in `seq 0 9`
do
R=`shuf -i 0-10000 -n 1`
echo "$j, $R"
done
