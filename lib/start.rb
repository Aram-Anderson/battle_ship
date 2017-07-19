require './lib/computer'
require './lib/player'
require './lib/board'
require './lib/computer_board'
require './lib/player_board'



class Start

  include Output

  def initialize
    @computer = Computer.new
    @computer_board = ComputerBoard.new
    @player = Player.new
    @player_board = PlayerBoard.new
    game_process
  end

  def game_process
    @player_board.place_two_unit_ship
    @player_board.place_three_unit_ship
    @computer_board.place_two_unit_ship
    @computer_board.place_three_unit_ship
    until @computer_board.ships.flatten.empty? ||
      @player_board.ships.flatten.empty?
      @player.get_target(@computer_board)
      player_board_message
      @player_board.board.print_board
      @computer.get_target(@player_board)
      computer_board_message
      @computer_board.board.print_board
    end
    if @computer_board.ships.flatten.empty?
      win_message
    else
      lose_message
    end
    new_game = BattleShip.new
  end


end
