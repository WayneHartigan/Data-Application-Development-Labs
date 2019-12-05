#chmod 755 fileName.sh

cat onlineRetail.csv | python onlineRetailMapper.py
cat onlineRetail.csv | python onlineRetailMapper.py > onlineRetailMapperOutput.txt

cat onlineRetailMapperOutput.txt | sort
cat onlineRetailMapperOutput.txt | sort | python onlineRetailReducer.py
cat onlineRetailMapperOutput.txt | sort | python onlineRetailReducer.py > onlineRetailReducerOutput.txt

echo This is now complete!
read -p "Press [Enter] to continue...."
