require_relative "tic_tac_toe_ai/version"
require_relative "tic_tac_toe_ai/prompter"
require_relative "tic_tac_toe_ai/game"
require_relative "tic_tac_toe_ai/cell"
require_relative "tic_tac_toe_ai/player"
require_relative "tic_tac_toe_ai/computer_player"
require_relative "tic_tac_toe_ai/human_player"
require_relative "tic_tac_toe_ai/command_line_game"
require_relative "tic_tac_toe_ai/board"

module TicTacToe
	module CLI
		def self.run
		  game = CommandLineGame.new
		  game.start_game
		end
	end
end