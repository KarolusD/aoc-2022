items = [l.strip() for l in open("1.in")]

max = 0
elf = 0
elves = []
for item in items: 
    if item != '': #empty line
        elf = elf + int(item)
    if item == '':
        if elf > max:
            max = elf
        elves.append(elf)
        elf = 0

print(max)
s_elves = sorted(elves)
print(sum(s_elves[-3:]))
