require './lib/board'
require './lib/output'
require './lib/validate_player_board'

class PlayerBoard

  include Output
  include ValidatePlayerBoard

  attr_accessor :board, :ships

  def initialize
    @board = Board.new
    @ships = []
  end

  def get_two_input
    @board.print_board
    place_two_square_ships_message
    input = gets.chomp.upcase.split(" ").sort
    place_two_unit_ship(input)
  end

  def place_two_unit_ship(input)
      if validate_two(input)
        @ships << input
      else
        invalid_input
        get_two_input
      end
  end

  def get_three_input
    @board.print_board
    place_three_square_ships_message
    input = gets.chomp.upcase.split(" ").sort
    place_three_unit_ship(input)
  end

  def place_three_unit_ship(input)
    if validate_three(input)
      @ships << input
    else
      invalid_input_three_ship_placement
      get_three_input
    end
  end

  def print_board
    @board.print_board
  end 

end
