package game

type Game struct{
    Rolls []int
    CurrentRoll int
}

func(game Game) Initialize() Game {
    game.CurrentRoll = 0
    game.Rolls = make([]int, 21)
    return game
}

func(game *Game) Roll(pins int) {
    game.Rolls[game.CurrentRoll] = pins
    game.CurrentRoll++
}

func(game Game) Score() int {
    var score int = 0
    var rollIndex int = 0

    for frame := 0; frame < 10; frame ++ {
        if game.IsStrike(rollIndex) {
            score += game.Rolls[rollIndex] + game.Rolls[rollIndex + 1] + game.Rolls[rollIndex + 2]
            rollIndex += 1
        } else if game.IsSpare(rollIndex){
            score += game.Rolls[rollIndex] + game.Rolls[rollIndex + 1] + game.Rolls[rollIndex + 2]
            rollIndex += 2
        } else{
            score += game.Rolls[rollIndex] + game.Rolls[rollIndex + 1]
            rollIndex += 2
        }
    }

    return score
}

func(game Game) IsStrike(index int) bool {
    return game.Rolls[index] == 10
}

func(game Game) IsSpare(index int) bool {
    return game.Rolls[index] + game.Rolls[index + 1] == 10
}

func(game Game) RollMany(rolls int, pins int) {
    for i := 0; i < rolls; i++ {
        game.Roll(pins)
    }
}
