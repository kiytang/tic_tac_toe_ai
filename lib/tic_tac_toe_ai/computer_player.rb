module TicTacToe
  class ComputerPlayer < Player

    def initialize(marker, board)
      @marker = marker
      @name   = "Computer"
      @board  = board
      @opponent_marker  = (marker=="x")? "o" : "x"
    end

    def move
      Cell.new(ai_move)
    end
    
    private

    #CPU moves to center block 1st if not
    #available it the goes to ai_ove
    def center_move
      if @board.board[4] == Board::EMPTY
        return 4
      end
    end

    def ai_move
      pick = center_move

      #Attempt winning move
      pick ||= winning_cell_for_marker(@marker)

      #Block opponent
      pick ||= winning_cell_for_marker(@opponent_marker)

      pick ||= avoid_opposite_fork
      pick ||= random_corner
      # pick ||= next_strategy
      pick ||= random_side

      return pick
    end

    def random_corner
      Cell::CORNERS.select{|index| @board.empty?(index)}.sample
    end

    def random_side
      Cell::SIDES.select{|index| @board.empty?(index)}.sample
    end

    def avoid_opposite_fork
      if (opponent_in(2) && opponent_in(6)) || (opponent_in(0) && opponent_in(8))
        random_side
      end
    end

    def opponent_in(index)
      @board.board[index] == @opponent_marker
    end

    # [x,-,x] not consecutive
    # find index of dash in any line where there are two of 'marker' and one dash
    def winning_cell_for_marker(marker)
      @board.winning_combinations.each do |line|
        if total_markers(line, marker) == 2 && line_has_empty?(line)
          return outstanding_winning_cell(line)
        end
      end
      return nil
    end

    def total_markers(line, marker)
      total = 0
      line.each do |cell|
        total += 1 if @board.board[cell] == marker
      end
      total
    end

    def line_has_empty?(line)
      line.any?{|cell| @board.board[cell] == Board::EMPTY }
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