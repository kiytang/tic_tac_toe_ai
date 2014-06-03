require "spec_helper"

module TicTacToe
  describe "board" do

    subject {Board.new}

    describe "empty?" do
        it "returns true when empty" do
        expect(subject.empty?(0)).to be_true
        end
        
        it "returns false when cell occupied" do
            subject.add_move("x", 0)
            expect(subject.empty?(0)).to be_false
        end
    end

    describe "display_board" do
    	it "should display a board" do
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
    	it "should add a cross to board" do
    		subject.add_move("x", 4)
    		expect(subject.board).to eq (["-","-","-",
										  "-","x","-",
										  "-","-","-"])
    	end

    	it "should add a nought to board" do
    		subject.add_move("o", 8)
    		expect(subject.board).to eq (["-","-","-",
    									  "-","-","-",
    									  "-","-","o"])
    	end 	
    end

    describe "winner" do #either 'x', 'o' draw or nil
    	context "#when 'x' is the winner" do 
    		it "should return 'x' for 1st row win" do
    			subject.add_move("x", 0)
    			subject.add_move("x", 1)
    			subject.add_move("x", 2)
                expect(subject.winner).to eq "x"
    		end

    		it "should return 'x' for 2nd row win" do
    			subject.add_move("x", 3)
    			subject.add_move("x", 4)
    			subject.add_move("x", 5)
    			expect(subject.winner).to eq "x"
    		end

    		it "should return 'x' for 3rd row win" do
    			subject.add_move("x", 6)
    			subject.add_move("x", 7)
    			subject.add_move("x", 8)
    			expect(subject.winner).to eq "x"
    		end

    		it "should return 'x' for 1st column win" do
    			subject.add_move("x", 0)
    			subject.add_move("x", 3)
    			subject.add_move("x", 6)
    			expect(subject.winner).to eq "x"
    		end

    		it "should return 'x' for 2nd column win" do
    			subject.add_move("x", 1)
    			subject.add_move("x", 4)
    			subject.add_move("x", 7)
    			expect(subject.winner).to eq "x"
    		end 

    		it "should return 'x' for 3rd column win" do
    			subject.add_move("x", 2)
    			subject.add_move("x", 5)
    			subject.add_move("x", 8)
    			expect(subject.winner).to eq "x"    			
    		end

    		it "should return 'x' for forward diagonal win" do
    			subject.add_move("x", 0)
    			subject.add_move("x", 4)
    			subject.add_move("x", 8)
    			expect(subject.winner).to eq "x"
    		end

    		it "should return 'x' for backward diagonal win" do
    			subject.add_move("x", 2)
    			subject.add_move("x", 4)
    			subject.add_move("x", 6)
    			expect(subject.winner).to eq "x"
    		end
    	end

    	context "#when 'o' is the winner" do 
    		it "should return 'o' for 1st row win" do
    			subject.add_move("o", 0)
    			subject.add_move("o", 1)
    			subject.add_move("o", 2)
    			expect(subject.winner).to eq "o"
    		end

    		it "should return 'o' for 2nd row win" do
    			subject.add_move("o", 3)
    			subject.add_move("o", 4)
    			subject.add_move("o", 5)
    			expect(subject.winner).to eq "o"
    		end
    				
    		it "should return 'o' for 3rd row win" do
    			subject.add_move("o", 6)
    			subject.add_move("o", 7)
    			subject.add_move("o", 8)
    			expect(subject.winner).to eq "o"
    		end

    		it "should return 'o' for 1st column win" do
    			subject.add_move("o", 0)
    			subject.add_move("o", 3)
    			subject.add_move("o", 6)
    			expect(subject.winner).to eq "o"
    		end

    		it "should return 'o' for 2nd column win" do
    			subject.add_move("o", 1)
    			subject.add_move("o", 4)
    			subject.add_move("o", 7)
    			expect(subject.winner).to eq "o"
    		end 

    		it "should return 'x' for 3rd column win" do
    			subject.add_move("o", 2)
    			subject.add_move("o", 5)
    			subject.add_move("o", 8)
    			expect(subject.winner).to eq "o"    			
    		end

    		it "should return 'o' for forward diagonal win" do
    			subject.add_move("o", 0)
    			subject.add_move("o", 4)
    			subject.add_move("o", 8)	  
    			expect(subject.winner).to eq "o"			
    		end

    		it "should return 'o' for backward diagonal win" do
    			subject.add_move("o", 2)
    			subject.add_move("o", 4)
    			subject.add_move("o", 6)
    			expect(subject.winner).to eq "o"
    		end
    	end
    
    # filled board and expect test to pass
    describe "draw?" do
    	it "should return true if board is full " do
    		subject.add_move("x", 0)
    		subject.add_move("o", 1)
    		subject.add_move("x", 2)
    		subject.add_move("x", 3)
    		subject.add_move("o", 4)
    		subject.add_move("x", 5)
    		subject.add_move("o", 6)
    		subject.add_move("x", 7)
    		subject.add_move("o", 8)		
    		expect(subject.draw?).to eq true				
    	end	

    	it "should return false if board not full " do
    		subject.add_move("x", 0)
    		subject.add_move("o", 1)
    		subject.add_move("x", 2)
    		subject.add_move("x", 3)
    		subject.add_move("o", 4)
    		subject.add_move("x", 5)
    		subject.add_move("o", 6)
    		subject.add_move("x", 7) 				
    		expect(subject.draw?).to eq false				
    	end					
    end		
    

    describe "game_ended?" do
    	context "#when game_ended?"
        it "should return true if game has been won" do
    	   subject.add_move("x", 0)
           subject.add_move("x", 1)
           subject.add_move("x", 2)
           expect(subject.game_ended?).to eq true
        end
        # based on if all cells filled?
    	# or there is a winner
    	

    	context "game started" do
    		it "should not have ended" do
    		    expect(subject.game_ended?).to eq false		
    		end
    	end

    	context "when 'x' has won" do
    		it "should return true" do
    			subject.add_move("x", 2)
    			subject.add_move("x", 4)
    			subject.add_move("x", 6)
    			expect(subject.game_ended?).to eq true	
    		end
    	end
    end
  end
end
end

