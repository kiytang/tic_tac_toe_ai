require "tic_tac_toe_ai/version"
require "tic_tac_toe_ai/game"
require "tic_tac_toe_ai/player"
require "tic_tac_toe_ai/board"

module TicTacToe
  game = Game.new
  game.start_game
end