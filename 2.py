items = [l.strip() for l in open("2.in")]

Rock = 1
Paper = 2
Scissors = 3

Draw = 3 
Win = 6
Loss = 0

Player_1 = {
    'A': Rock,
    'B': Paper,
    'C': Scissors
}

Player_2 = {
    'X': Rock,
    'Y': Paper,
    'Z': Scissors
}

total = 0
for item in items:
    [p1, p2] = item.split(' ')
    print(p1, p2)
    if Player_1[p1] - Player_2[p2] == -1 or Player_1[p1] - Player_2[p2] == 2:
        total = total + Win + Player_2[p2] #win
    elif Player_1[p1] - Player_2[p2] == 0:
        total = total + Draw + Player_2[p2] #draw
    else:
        total = total + Loss + Player_2[p2] #loss

print(total)
