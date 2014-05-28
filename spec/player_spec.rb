require "spec_helper"
module TicTacToe
  describe Player do
    
    context "#marker" do
      it "returns the marker" do
        input = {marker: "x", name: "Ruby"}
        player = Player.new(input)
        expect(player.marker).to eq "x"
      end
    end

    context "#players_name" do
      it "returns the player's name" do
        input = {marker: "x", name: "Ruby"}
        player = Player.new(input)
        expect(player.name).to eq "Ruby"
      end
    end


    # describe "marker" do
    #   subject {described_class.new("x")}
    #   it "returns x" do
    #     expect(subject.marker).to eq("x") 
    #   end
    # end
    

  end
end

