cat abalone_split_1 | python topFIveMaleByRingsMapper.py > topFiveMalesByRingsMapperOutput.txt
cat abalone_split_2 | python topFIveMaleByRingsMapper.py >> topFiveMalesByRingsMapperOutput.txt
cat topFiveMalesByRingsMapperOutput.txt | sort
cat topFiveMalesByRingsMapperOutput.txt | sort | python topFIveMaleByRingsReducer.py 
cat topFiveMalesByRingsMapperOutput.txt | sort | python topFIveMaleByRingsReducer.py > topFiveMalesByRingsReducerOutput.txt
