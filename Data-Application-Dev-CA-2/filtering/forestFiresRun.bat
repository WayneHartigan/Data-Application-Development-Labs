type forestfiresSplit1.csv | topTenForestFireWindSpeedMapper.py > topTenForestFireWindSpeedMapperOutput.txt
type forestfiresSplit2.csv | topTenForestFireWindSpeedMapper.py >> topTenForestFireWindSpeedMapperOutput.txt
type forestfiresSplit1.csv | topTenForestFireWindSpeedMapper.py
type forestfiresSplit2.csv | topTenForestFireWindSpeedMapper.py

type topTenForestFireWindSpeedMapperOutput.txt | topTenForestFireWindSpeedReducer.py > topTenForestFireWindSpeedReducerOutput.txt
type topTenForestFireWindSpeedMapperOutput.txt | topTenForestFireWindSpeedReducer.py

PAUSE
