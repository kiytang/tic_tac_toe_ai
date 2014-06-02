require_relative "tic_tac_toe_ai/version"
require_relative "tic_tac_toe_ai/game"
require_relative "tic_tac_toe_ai/player"
require_relative "tic_tac_toe_ai/computer_player"
require_relative "tic_tac_toe_ai/human_player"
require_relative "tic_tac_toe_ai/board"

module TicTacToe
	module CLI
		def self.run
		  game = Game.new
		  game.start_game
		end
	end
end