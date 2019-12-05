import sys
ages = []

for line in sys.stdin:
    line = line.strip()
    data = line.split(",")
    try:
        age = int(data[0])
    except ValueError:
        continue
    ages.append((age, data[9]))
    ages.sort(reverse=True)

for (age, gender) in ages:
    print("{}, {}".format(age, gender))
