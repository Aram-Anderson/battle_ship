require 'simplecov'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer_board'

SimpleCov.start

class ComputerBoardTest < Minitest::Test

  def test_it_exists
    computer = ComputerBoard.new

    assert_instance_of ComputerBoard, computer
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
