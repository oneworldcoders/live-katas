require 'rspec'
require 'tennis'

RSpec.describe TennisScorer do

  let (:tennis_scorer) {TennisScorer.new}

  it 'assigns love-lovve scores when no play has been made' do
    expect(TennisScorer.new.score).to eq('love-love')
  end

  describe 'Tests to get player one scores' do
    it 'Assign points when player one has one score' do
        tennis_scorer.assign_points('player1')
        expect(tennis_scorer.score).to eq('fifteen-love')
    end

    it 'Assign points when player one has two scores ' do
        2.times {tennis_scorer.assign_points('player1')} 
        expect(tennis_scorer.score).to eq('thirty-love')
    end

    it 'Assign points when player one has two scores ' do
        3.times {tennis_scorer.assign_points('player1')}
        expect(tennis_scorer.score).to eq('forty-love')
    end
  end

  describe 'Tests that game points can be assigned to both players' do
    it 'Assign points when player two has one score' do
        tennis_scorer.assign_points('player2')
        expect(tennis_scorer.score).to eq('love-fifteen')
    end

    it 'Assign points when player two and player one has one score' do
        tennis_scorer.assign_points('player2')
        tennis_scorer.assign_points('player1')
        expect(tennis_scorer.score).to eq('fifteen-fifteen')
    end

    it 'Assign points when player two has two scores and player one has one score' do
        2.times {tennis_scorer.assign_points('player2')}
        tennis_scorer.assign_points('player1')
        expect(tennis_scorer.score).to eq('fifteen-thirty')
    end

    it 'Assign points when player two has three scores and player one has one score' do
        3.times {tennis_scorer.assign_points('player2')}
        tennis_scorer.assign_points('player1')
        expect(tennis_scorer.score).to eq('fifteen-forty')
    end

    it 'Assign points when player two has an advantage and player one has one score' do
        4.times {tennis_scorer.assign_points('player2')}
        tennis_scorer.assign_points('player1')
        expect(tennis_scorer.score).to eq('fifteen-advantage')
    end

    it 'Assign points when player two has an advantage and player one has one score' do
        5.times {tennis_scorer.assign_points('player2')}
        tennis_scorer.assign_points('player1')
        expect(tennis_scorer.score).to eq('fifteen-game win')
    end

    it 'Assign points when player two has an advantage and player one has one score' do
        6.times {tennis_scorer.assign_points('player2')}
        tennis_scorer.assign_points('player1')
    end
  end
end