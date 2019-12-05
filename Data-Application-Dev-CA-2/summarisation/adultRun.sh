# bash adultRun.sh to run
# if it does not run, run chmod 755 adultRun.sh

echo Compressing all ages from Split 1 and Split 2 into one file!
sleep 2

cat adultSplit1.txt | python adultAverageAgeMapper.py
cat adultSplit2.txt | python adultAverageAgeMapper.py

cat adultSplit1.txt | python adultAverageAgeMapper.py > adultAverageAgeMapperOutput.txt
cat adultSplit2.txt | python adultAverageAgeMapper.py >> adultAverageAgeMapperOutput.txt

echo Complete!
echo Now computing the average, min and max of all ages from adultAverageAgeMapperOutput
sleep 2

cat adultAverageAgeMapperOutput.txt | python adultAverageAgeReducer.py
cat adultAverageAgeMapperOutput.txt | python adultAverageAgeReducer.py > adultAverageAgeReducer.txt

echo This is now complete!
read -p "Press [Enter] to continue...."
