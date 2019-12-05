cat abaloneSplit1.txt | python abaloneMapper.py
cat abaloneSplit1.txt | python abaloneMapper.py > abaloneMapperOutput.txt
cat abaloneSplit2.txt | python abaloneMapper.py
cat abaloneSplit2.txt | python abaloneMapper.py >> abaloneMapperOutput.txt

cat abaloneMapperOutput.txt | python abaloneReducer.py
cat abaloneMapperOutput.txt | python abaloneReducer.py > abaloneReducerOutput.txt

read -p "Press [enter] to continue..."
