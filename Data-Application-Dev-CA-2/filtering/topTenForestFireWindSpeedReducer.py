import sys

limit = 10
topTenWindSpeed = []

for line in sys.stdin:
    line = line.strip()
    data = line.split(",")

    try:
        speed = float(data[1])
    except ValueError:
        continue

    topTenWindSpeed.append((speed, line))
    topTenWindSpeed.sort(reverse=True)

    if len(topTenWindSpeed) > limit:
        topTenWindSpeed = topTenWindSpeed[:limit]

for (speed, line) in topTenWindSpeed:
    print("{}, {}".format(speed, line.split(",")[0]))
