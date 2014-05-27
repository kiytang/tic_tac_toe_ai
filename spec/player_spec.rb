require "spec_helper"
module TicTacToe
  describe Player do
    describe "marker" do
      subject {described_class.new("x")}
      it "returns x" do
        expect(subject.marker).to eq("x") 
      end
    end
  end
end

