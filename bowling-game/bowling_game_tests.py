import unittest
from BowlingGame import BowlingGame


class TestBowlingGame(unittest.TestCase):
    def setUp(self):
        self.game = BowlingGame()

    def test_gutter_game(self):
        self.rollMany(0, 20)
        self.assertEqual(self.game.score(), 0, "It should return 0 when the user roll only zeros")

    def test_all_ones_game(self):
        self.rollMany(1, 20)
        self.assertEqual(self.game.score(), 20, "It should return 20 when the user roll all ones")

    def test_all_one_spare(self):
        self.game.roll(5)
        self.game.roll(5)
        self.game.roll(3)
        self.rollMany(0, 17)
        self.assertEqual(self.game.score(), 16, "It should return 16 for a spare game")

    def test_all_one_strike(self):
        self.game.roll(10)
        self.game.roll(5)
        self.game.roll(3)
        self.rollMany(0, 16)
        self.assertEqual(self.game.score(), 26, "It should return 26 for a strike game")

    def test_perfect_game(self):
        self.rollMany(10, 12)
        self.assertEqual(self.game.score(), 300, "It should return 300 for a perfect game")

    def rollMany(self, pins, rolls):
        for i in range(rolls):
            self.game.roll(pins)


if __name__ == "__main__":
    unittest.main()
