import sys

MyList = []
n = 5

for line in sys.stdin:
    line = line.strip()
    data = line.split(",")

    try:
        shellRings = float(data[8])
    except:
        continue

    if str(data[0])=='M':
        MyList.append((shellRings, line))

    MyList.sort(reverse=True)

    if len(MyList) > n:
        MyList = MyList[:n]

for (k,v) in MyList:
    print('%s\t%s' % (v.split(",")[0], k))
