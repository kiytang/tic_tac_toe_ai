module TicTacToe
  class Computer

    #CPU moves to center block 1st if not
    #available it the goes to ai_ove
    def center_move
      if @board.board[4] == EMPTY
        cell = 4
      else
        cell = ai_move
      end
    end

    def ai_move
      #take win at any instance
      @winning_combintions.each do |row|
        if consecutive_markers(row, "o") == 2
          return outstanding_winning_cell(row)
        end
      end

      #Block opponent
      @winning_combinations.each do |row|
        if consecutive_markers(row, "x") == 2
          return outstanding_winning_cell(row)
        end
      end  

      
    end
    #First, check if we can win in the next move
    def consecutive_markers(row, marker)
      total = 0
      row.each do |cell|
        total +=1 if @board[cell] == marker
        unless @board[cell] == marker || 
        @board[cell] == EMPTY
          return 0
        end
      end
      total
    end

    def outstanding_winning_cell(row)
      row.each do |cell|
        if @board[index] == EMPTY
          return cell
        end
      end
    end  
  end
end