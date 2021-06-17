require_relative '../lib/game_of_nim'
require 'stringio'

RSpec.describe Game do
  let(:output) { StringIO.new }
  let(:input) { StringIO.new("1\n0\n") }

  context '.remove_sticks' do
    it 'prompt the player to remove sticks from a given pile' do
      subject.remove_sticks(output, input)
      expect(output.string).to include('Enter the number of sticks to be removed')
    end

    it 'receives and returns player move as an array of sticks and pile index' do
      expect(subject.remove_sticks(output, input)).to eq([1, 0])
    end
  end

  describe 'validate players move' do
    context 'in terms of scope' do
      it 'returns false if the index is out of range' do
        expect(subject.validate_move([1, 2, 3], [1, 4])).to eq false
      end

      it 'returns true if the index is in range' do
        expect(subject.validate_move([1, 2, 3], [1, 1])).to eq true
      end
    end

    context 'in terms of sticks to be removed' do
      it 'return false if sticks to be removed are greater than available in a pile' do
        expect(subject.validate_move([1, 2, 3, 4], [5, 0])).to eq false
      end

      it 'return true if sticks to be removed are acceptable' do
        expect(subject.validate_move([1, 2, 3, 4], [1, 0])).to eq true
      end

      it 'return false if there are no sticks to be removed' do
        expect(subject.validate_move([1, 2, 3, 4], [0, 0])).to eq false
      end
    end
  end

  context '.play' do
    it 'should declare player 1 as winner if we have 1 stick in 1 pile' do
      expect(subject.play([1], output, input)).to eq('Congrats! Player 1 you won')
    end

    it 'should declare player 2 as winner if we have 1 stick in each of 2 piles' do
      input = StringIO.new("1\n0\n1\n0\n")
      expect(subject.play([1, 1], output, input)).to eq('Congrats! Player 2 you won')
    end

    it 'should declare player 1 as winner if we have multiple sticks from multiple piles' do
      input = StringIO.new("1\n0\n2\n0\n3\n0\n")
      expect(subject.play([1, 2, 3], output, input)).to eq('Congrats! Player 1 you won')
    end

    it 'should declare player 1 as winner if we have multiple sticks from multiple piles' do
      input = StringIO.new("2\n0\n1\n0\n2\n0\n3\n0\n")
      expect(subject.play([1, 2, 3], output, input)).to eq('Congrats! Player 1 you won')
    end
  end
end
