module TicTacToe
  class Computer
    attr_reader :board, :marker, :name

    def initialize(input)
      @marker = input.fetch(:marker)
      @name   = input.fetch(:name)
      @board  = input.fetch(:board)
    end
    
    #CPU moves to center block 1st if not
    #available it the goes to ai_ove
    def center_move
      if @board.board[4] == Board::EMPTY
        return 4
      end
    end

    def human?
      false
    end

    def cpu_move
      return center_move if center_move
      # puts ai_move
      return ai_move      
      # @board.board.each_with_index do |cell, idx|
      #   if cell == Board::EMPTY
      #     return idx
      #   end
      # end
    end

    def ai_move
      @board.winning_combinations.each do |combo|
        if consecutive_markers(combo, computer.marker) == 2
        puts outstanding_winning_cell(row)
          return outstanding_winning_cell(row)
        end
      end

      #Block opponent
      @board.winning_combinations.each do |combo|
        if consecutive_markers(combo, player.marker) == 2
            puts outstanding_winning_cell(combo)  
          return outstanding_winning_cell(combo)
        end
      end  
    end

    #First, check if we can win in the next move
    def consecutive_markers(combo, marker)
      total = 0
      combo.each do |cell|
        total +=1 if board.board[cell] == marker
        unless board.board[cell] == marker || 
        @board.board[cell] == Board::EMPTY
          return 0
        end
      end
      total
    end

    def outstanding_winning_cell(combo)
      combo.each do |cell|
        if @board.board[cell] == Board::EMPTY
          return cell
        end
      end
    end  
  end
end