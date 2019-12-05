type adultSplit1.txt | adultAverageAgeMapper.py
type adultSplit2.txt | adultAverageAgeMapper.py

type adultSplit1.txt | adultAverageAgeMapper.py > adultAverageAgeMapperOutput.txt
type adultSplit2.txt | adultAverageAgeMapper.py >> adultAverageAgeMapperOutput.txt

type adultAverageAgeMapperOutput.txt | adultAverageAgeReducer.py
type adultAverageAgeMapperOutput.txt | adultAverageAgeReducer.py > adultAverageAgeReducer.txt

PAUSE
