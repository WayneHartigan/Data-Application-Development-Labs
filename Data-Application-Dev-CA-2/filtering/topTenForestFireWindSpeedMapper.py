import sys

windSpeed = []
limit = 10

for line in sys.stdin:
    line = line.strip()
    data = line.split(",")

    try:
        speed = float(data[10])
    except ValueError:
        continue

    windSpeed.append((speed, line))

    windSpeed.sort(reverse=True)

    if len(windSpeed) > limit:
        windSpeed = windSpeed[:limit]

for (speeds, lines) in windSpeed:
    print("{}, {}".format(lines.split(",")[2], speeds))
