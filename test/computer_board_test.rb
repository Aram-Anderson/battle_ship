require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer_board'
require 'simplecov'
SimpleCov.start

class ComputerBoardTest < Minitest::Test

  def test_it_exists
    computer = ComputerBoard.new

    assert_instance_of ComputerBoard, computer
  end

  def test_it_initializes_with_a_board
    computer = ComputerBoard.new

    assert_instance_of Board, computer.board
  end

  def test_it_initializes_with_ships
    computer = ComputerBoard.new

    assert_equal [], computer.ships
  end

  def test_it_initializes_with_spaces
    expected = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    computer = ComputerBoard.new

    assert_equal expected, computer.spaces
  end

  def test_it_initializes_with_two_grid_vertical
    expected = ["A1", "A2", "A3", "A4" "B1", "B2", "B3", "B4" "C1", "C2", "C3", "C4"]
    computer = ComputerBoard.new

    assert_equal expected, computer.two_grid_vertical_ship_spaces

  end

  def test_it_initializes_with_two_grid_horizontal
    expected = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3", "D1", "D2", "D3"]
    computer = ComputerBoard.new

    assert_equal expected, computer.two_grid_horizontal_ship_spaces

  end

  def test_it_initializes_with_three_grid_vertical
    expected = ["A1", "A2", "A3", "A4" "B1", "B2", "B3", "B4"]
    computer = ComputerBoard.new

    assert_equal expected, computer.three_grid_vertical_ship_spaces

  end

  def test_it_initializes_with_three_grid_horizontal
    expected = ["A1", "A2", "B1", "B2", "C1", "C2", "D1", "D2"]
    computer = ComputerBoard.new

    assert_equal expected, computer.three_grid_horitontal_ship_spaces

  end

  def test_it_initializes_with_orientation
    computer = ComputerBoard.new

    assert_equal ["H", "V"], computer.orientation

  end


  def test_it_can_place_two_unit_ship
    computer = ComputerBoard.new

    assert_equal 0, computer.ships.count

    computer.place_two_unit_ship

    assert_equal 1, computer.ships.count
  end

  def test_it_can_place_three_unit_ship
    computer = ComputerBoard.new

    assert_equal 0, computer.ships.count

    computer.place_three_unit_ship

    assert_equal 1, computer.ships.count
  end

  def test_it_can_place_both_ships
    computer = ComputerBoard.new

    assert_equal 0, computer.ships.count

    computer.place_two_unit_ship
    computer.place_three_unit_ship

    assert_equal 2, computer.ships.count
  end
end
