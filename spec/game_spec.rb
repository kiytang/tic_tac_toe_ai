require "spec_helper"

module TicTacToe
  describe Game do

    let (:kiy) {Player.new({marker: "x", name: "kiy"})}
    let (:cpu) {Player.new({marker: "o", name: "cpu"})}
    
    context "#initialze" do
      it "should randomly select a current player" do
        Array.any_instance.stub(:shuffle) {[kiy, cpu]}
        game = Game.new([kiy, cpu])
        expect(game.current_player).to eq kiy
      end

      it "should randomly select another player" do
        Array.any_instance.stub(:shuffle) {[kiy, cpu]}
        game = Game.new([kiy, cpu])
        expect(game.other_player).to eq cpu  
      end
    end
  end
end


