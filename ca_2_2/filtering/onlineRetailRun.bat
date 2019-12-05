type onlineRetail.csv | onlineRetailMapper.py
type onlineRetail.csv | onlineRetailMapper.py > onlineRetailMapperOutput.txt

type onlineRetailMapperOutput.txt | sort
type onlineRetailMapperOutput.txt | sort | onlineRetailReducer.py
type onlineRetailMapperOutput.txt | sort | onlineRetailReducer.py > onlineRetailReducerOutput.txt
