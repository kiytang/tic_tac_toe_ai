module TicTacToe

  class CommandLineGame < Game

    def start_game
      print instructions
      super
    end

    def play_game
      puts "#{players.first.name} has been randomly been selected as the 1st player with assigned marker #{players.first.marker}"
      puts
      puts board
      super
      print_outcome
    end

    def player_turn(player)
      puts
      puts "Player: #{player.name}'s turn"
      super
    end

    def print_outcome
      puts board
      puts "GAME ENDED"
      if board.winner
        puts "#{board.winner} is the winner"
      else
          puts "Game is a Draw"
      end
    end

    def instructions
      puts
      puts "***********************"
      puts "Welcome to Tic-Tac-Toe "
      puts "***********************"
      puts "Best of luck in competing against our computer."
    end
  end
end