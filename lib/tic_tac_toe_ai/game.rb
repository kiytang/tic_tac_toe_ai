module TicTacToe

  class Game
    attr_reader :board, :players, :current_player, :other_player

    def initialize(board = Board.new)
      @board  = board
      @player = players
      @current_player, @other_player = players.shuffle!
    end

    def players
      @players ||= [Player.new(marker: "x", name: "bob"),
                    Player.new(marker: "o", name: "fred")]
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player 
    end

    def start_game
      print instructions
      puts "#{current_player.name} has randomly been selected as the 1st player"
      play_game
      outcome
    end

    def play_game  
      #need to select human or computer player
      puts board.display_board
      while true
        # convert to loop till board ends
        players.each do |player| 
          puts "Player #{player.marker}'s turn"
          number = gets.to_i
          board.add_move(player.marker, number)
          puts board.display_board
          #board ended? if so quit loop
          # break if board.game_ended?
          if board.game_ended?
            puts "GAME ENDED"
            return nil
          end
        end
      end
    end
   # board has ended, who won?
    def outcome
      if board.draw?
        puts "Its a Draw"
      else
        puts "#{board.winner} is the winner"
      end
    end

# then next have human player enter console value.
    def human_move
      print "Please enter your selction between 0 and 8"
      selection = gets.chomp.to_i
      #want to check that number lies between 0 and 8
      until available_move?(index)
       puts "Invalid move, please try again."
       display_board
       human_move
      end
    end

    def available_move?(move)
      if move.between?(0..8) && @board.board[index] == EMPTY
        true
      else
        false
      end
    end

# computer returns random value

    def play_again?
      print "Play Again? (Y or N): "
      if STDIN.gets.chomp =~ /Y|y/
        @board = Board.new
        return true
      end
      false
    end

    private

    def instructions
      puts "Welcome to Tic-Tac_Toe\n Best of luck in competing against Ruby."
    end
  end
end
