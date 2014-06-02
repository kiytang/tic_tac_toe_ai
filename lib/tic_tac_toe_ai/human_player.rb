module TicTacToe
  class HumanPlayer < Player

    def initialize(marker)
      @marker = marker
      @name   = "Human"
    end

    def move(board)
      puts board.display_board
      prompt_for_move
    end

    def prompt_for_move
      print "To select your move, please enter a number between 0 to 8: "
      return gets.chomp.to_i
    end

    def reprompt(board)
      puts "Number has to be between 0 and 8, Please re-enter"
      puts board.display_board
      return prompt_for_move
    end

  end
end