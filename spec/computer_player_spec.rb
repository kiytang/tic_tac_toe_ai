require "spec_helper"

module TicTacToe
  describe ComputerPlayer do

    let(:board){Board.new}
    let(:computer){ComputerPlayer.new("o", board)}

    it "should return a valid move" do
      expect(computer.move).to be_a Cell
    end

    it "should take the center cell when avaliable" do
      expect(computer.move.center?).to be_true
    end

    it "should return a corner cell when center cell is taken" do
      board.add_move("x", 4)
      expect(computer.move.corner?).to be_true
    end
    
    #Conducted various scenarios, but was still unable to complete.   
    xit "doesn't try to play in a corner which is taken" do
      board.add_move("o", 4)
      board.add_move("x", 0)
      Array.any_instance.stub(:sample).and_return{|a| a.first}
      expect(computer.move.index == 0).to be_false
    end

    it "should complete winning move at all possible times" do
      board.add_move("o", 0)
      board.add_move("o", 4)
      expect(computer.move.index).to eq 8
    end

  	it "should block opponents winning moves" do
      board.add_move("x", 0)
      board.add_move("x", 4)
      expect(computer.move.index).to eq 8
  	end

    it "should avoid_fork_scenario_3" do
      board.add_move("x", 5)
      board.add_move("o", 4)
      board.add_move("x", 6)
      expect(computer.move.index).to eq 7  
    end

    it "should avoid_fork_scenario_4" do
      board.add_move("x", 0)
      board.add_move("o", 4)
      board.add_move("x", 5)
      expect(computer.move.index).to eq 1  
    end

    it "should avoid_fork_scenario_5" do
      board.add_move("x", 3)
      board.add_move("o", 4)
      board.add_move("x", 8)
      expect(computer.move.index).to eq 6 
    end

    it "should avoid_fork_scenario_6" do
      board.add_move("x", 2)
      board.add_move("o", 4)
      board.add_move("x", 3)
      expect(computer.move.index).to eq 0 
    end

    it "should avoid_fork_scenario_7" do
      board.add_move("x", 3)
      board.add_move("o", 4)
      board.add_move("x", 7)
      expect(computer.move.index).to eq 6
    end

    it "should avoid_fork_scenario_8" do
      board.add_move("x", 5)
      board.add_move("o", 4)
      board.add_move("x", 7)
      expect(computer.move.index).to eq 8
    end

    it "should avoid_fork_scenario_9" do
      board.add_move("x", 1)
      board.add_move("o", 4)
      board.add_move("x", 3)
      expect(computer.move.index).to eq 0
    end

   


  end
end