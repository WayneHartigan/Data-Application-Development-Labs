import sys

topFifty = []
limit = 50

for line in sys.stdin:
    line = line.strip()
    data = line.split(",")

    try:
        prices = float(data[1])
    except ValueError:
        continue

    topFifty.append((prices, line))
    topFifty.sort(reverse = True)

    if len(topFifty) > limit:
        topFifty = topFifty[:limit]

for (price, lines) in topFifty:
    print(price)
