require './lib/computer'
require './lib/player'
require './lib/board'
require './lib/battleship'



class Start

  include Output

  def initialize
    @computer = computer
    @player = player
    game_process
  end

  def game_process
    @player.place_two_unit_ship
    @player.place_three_unit_ship
    @computer.place_two_unit_ship
    @computer.place_three_unit_ship
    until @computer.ships.empty? || @player.ships.empty?
      @player.display_player_board
      @player.acquire_target
      @player.display_player_board
      next_turn_message
      @computer.acquire_target
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
