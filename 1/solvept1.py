with open('input.txt') as data:
    entries = data.read().splitlines()
for firstentry in entries:
    for secondentry in entries:
        if int(firstentry) + int(secondentry) == 2020:
            print(firstentry)
            print(secondentry)
            print(int(firstentry) * int(secondentry))