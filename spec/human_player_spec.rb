require "spec_helper"
module TicTacToe
  describe HumanPlayer do

    context "#marker" do
      it "returns the marker" do
        player = HumanPlayer.new('x')
        expect(player.marker).to eq "x"
      end
    end

    context "#players_name" do
      it "returns the player's name" do
        player = HumanPlayer.new("x")
        expect(player.name).to eq "Human"
      end
    end

    # it "returns a valid move" do
      


  end
end

