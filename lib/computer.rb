require './lib/player'

class Computer

  attr_accessor :computer_board

  def initialize
    @computer_board = Board.new
    @ships = []
    @two_grid_ship_spaces = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
    @three_grid_ship_spaces = ["A1", "A2", "B1", "B2"]
    @orrientation = ["H", "V"]
    @all_grid_spaces = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
  end



  def place_two_unit_ship
    first_space = @two_grid_ship_spaces.sample
    direction = @orrientation.sample
    if direction == "H"
      second_space = first_space[0] + first_space[1].next
    elsif direction == "V"
      second_space = first_space[0].next + first_space[1]
    end
    @ships << [first_space, second_space]
  end

  def place_three_unit_ship
    first_space = @three_grid_ship_spaces.sample
    direction = @orrientation.sample
    if direction == "H"
      second_space = first_space[0] + first_space[1].next
      third_space = first_space[0] + first_space[1].next.next
    elsif direction == "V"
      second_space = first_space[0].next + first_space[1]
      third_space = first_space[0].next.next + first_space[1]
    end
    @ships << [first_space, second_space, third_space]
  end

  def acquire_target
    target = all_grid_spaces.sample


end
