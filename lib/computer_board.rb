require './lib/board'

class ComputerBoard

  attr_accessor :board, :ships

  def initialize
    @board = Board.new
    @ships = []
    @spaces = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
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
    until (@spaces & ships.flatten).empty?
    direction = @orientation.sample
      if direction == "H"
        first_space = @three_grid_horitontal_ship_spaces.sample
        second_space = first_space[0] + first_space[1].next
        third_space = first_space[0] + first_space[1].next.next
        @spaces = [first_space, second_space, third_space]
      elsif direction == "V"
        first_space = @three_grid_vertical_ship_spaces.sample
        second_space = first_space[0].next + first_space[1]
        third_space = first_space[0].next.next + first_space[1]
        @spaces = [first_space, second_space, third_space]
      end
    end
    add_spaces(spaces = @spaces)
  end

  def add_spaces(spaces)
    @ships << spaces
  end

end
