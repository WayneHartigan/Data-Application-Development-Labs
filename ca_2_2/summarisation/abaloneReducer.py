import sys

ringList = []
limit = 100

for data in sys.stdin:
    data  = data.strip()
    line = data.split(",")
    try:
        ringList.append(float(line[0]))
    except ValueError:
        continue

    if len(ringList) > limit:
        ringList = ringList[:limit]

if ringList:
    ringAvg = sum(ringList) / len(ringList)
    print("The average is {}".format(ringAvg) )
