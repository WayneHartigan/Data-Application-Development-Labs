import sys

ringsList = []
limit = 250

for line in sys.stdin:
    line = line.strip()
    data = line.split(",")

    try:
        rings = float(data[8])
    except ValueError:
        continue

    if str(data[0]).lower() == "m":
        ringsList.append(rings)

    ringsList.sort(reverse=True)

    if len(ringsList) > limit:
        ringsList = ringsList[:limit]

for ring in ringsList:
    print(str(ring)+ ",")
