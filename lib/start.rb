require './lib/computer'
require './lib/player'
require './lib/board'
require './lib/battleship'



class Start

  include Output

  def initialize
    @computer = Computer.new
    @player = Player.new
    game_process
  end

  def game_process
    @player.place_two_unit_ship
    @player.place_three_unit_ship
    @computer.place_two_unit_ship
    @computer.place_three_unit_ship
    until @computer.ships.flatten.empty? || @player.ships.flatten.empty?
      change_turns_player_message
      @player.acquire_target
      player_board_message
      @player.computer_board.print_board
      change_turns_opponent_message
      @computer.acquire_target
      computer_board_message
      @computer.player_board.print_board
    end
    if @player.ships.empty?
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
