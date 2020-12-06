with open('input.txt') as data:
    entries = data.read().splitlines()
for firstentry in entries:
    for secondentry in entries:
        for thirdentry in entries:
            if int(firstentry) + int(secondentry) + int(thirdentry) == 2020:
                print(int(firstentry) * int(secondentry) * int(thirdentry))