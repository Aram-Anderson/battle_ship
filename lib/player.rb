require './lib/computer'
require './lib/output'
require './lib/board'
require 'pry'

class Player

  include Output

  attr_reader :ships
  attr_accessor :computer_board


  def initialize
    @computer_board = Board.new
    @ships = []
    @two_grid_vertical_ship_spaces = ["A1", "A2", "A3", "A4" "B1", "B2", "B3", "B4" "C1", "C2", "C3", "C4"]
    @two_grid_horizontal_ship_spaces = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3", "D1", "D2", "D3"]
    @three_grid_vertical_ship_spaces = ["A1", "A2", "A3", "A4" "B1", "B2", "B3", "B4"]
    @three_grid_horitontal_ship_spaces = ["A1", "A2", "B1", "B2", "C1", "C2", "D1", "D2"]
    @orientation = ["H", "V"]
  end



  def place_two_unit_ship
    direction = @orientation.sample
    if direction == "H"
      first_space = @two_grid_horizontal_ship_spaces.sample
      second_space = first_space[0] + first_space[1].next
    elsif direction == "V"
      first_space = @two_grid_vertical_ship_spaces.sample
      second_space = first_space[0].next + first_space[1]
    end
    @ships << [first_space, second_space]
  end

  def place_three_unit_ship
    direction = @orientation.sample
    if direction == "H"
    first_space = @three_grid_horitontal_ship_spaces.sample
      if @ships.flatten.none? {|ship| ship == first_space}
        second_space = first_space[0] + first_space[1].next
      else
        place_three_unit_ship
      end
      if @ships.flatten.none? {|ship| ship == second_space}
        third_space = first_space[0] + first_space[1].next.next
      else
        place_three_unit_ship
      end
      if @ships.flatten.none? {|ship| ship == third_space}
        spaces = [first_space, second_space, third_space]
      else
        place_three_unit_ship
      end
    elsif direction == "V"
    first_space = @three_grid_vertical_ship_spaces.sample
      if @ships.flatten.none? {|ship| ship == first_space}
        second_space = first_space[0].next + first_space[1]
      else
        place_three_unit_ship
      end
      if @ships.flatten.none? {|ship| ship == second_space}
        third_space = first_space[0].next.next + first_space[1]
      else
        place_three_unit_ship
      end
      if @ships.flatten.none? {|ship| ship == third_space}
        spaces = [first_space, second_space, third_space]
      else
        place_three_unit_ship
      end
    end
    binding.pry
    @ships << spaces
  end

  def acquire_target
    fire_coordinates_message
    target = gets.chomp
    if @computer_board.board.keys.any? { |key| key == target[0..1] }
      fire(target)
    else
      invalid_target
      acquire_target
    end
  end


  def fire(target)
    if @computer_board.board[target].strip.empty?
      @ships.flatten.each do |ship|
        if target == ship
        @computer_board.board[target] = "  \xF0\x9F\x92\xA5  "
        @ships[0].each do |ship|
          if ship == target
          @ships[0].delete(target)
          end
        end
        @ships[1].each do |ship|
          if ship == target
          @ships[1].delete(target)
          end
        end
      else
        @computer_board.board[target] = "  \xF0\x9F\x92\xA6  "
      end
    end
    else
      already_fired_at_that_coordinate
      acquire_target
    end
  end



end
