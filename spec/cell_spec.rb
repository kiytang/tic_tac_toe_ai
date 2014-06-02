require "spec_helper"

module TicTacToe
  describe Cell do


    context "#corner?" do
      it "returns true if corner cell" do
        expect(Cell.new(0).corner?).to be_true
      end
    end

    context "#centre?" do
      it "returns true if centre cell" do
        expect(Cell.new(4).centre?).to be_true
      end
    end
  end

end