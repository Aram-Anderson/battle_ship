require './lib/computer'
require './lib/player'
require './lib/board'



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
      @player.acquire_target
      if @player.ships[0].empty? || @player.ships[1].empty?
        sank_opponent_ship_message
      end
      computer_board_message
      @player.computer_board.print_board
      @computer.acquire_target
      if @computer.ships[0].empty? || @computer.ships[1].empty?
        opponent_sank_your_ship_message
      end
      player_board_message
      @computer.player_board.print_board
    end
    if @player.ships.flatten.empty?
      win_message
    else
      lose_message
    end
    new_game = BattleShip.new
  end


end
