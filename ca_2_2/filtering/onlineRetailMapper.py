import sys

topPrice = []
limit = 500

for line in sys.stdin:
    line = line.strip()
    data = line.split(",")
    try:
        topPrices = float(data[5])
    except ValueError:
        continue

    if str(data[7]) == "United Kingdom":
        topPrice.append((topPrices, line))

    topPrice.sort(reverse=True)

    if len(topPrice) > limit:
        topPrice = topPrice[:limit]

for (k, v) in topPrice:
    print('{}, {}'.format(v.split(",")[7], k))
