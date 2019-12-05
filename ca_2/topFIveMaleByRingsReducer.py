import sys

myList = []
n = 5

for line in sys.stdin:
    line = line.strip()
    data = line.split("\t")

    try:
        shellRings = float(data[1])
    except ValueError:
        continue


    myList.append((shellRings, line))
    myList.sort(reverse=True)

    if len(myList) > n:
        myList = myList[:n]

for (k,v) in myList:
    print(v)
