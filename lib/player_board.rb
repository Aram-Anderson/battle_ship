require './lib/board'
require './lib/output'

class PlayerBoard

  include Output

  attr_accessor :board, :ships

  def initialize
    @board = Board.new
    @ships = []
  end

  def place_two_unit_ship
    place_two_square_ships_message
    input = gets.chomp.split(" ").sort
      if @board.board.keys.any? { |key| key == input[0] } &&
         @board.board.keys.any? { |key| key == input[1] } &&
          (input.join[0].next == input.join[2] || input.join[1].next == input.join[3])
        @ships << input
      else
        invalid_input
        place_two_unit_ship
      end
  end

  def place_three_unit_ship
    place_three_square_ships_message
    input = gets.chomp.split(" ").sort
    if @board.board.any? { |key, value| key == input[0] } &&
       @board.board.any? { |key, value| key == input[1] } &&
       @board.board.any? { |key, value| key == input[2] } &&
       @ships.flatten.none? { |ship| ship == input[0] && input[1] && input[2] } &&
       (input.join[0].next == input.join[2] || input.join[1].next == input.join[3]) &&
       (input.join[0].next.next == input.join[4] || input.join[1].next.next == input.join[5])
      @ships << input
    else
      invalid_input_three_ship_placement
      place_three_unit_ship
    end
  end

end
