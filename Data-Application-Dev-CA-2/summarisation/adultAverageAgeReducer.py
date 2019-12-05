import sys

ages = []

for line in sys.stdin:
    line = line.strip()
    data = line.split(",")

    try:
        ages.append(int(data[0]))
    except ValueError:
        continue

    ages.sort(reverse=True)
    if ages > 1:
        maxAge = str(ages[:1])
    ages.sort(reverse=False)
    if ages > 1:
        minAge = str(ages[:1])

if ages:
    average = sum(ages) / len(ages)
    print("The average age is {}".format(average))
    print("The max age is {}".format(maxAge))
    print("The min age is {}".format(minAge))
