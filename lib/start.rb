require './lib/computer'
require './lib/player'
require './lib/board'
require './lib/computer_board'
require './lib/player_board'
require 'colorize'

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
    @start_time = Time.now
    @player_board.get_two_input
    @player_board.get_three_input
    @computer_board.place_two_unit_ship
    @computer_board.place_three_unit_ship
    until @computer_board.ships.flatten.empty? ||
      @player_board.ships.flatten.empty?
      @player.get_target(@computer_board)
      computer_board_message
      @computer_board.board.print_board
      continue_message
      validate_input
        @computer.get_target(@player_board)
        player_board_message
        @player_board.board.print_board
        computer_board_message
        @computer_board.board.print_board
    end
    @end_time = Time.now
    if @player_board.ships.flatten.empty?
      lose_message
    else
      win_message
    end
    new_game = BattleShip.new
  end

  def validate_input
    input = gets
    if input != "\n"
      continue_message
      validate_input
    end
  end

end
