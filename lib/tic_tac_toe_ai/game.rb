module TicTacToe

  class Game
    attr_reader :board

    def initialize
      @board = Board.new
    end

    def players
      @players ||= [Player.new("x"),
                    Player.new("o")]
    end

    def start_game
      puts board.display_board

      players.each do |player| 
        puts "Player #{player.marker}'s turn"
        number = gets.to_i
        board.add_move(player.marker, number)
        puts board.display_board
      end
    end
  end
end