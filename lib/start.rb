require './lib/computer'
require './lib/player'
require './lib/board'
require './lib/battleship'



class Start

  include Output

  def initialize
    game_process
    @computer = computer
    @player = player
  end

  def game_process
    @player.place_ships
    @computer.place_ships
    until @computer.ships.empty? || @player.ships.empty?
      @player.display_player_board
      @player.acquire_target
      @player.display_player_board
      next_turn_message
      @computer.get_firing_coordinates
      @computer.display_computer_board
    end
    if @computer.ships.empty?
      win_message
    else
      lose_message
    end
    play_again_message
    input = gets.chomp
    if input.downcase == "y" || "yes"
      new_game = BattleShip.new
    else
      quit_message
      exit
    end
  end


end
