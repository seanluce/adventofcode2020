with open('input.txt') as data:
    entries = data.read().splitlines()
#entries = ['2-4 p: vpkpp']
count = 0
for entry in entries:
    policy = str.split(entry)
    numberRange = policy[0].split('-')
    letter = policy[1][0]
    password = policy[2]
    if password.count(letter) >= int(numberRange[0]) and password.count(letter) <= int(numberRange[1]):
        count = count + 1
print(count)