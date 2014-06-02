module TicTacToe
  class HumanPlayer < Player

    def initialize(marker, board)
      @marker = marker
      @name   = "Human"
      @board = board
    end

    def move
      puts @board.display_board
      prompt_for_move
    end

    def prompt_for_move
      print "To select your move, please enter a number between 0 to 8: "
      number = gets.chomp.to_i
      if check_input(number)
        return number
        # puts @board.display_board   
      else
        puts "Number has to be between 0 and 8, Please re-enter"
        puts display_board
        return prompt_for_move
      end
    end

    def check_input(number)
      if number.between?(0,8) && @board.board[number] == EMPTY
        true
      else
        false
      end
    end

  end
end