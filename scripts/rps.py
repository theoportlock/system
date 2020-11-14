import random
scoring = [
        [ 0, 1,-1],
        [-1, 0, 1],
        [1 ,-1, 0]]
score = 0

while True:
    inp = input("Rock, paper, scissors (rps): ")
    ans = random.choice("rps")
    print(ans)
    score += scoring["rps".find(ans)]["rps".find(inp)]
    print(score)
