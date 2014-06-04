require "spec_helper"

module TicTacToe
  describe Cell do
    context "#corner?" do
      it "returns true if corner cell" do
        expect(Cell.new(0).corner?).to be_true
      end
    end

    context "#center?" do
      it "returns true if center cell" do
        expect(Cell.new(4).center?).to be_true
      end
    end
  end
end