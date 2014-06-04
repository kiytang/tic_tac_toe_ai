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

    def ai_move
      # pick ||= next_strategy
      pick = center_move

      #Attempt winning move
      pick ||= winning_cell_for_marker(@marker)

      #Block opponent   
      pick ||= winning_cell_for_marker(@opponent_marker)

      pick ||= avoid_opposite_fork

      pick ||= avoid_fork_scenario_3
      pick ||= avoid_fork_scenario_4
      pick ||= avoid_fork_scenario_5
      pick ||= avoid_fork_scenario_6
      pick ||= avoid_fork_scenario_7
      pick ||= avoid_fork_scenario_8
      pick ||= avoid_fork_scenario_9
      pick ||= avoid_fork_scenario_10 
      pick ||= random_corner
      pick ||= random_side

      return pick
    end

    #CPU moves to center block 1st if not
    #available it the goes to ai_ove
    def center_move
      if @board.board[4] == Board::EMPTY_CELL
        return 4
      end
    end

    def random_corner
      @board.select_valid_cells(Cell::CORNERS).sample
    end

    def random_side
      @board.select_valid_cells(Cell::SIDES).sample
    end

    def avoid_opposite_fork
      if (opponent_in(2) && opponent_in(6)) || (opponent_in(0) && opponent_in(8))
        random_side
      end
    end

    def avoid_fork_scenario_3
      avoid_scenario([5,6], [7, 8])
    end

    def avoid_fork_scenario_4
      avoid_scenario([0,5], [1, 2])
    end

    def avoid_fork_scenario_5
      avoid_scenario([3,8], [6, 7])
    end

    def avoid_fork_scenario_6
      avoid_scenario([2,3], 0)
    end

    def avoid_fork_scenario_7
      avoid_scenario([3,7], 6)
    end

    def avoid_fork_scenario_8
      avoid_scenario([5,7], 8)
    end

    def avoid_fork_scenario_9
      avoid_scenario([1,3], 0)
    end

    def avoid_fork_scenario_10
      avoid_scenario([1,5], 2)
    end

    def avoid_scenario(opponent_in_all, potential_moves)
      # If pased a single index instead of an array, make it into an Array
      potential_moves = [potential_moves] if potential_moves.class != Array

      if opponent_in_all.all?{|cell| opponent_in(cell) }
        return @board.select_valid_cells(potential_moves).sample
      end
    end

    def opponent_in(index)
      @board.board[index] == @opponent_marker
    end

    # [x,-,x] not consecutive
    # find index of 'dash" in any line where there are x2 of 'marker' and one dash
    def winning_cell_for_marker(marker)
      win_lines = lines_with_winning_move(marker)
      return outstanding_winning_cell(win_lines.first) unless win_lines.empty?
    end

    def lines_with_winning_move(marker)
      @board.winning_combinations.select do |line|
        total_markers(line, marker) == 2 && line_has_empty?(line)
      end
    end

    def total_markers(line, marker)
      line.count { |cell| @board.board[cell] == marker }
    end

    def line_has_empty?(line)
      line.any?{|cell| @board.board[cell] == Board::EMPTY_CELL }
    end

    def outstanding_winning_cell(combo)
      combo.each do |cell|
        if @board.board[cell] == Board::EMPTY_CELL
          return cell
        end
      end
    end  
  end
end