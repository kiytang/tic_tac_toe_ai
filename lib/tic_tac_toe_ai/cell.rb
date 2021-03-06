module TicTacToe
	class Cell
		attr_reader :index

		CORNERS = [0,2,6,8]
		SIDES 	= [1,3,5,7]
		
		def initialize(index)
			@index = index
		end

		def corner?
			CORNERS.include?(@index)
		end

		def center?
			@index == 4 
		end
	end
end
