module TicTacToe
  class ComputerPlayer < Player

    def initialize(marker, board)
      @marker = marker
      @name   = "Computer"
      @board  = board
      @opponent_marker  = (marker=="x")? "o" : "x"
    end

    def move
      Cell.new(get_cpu_move)
    end
    
    private

    #CPU moves to center block 1st if not
    #available it the goes to ai_ove
    def center_move
      if @board.board[4] == Board::EMPTY
        return 4
      end
    end

    def get_cpu_move
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

      #Attempt winning move
      pick = winning_cell_for_marker(@marker)

      #Block opponent
      pick ||= winning_cell_for_marker(@opponent_marker)

      pick ||= random_corner
      # pick ||= next_strategy

      return pick

    end

    def random_corner
      Cell::CORNERS.sample
    end

    def winning_cell_for_marker(marker)
      @board.winning_combinations.each do |combo|
        if consecutive_markers(combo, marker) == 2
          puts outstanding_winning_cell(row)
          return outstanding_winning_cell(row)
        end
      end
      return nil
    end

    #First, check if we can win in the next move
    def consecutive_markers(combo, marker)
      total = 0
      combo.each do |cell|
        total +=1 if @board.board[cell] == marker
        unless @board.board[cell] == marker || 
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