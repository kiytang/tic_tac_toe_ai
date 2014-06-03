module TicTacToe
EMPTY = "-"

  class Game
    attr_reader :board, :players

    def initialize(board = Board.new)
      @board  = board
      @player = players
      reset_players(board)
    end

    def reset_players(board)
      @players = [HumanPlayer.new("x", board),
                    ComputerPlayer.new("o", board)]
      players.shuffle!
    end


    def start_game
      print instructions
      begin
        puts "#{players.first.name} has been randomly been selected as the 1st player with assigned marker #{players.first.marker}"
        play_game
        outcome
      end while play_again?
    end

    def play_game 
      puts
      puts board.display_board
      while true
        players.each do |player| 
          puts
          puts "Player: #{player.name}'s turn"
          board.add_move(player.marker, get_move(player))

          if board.game_ended?
            puts board.display_board
            puts "GAME ENDED"
            return
          end
        end
      end
    end

    def get_move(player)
      index = player.move.index
      reprompt_if_invalid(player, index)
    end

    def reprompt_if_invalid(player, index)
      if board.valid_move?(index)
        index
      else
        new_move = player.reprompt
        reprompt_if_invalid(player, new_move.index)
      end
    end
    
    def outcome
      if board.winner
        puts "#{board.winner} is the winner"
      else
          puts "Game is a Draw"
      end
    end

    def play_again?
      print "To play again, please enter Y or N (Y or N): "
      if STDIN.gets.chomp =~ /Y|y/
        @board = Board.new
        reset_players(board)
        return true
      end
      false
    end

    private

    def instructions
      puts
      puts "***********************"
      puts "Welcome to Tic-Tac-Toe "
      puts "***********************"
      puts "Best of luck in competing against our computer."
    end
  end
end
