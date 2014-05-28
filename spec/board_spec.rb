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

    describe "add_move" do
    	it "adds a cross to board" do
    		subject.add_move("x", 4)
    		expect(subject.board).to eq (["-","-","-",
    																	"-","x","-",
    																	"-","-","-"])
    	end

    	it "adds a nought to board" do
    		subject.add_move("o", 8)
    		expect(subject.board).to eq (["-","-","-",
    																	"-","-","-",
    																	"-","-","o"])
    	end 	
    end

    describe "winner" do #either 'x', 'o' draw or nil
    	context "#when 'x' is the winner" do 
    		it "returns 'x' for 1st row win" do
    			subject.add_move("x", 0)
    			subject.add_move("x", 1)
    			subject.add_move("x", 2)

    			expect(subject.winner).to eq "x"
    		end

    		it "returns 'x' for 2nd row win" do
    			subject.add_move("x", 3)
    			subject.add_move("x", 4)
    			subject.add_move("x", 5)

    			expect(subject.winner).to eq "x"
    		end

    		it "returns 'x' for 3rd row win" do
    			subject.add_move("x", 6)
    			subject.add_move("x", 7)
    			subject.add_move("x", 8)

    			expect(subject.winner).to eq "x"
    		end

    		it "returns 'x' for 1st column win" do
    			subject.add_move("x", 0)
    			subject.add_move("x", 3)
    			subject.add_move("x", 6)

    			expect(subject.winner).to eq "x"
    		end

    		it "returns 'x' for forward diagonal win" do
    			subject.add_move("x", 0)
    			subject.add_move("x", 4)
    			subject.add_move("x", 8)

    			expect(subject.winner).to eq "x"
    		end

    		it "returns 'x' for backward diagonal win" do
    			subject.add_move("x", 2)
    			subject.add_move("x", 4)
    			subject.add_move("x", 6)

    			expect(subject.winner).to eq "x"
    		end
    	end

    	context "#when 'o' is the winner" do 
    		it "returns 'o' for row wins" do
    			subject.add_move("o", 6)
    			subject.add_move("o", 7)
    			subject.add_move("o", 8)

    			expect(subject.winner).to eq "o"
    		end

    		it "returns 'o' for column wins" do
    			subject.add_move("o", 2)
    			subject.add_move("o", 5)
    			subject.add_move("o", 8)

    			expect(subject.winner).to eq "o"
    		end

    		it "returns 'o' for diagonal wins" do
    			subject.add_move("o", 0)
    			subject.add_move("o", 4)
    			subject.add_move("o", 8)	  

    			expect(subject.winner).to eq "o"			
    		end
    	end
    end

    describe "game_ended?" do
    	xit "returns true false"
    	# based on if all cells filled?
    	# or there is a winner
    end


  end
end

