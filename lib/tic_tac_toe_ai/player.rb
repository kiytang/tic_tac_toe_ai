module TicTacToe

  class Player
    attr_reader :marker, :name
    
    def initialize(input)
      @marker = input.fetch(:marker)
      @name   = input.fetch(:name)  
    end

    # def initialize(character)
    #   @marker = character
    # end 

    # def whats_your_move
      # returns a number

      # if human do #gets
      # if computer do random
    # end
  end
end   