require "spec_helper"

module TicTacToe
  describe Game do
    
    context "#initialze" do
      it "should randomly select a player" do
        game = Game.new
        Array.any_instance.should_receive(:shuffle)
        game.reset_players(nil)
      end
    end
  end
end


