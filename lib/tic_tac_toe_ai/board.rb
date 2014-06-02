module TicTacToe
  class Board
    EMPTY = "-"
    attr_reader :board, :winning_combinations

    def initialize
      @board = [EMPTY] * 9
      @winning_combinations = [[0,1,2],[3,4,5],[6,7,8], #rows
                              [0,3,6],[1,4,7],[2,5,8],  #columns
                              [0,4,8],[2,4,6]]          #diagonals  
    end

    def display_board
       "+++++++++++++\n"+
       "| #{@board[0]} | #{@board[1]} | #{@board[2]} |\n" +
       "_____________\n" +
       "| #{@board[3]} | #{@board[4]} | #{@board[5]} |\n" +
       "_____________\n"+
       "| #{@board[6]} | #{@board[7]} | #{@board[8]} |\n" +
       "+++++++++++++"
    end

    def add_move(marker, number)
      @board[number] = marker
    end

    def winner
      winning_combinations.each do |combo|
        result = combo.map do |index|
          x_indexes.include?(index)
        end.uniq

        win = (result == [true])

        return "x" if win
      end

      winning_combinations.each do |combo|
        result = combo.map do |index|
          o_indexes.include?(index)
        end.uniq

        win = (result == [true])

        return "o" if win
      end

      nil
    end

    def draw? #http://www.waywordradio.org/tic-tac-toe-cats-game/
      # !winner && 
      # @board.none? {|cell| cell == EMPTY }
      @board.each do |cell|
        if cell == EMPTY
          return false
        end
      end
      true
      # puts "The game is a draw"
    end

    def game_ended?
      if winner || draw?
        return true
      end
      false
    end
    

    private

    def o_indexes
      indexes("o")
    end

    def x_indexes
      indexes("x")
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
