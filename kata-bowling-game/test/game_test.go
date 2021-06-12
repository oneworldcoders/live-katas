package game_test

import  (

	"testing"
	."github.com/franela/goblin"
	."../src"
)

func Test(t *testing.T){
	g := Goblin(t)

	g.Describe("Start Game: Roll Once", func() {
        game := Game{}
	    g.It("hits zero pins", func(){
	        bowling := game.Initialize()
	        bowling.Roll(0)

	        g.Assert(bowling.Score()).Equal(0)
	    })

	    g.It("hits one pin", func(){
            bowling := game.Initialize()
            bowling.Roll(1)

            g.Assert(bowling.Score()).Equal(1)
        })

        g.It("hits one pin", func(){
            bowling := game.Initialize()
            bowling.Roll(8)

            g.Assert(bowling.Score()).Equal(8)
        })
	})

    g.Describe("Start Game: Roll Twice", func() {
        game := Game{}
        g.It("hits zero pins", func(){
            bowling := game.Initialize()
            bowling.Roll(0)
            bowling.Roll(0)

            g.Assert(bowling.Score()).Equal(0)
        })

        g.It("hits one and five pin", func(){
            bowling := game.Initialize()
            bowling.Roll(1)
            bowling.Roll(5)

            g.Assert(bowling.Score()).Equal(6)
        })

        g.It("hits six and three pin", func(){
           bowling := game.Initialize()
            bowling.Roll(6)
            bowling.Roll(3)

            g.Assert(bowling.Score()).Equal(9)
        })
    })

    g.Describe("Start Game: Roll N Times", func() {
        game := Game{}
        g.It("hits zero pins for 20 rolls", func(){
            bowling := game.Initialize()
            bowling.RollMany(20, 0)

            g.Assert(bowling.Score()).Equal(0)
        })

        g.It("hits one, three and five pin", func(){
            bowling := game.Initialize()
            bowling.Roll(1)
            bowling.Roll(3)
            bowling.Roll(5)

            g.Assert(bowling.Score()).Equal(9)
        })

        g.It("hits a strike", func(){
           bowling := game.Initialize()
            bowling.Roll(10)

            bowling.Roll(3)
            bowling.Roll(5)

            g.Assert(bowling.Score()).Equal(26)
        })


        g.It("hits a spare", func(){
           bowling := game.Initialize()
            bowling.Roll(4)
            bowling.Roll(6)

            bowling.Roll(3)
            bowling.Roll(5)

            g.Assert(bowling.Score()).Equal(21)
        })

        g.It("hits a spare and  a strike", func(){
           bowling := game.Initialize()
            bowling.Roll(10)

            bowling.Roll(6)
            bowling.Roll(2)

            bowling.Roll(4)
            bowling.Roll(6)

            bowling.Roll(2)
            bowling.Roll(1)

            bowling.RollMany(13, 0)

            g.Assert(bowling.Score()).Equal(41)
        })
    })
}

