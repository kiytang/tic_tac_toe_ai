module TicTacToe
EMPTY = "-"

  class Game
    attr_reader :board, :players

    def initialize(board = Board.new)
      @board  = board
      @player = players
      reset_players(board)
    end

    def reset_players(board)
      @players = [HumanPlayer.new("x", board),
                    ComputerPlayer.new("o", board)].shuffle
    end

    def start_game
      begin
        play_game
      end while play_again?
    end

    def play_game
      while true
        players.each do |player|
          player_turn(player)
          
          if board.game_ended?
            return true
          end
        end
      end
    end

    def player_turn(player)
      board.add_move(player.marker, get_move(player))
    end

    def get_move(player)
      index = player.move.index
      reprompt_if_invalid(player, index)
    end

    def reprompt_if_invalid(player, index)
      if board.valid_move?(index)
        index
      else
        new_move = player.reprompt
        reprompt_if_invalid(player, new_move.index)
      end
    end
    
    def play_again?
      Prompter.play_again? do
        @board = Board.new
        reset_players(board)
      end
    end

  end
end
