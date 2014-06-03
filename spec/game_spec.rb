require "spec_helper"

module TicTacToe
  describe Game do

    let (:kiy) {Player.new({marker: "x", name: "kiy"})}
    let (:cpu) {Player.new({marker: "o", name: "cpu"})}
    
    context "#initialze" do
      it "should randomly select a current player" do
        game = Game.new
        Array.any_instance.should_receive(:shuffle)
        game.reset_players(nil)
      end

      xit "should randomly select another player" do
        Array.any_instance.stub(:shuffle) {[kiy, cpu]}
        game = Game.new([kiy, cpu])
        expect(game.other_player).to eq cpu  
      end
    end

    context "#switch_players" do
      xit "should set @current_player to @other_player" do
        game = Game.new([kiy, cpu])
        other_player = game.other_player
        game.switch_players
        expect(game.current_player).to eq other_player     
      end

      xit "should set @other_player to @current_player " do
        game = Game.new([kiy, cpu])
        current_player = game.current_player
        game.switch_players
        expect(game.other_player).to eq current_player
      end
    end
  end
end


