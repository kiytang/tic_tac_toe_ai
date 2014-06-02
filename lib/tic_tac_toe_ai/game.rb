module TicTacToe
EMPTY = "-"

  class Game
    attr_reader :board, :players

    def initialize(board = Board.new)
      @board  = board
      @player = players
      players.shuffle!
    end

    def players
      @players ||= [HumanPlayer.new("x", board),
                    ComputerPlayer.new("o", board)]
    end

    def start_game
      print instructions
      puts "#{players.first.name} has been randomly been selected as the 1st player with assigned marker #{players.first.marker}"
      play_game
      outcome
      play_again?
    end

    def play_game 
      puts
      puts board.display_board
      while true
        players.each do |player| 
          puts
          puts "Player: #{player.name}'s turn"
          board.add_move(player.marker, get_move)

          if board.game_ended?
            puts board.display_board
            puts "GAME ENDED"
          end
        end
      end
    end

    def get_move
      number = player.move
      if valid_move?(number)
        number
      else
        player.reprompt
      end
    end

    def valid_move?(number)
      number.between?(0,8) && board.board[number] == EMPTY
    end
    
    def outcome
      if board.winner
        puts "#{board.winner} is the winner"
      else
          puts "Its a Draw"
      end
    end


    def play_again?
      print "To play again, please enter Y or N (Y or N): "
      if STDIN.gets.chomp =~ /Y|y/
        @board = Board.new
        return true
      end
      false
    end

    private

    def instructions
      puts
      puts "***********************"
      puts "Welcome to Tic-Tac-Toe"
      puts "***********************"
      puts "Best of luck in competing against our computer."
    end
  end
end
