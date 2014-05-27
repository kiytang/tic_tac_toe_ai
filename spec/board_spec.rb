require "spec_helper"

module TicTacToe
  describe "board" do

    subject {Board.new}

    describe "display_board" do
    	it "displays a board" do
    	  expect(subject.display_board).to eq(
    	   "+++++++++++++\n" +
       	 "| - | - | - |\n" +
       	 "_____________\n" +
         "| - | - | - |\n" +
         "_____________\n" +
         "| - | - | - |\n" +
         "+++++++++++++")
    	end
    end  
  end
end

