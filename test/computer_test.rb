require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/computer'
require './lib/player_board'
require 'simplecov'
SimpleCov.start

class ComputerTest < Minitest::Test

  def test_computer_initializes
    computer = Computer.new

    assert_instance_of Computer, computer
  end

  def test_it_initializes_with_grid_spaces
    expected = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    computer = Computer.new

    assert_equal expected, computer.all_grid_spaces
  end

  def test_it_can_shoot_at_grid_spaces
    computer = Computer.new
    player_board = PlayerBoard.new

    assert player_board.board.layout.values.all? {|x| x == "     "}

    computer.get_target(player_board)

    refute player_board.board.layout.values.all? {|x| x == "     "}
  end

end
