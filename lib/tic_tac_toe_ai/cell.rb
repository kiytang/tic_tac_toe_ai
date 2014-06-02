module TicTacToe
	class Cell
		def initialize(index)
			@index = index
		end

		def corner?
			[0,2,6,8].include?(@index)
		end

		def centre?
			@index == 4 
		end
	end
end
