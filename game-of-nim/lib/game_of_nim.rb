module Game
    def self.remove_sticks(output = $stdout, input = $stdin)
      move = []
      output.puts 'Enter the number of sticks to be removed'
      move << input.gets.chomp.to_i
      output.puts 'Enter pile index'
      move << input.gets.chomp.to_i
      move
    end
  
    def self.validate_move(piles, move)
      move[1] < piles.length and move[0] <= piles[move[1]] && move[0].positive?
    end
  
    def self.play(piles, output = $stdout, input = $stdin)
      current_player = 'Player 1'
  
      until piles.empty?
        output.puts "#{current_player}'s turn:"
        move = remove_sticks(output, input)
        next unless validate_move(piles, move)
  
        piles[move[1]] = piles[move[1]] - move[0]
        piles.delete(0)
        break if piles.empty?
  
        current_player = current_player == 'Player 1' ? 'Player 2' : 'Player 1'
  
      end
  
      "Congrats! #{current_player} you won"
    end
  end
  