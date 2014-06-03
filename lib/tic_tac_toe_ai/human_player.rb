module TicTacToe
  class HumanPlayer < Player

    def initialize(marker, board)
      @marker = marker
      @name   = "Human"
      @board  = board
    end

    def move
      puts @board.display_board
      prompt_for_move
    end

    def prompt_for_move
      return Cell.new(Prompter.get_move)
    end

    def reprompt
      puts "Please re-enter, number must lie between 0 and 8 and not already taken"
      puts @board.display_board
      return prompt_for_move
    end

  end

  class Prompter
    def self.get_move
      print "To select your move, please enter a number between 0 to 8: "
      gets.chomp.to_i
    end
  end
end
