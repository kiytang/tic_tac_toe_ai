module TicTacToe
  class Prompter
    def self.get_move
      print "To select your move, please enter a number between 0 to 8: "
      gets.chomp.to_i
    end

    def self.play_again?
      print "To play again, please enter Y or N (Y or N): "
      if STDIN.gets.chomp =~ /Y|y/
        yield
        return true
      end
      false
    end
  end
end