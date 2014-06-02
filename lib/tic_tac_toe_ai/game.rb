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
      @players ||= [Player.new(marker: "x", name: "Human"),
                    Computer.new(marker: "o", name: "Computer", board: board)]
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
          if player.human?
            puts human_move
          elsif
            board.add_move(player.marker, player.cpu_move)
            puts board.display_board
          else board.game_ended?
            puts "GAME ENDED"
            return nil
          end
        end
      end
    end
   # board has ended, who won?

    def human_move
      print "To select your move, please enter a number between 0 to 8: "
      number = gets.chomp.to_i
      if check_input(number)
        board.add_move(player.marker, number)
        # puts board.display_board   
      else
        puts "Number has to be between 0 and 8, Please re-enter"
        puts display_board
        human_move
      end
    end

    #need to check how I can also incorpate this check strategy with CPU
    def check_input(number)
      if number.between?(0,8) && board.board[number] == EMPTY
        true
      else
        false
      end
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
