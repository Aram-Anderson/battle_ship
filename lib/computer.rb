require './lib/output'
require './lib/board'

class Computer

  include Output

  attr_reader :ships
  attr_accessor :player_board

  def initialize
    @player_board = Board.new
    @ships = []
    @all_grid_spaces = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
  end

  def place_two_unit_ship
    place_two_square_ships_message
    input = gets.chomp.split(" ").sort
      if @player_board.board.keys.any? { |key| key == input[0] } &&
         @player_board.board.keys.any? { |key| key == input[1] } &&
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
    if @player_board.board.any? { |key, value| key == input[0] } &&
       @player_board.board.any? { |key, value| key == input[1] } &&
       @player_board.board.any? { |key, value| key == input[2] } &&
       @ships.flatten.none? { |ship| ship == input[0] && input[1] && input[2] } &&
       (input.join[0].next == input.join[2] || input.join[1].next == input.join[3]) &&
       (input.join[0].next.next == input.join[4] || input.join[1].next.next == input.join[5])
      @ships << input
    else
      invalid_input_three_ship_placement
      place_three_unit_ship
    end
  end

  def get_target
    target = @all_grid_spaces.shuffle!.pop
    acquire_target(target)
  end

  def acquire_target(target)
    if @ships.flatten.include?(target)
       @player_board.board[target] = "  \xF0\x9F\x92\xA5  "
      if @ships[0].include?(target)
         @ships[0].delete(target)
         if @ships[0].empty?
           opponent_sank_your_ship_message
         end
      else
         @ships[1].delete(target)
         if @ships[1].empty?
           opponent_sank_your_ship_message
         end
      end
    else
      @player_board.board[target] = "  \xF0\x9F\x92\xA6  "
    end
  end
end
