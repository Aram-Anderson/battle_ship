require './lib/computer'
require './lib/output'
require 'pry'

class Player

  include Output

  attr_accessor :player_board

  def initialize
    @player_board = Board.new
    @ships = []
  end

  def place_two_unit_ship
    place_two_square_ships_message
    input = gets.chomp.split(" ").sort
    binding.pry
      if @player_board.board.any? { |key, value| key == input[0] } && @player_board.board.any? { |key, value| key == input[1] } &&
      input.join[0].next == input.join[2] || input.join[1].next == input.join[3]
        @ships << input
      else
        invalid_input
        place_two_unit_ship
      end
  end

  def place_three_unit_ship
    place_three_square_ships_message
    input = gets.chomp.split(" ").sort
    if @player_board.board.any? { |key, value| key == input[0] } &&
      @player_board.board.any? { |key, value| key == input[1] } &&
      @player_board.board.any? { |key, value| key == input[2] } &&
      @ships.flatten.none? { |ship| ship == input[0] && input[1] && input[2] } && (input.join[0].next == input.join[2] || input.join[1].next == input.join[3]) &&
      (input.join[0].next.next == input.join[4] || input.join[1].next.next == input.join[5])
      @ships << input
    else
      invalid_input_three_ship_placement
      place_three_unit_ship
    end
  end


  def acquire_target
    fire_coordinates_message
    input = gets.chomp
    if @player_board.board.keys.any? { |key| key == input[0..1] }
      fire(input)
    else
      invalid_input
      acquire_target
    end
  end

  def fire(input)
    if @player_board[input].strip.empty?
      @ships.each do |array|
        array.each do |ship|
        if ship == input
          @ships.delete(ship)
          @player_board[ship] = "  \xF0\x9F\x92\xA5  "
        else
          @player_board[ship] = "  \xF0\x9F\x92\xA6  "
        end
      end
    end
    else
      already_fired_at_that_coordinate
      acquire_target
    end
  end



end
