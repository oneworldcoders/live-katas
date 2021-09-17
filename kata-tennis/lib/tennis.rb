class TennisScorer
  def initialize
    @points = 'love'
    @player = {'player1' => 'love', 'player2' => 'love'}
  end

  def assign_points(which_player)
    score = {'love' => 'fifteen', 'fifteen' => 'thirty', 'thirty' => 'forty', 'forty' => 'advantage', 'advantage' => 'game win'}
    @points = score[@player[which_player]]
    @player[which_player] = @points
    if @points == 'game win'
      declare_winner(which_player)
    end
  end

  def declare_winner(which_player)
    puts "#{which_player} has won"
  end

  def score 
    "#{@player['player1']}-#{@player['player2']}"
  end
end