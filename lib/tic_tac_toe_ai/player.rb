module TicTacToe

  class Player
    attr_reader :marker, :name
    
    def initialize(input)
      @marker = input.fetch(:marker)
      @name   = input.fetch(:name)  
    end

    def human?
      true
    end
  end
end   