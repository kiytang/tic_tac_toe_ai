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
      
    xit "doesn't try to play in a corner which is taken" do
      board.add_move("o", 4)
      board.add_move("x", 0)
      Array.any_instance.stub(:sample).and_return{|a| a.first}
      expect(computer.move.index == 0).to be_false
    end

    it "goes for winning moves" do
      board.add_move("o", 0)
      board.add_move("o", 4)
      expect(computer.move.index).to eq 8
    end

  	it "blocks opponents winning moves" do
      board.add_move("x", 0)
      board.add_move("x", 4)
      expect(computer.move.index).to eq 8

  	end
  end

end