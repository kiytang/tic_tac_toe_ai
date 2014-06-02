require "spec_helper"

module TicTacToe
  describe ComputerPlayer do

    let(:board){Board.new}
    let(:computer){ComputerPlayer.new("o", board)}

    it "returns a valid move" do
      expect(computer.move).to be_a Cell
    end

    it "takes center when avaliable" do
      expect(computer.move.center?).to be_true
    end

    it "returns a corner when center is taken" do
      board.add_move("x", 4)
      expect(computer.move.corner?).to be_true
    end
      
    
  end

end