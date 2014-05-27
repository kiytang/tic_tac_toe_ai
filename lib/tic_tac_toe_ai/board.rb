module TicTacToe
  class Board
    EMPTY = "-"
    attr_accessor :board, :win_combintions

    def initialize
      @board =[EMPTY] * 9
      @winning_combintions = [[1,2,3],[4,5,6],[7,8,9], #rows
                              [1,4,7],[2,5,8],[3,6,7], #columns
                              [1,5,9],[3,5,7]]         #diagonals  
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
      @board[4] = marker
    end

    # def choose_marker
    #   marker == ' '
    #   while not (marker == 'X' || marker == 'O')
    #     print('Do you want to be X or O?')
    #     letter = input().upcase
    #   end  
    # end
  end
end
