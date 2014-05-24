module TicTacToe
  class Board
    EMPTY = " ".freeze
    attr_accessor :board, :win_combintions

    def initialize
      @board =[EMPTY] * 9
      @win_combintions = [[1,2,3],[4,5,6],[7,8,9] #rows
                          [1,4,7],[2,5,8],[3,6,7] #columns
                          [1,5,9],[3,5,7]         #diagonals  
    end

    def display_board
      print "+++++++++++++++"
      print "| #{@board[1]} | #{@board[1]} | #{@board[2]} |"
      print "______________"
      print "| #{@board[4]} | #{@board[5]} | #{@board[6]} |"
      print "______________"
      print "| #{@board[7]} | #{@board[8]} | #{@board[9]} |"
      print "+++++++++++++++"
    end
  end
end
