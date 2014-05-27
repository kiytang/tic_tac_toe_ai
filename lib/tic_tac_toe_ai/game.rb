module TicTacToe

  class Game
    attr_reader :board

    def initialize
      @board = Board.new
    end

    def start_game
      puts board.display_board

      a = gets
    end
  end
end


