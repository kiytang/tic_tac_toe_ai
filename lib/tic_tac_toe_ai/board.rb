module TicTacToe
  class Board
    EMPTY_CELL = "-"
    attr_reader :board, :winning_combinations

    def initialize
      @board = [EMPTY_CELL] * 9
      @winning_combinations = [[0,1,2],[3,4,5],[6,7,8], #rows
                              [0,3,6],[1,4,7],[2,5,8],  #columns
                              [0,4,8],[2,4,6]]          #diagonals  
    end

    def to_s
       "+++++++++++++\n"+
       "| #{@board[0]} | #{@board[1]} | #{@board[2]} |\n" +
       "_____________\n" +
       "| #{@board[3]} | #{@board[4]} | #{@board[5]} |\n" +
       "_____________\n"+
       "| #{@board[6]} | #{@board[7]} | #{@board[8]} |\n" +
       "+++++++++++++"
    end

    def empty?(index)
      board[index] == EMPTY_CELL
    end

    def valid_move?(index)
      index.between?(0,8) && empty?(index)
    end

    def select_valid_cells(indicies)
      indicies.select{|index| empty?(index) }
    end

    def add_move(marker, number)
      @board[number] = marker
    end

    def winner
      return "x" if winner?("x")
      return "o" if winner?("o")
      nil
    end

    def draw? #http://www.waywordradio.org/tic-tac-toe-cats-game/
      @board.none? {|cell| cell == EMPTY_CELL }
    end

    def game_ended?
      !!(winner || draw?)
    end
    
    private
    def winner?(marker)
      winning_combinations.any? do |combo|
        combo.all? do |index|
          indexes(marker).include?(index)
        end
      end
    end

    def indexes(input_marker)
      board.each_with_index.map do |marker, index|
        if marker == input_marker
          index
        end
      end.compact
    end
  end
end
