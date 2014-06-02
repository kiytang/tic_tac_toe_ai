require "spec_helper"
module TicTacToe
  describe HumanPlayer do

    let(:board){Board.new}
    let(:human){HumanPlayer.new("x", board)}

    it "returns a valid move" do
      human.stub(:prompt_for_move).and_return(0)
      expect(human.move).to be_a Cell
    end

    context "#marker" do
      it "returns the marker" do
        player = HumanPlayer.new('x', nil)
        expect(player.marker).to eq "x"
      end
    end

    context "#players_name" do
      it "returns the player's name" do
        player = HumanPlayer.new("x", nil)
        expect(player.name).to eq "Human"
      end
    end

    # it "returns a valid move" do
      


  end
end

