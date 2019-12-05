# bash forestFiresRun.sh to run
# if it does not run, run chmod 755 forestFiresRun.sh

echo Computing Top Ten Forrest Fire Speeds from Split1 and Split2
sleep 2

cat forestfiresSplit1.csv | python topTenForestFireWindSpeedMapper.py > topTenForestFireWindSpeedMapperOutput.txt
cat forestfiresSplit2.csv | python topTenForestFireWindSpeedMapper.py >> topTenForestFireWindSpeedMapperOutput.txt
cat forestfiresSplit1.csv | python topTenForestFireWindSpeedMapper.py
cat forestfiresSplit2.csv | python topTenForestFireWindSpeedMapper.py

echo Complete!
echo Now Computing Top Ten Forrest Fire Speeds from Mapper Output
sleep 2

cat topTenForestFireWindSpeedMapperOutput.txt | python topTenForestFireWindSpeedReducer.py > topTenForestFireWindSpeedReducerOutput.txt
cat topTenForestFireWindSpeedMapperOutput.txt | python topTenForestFireWindSpeedReducer.py


echo This is now complete!
read -p "Press [Enter] to continue...."
