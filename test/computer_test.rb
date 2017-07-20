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

  def test_it_can_shoot_at_grid_spaces
    computer = Computer.new
    player_board = PlayerBoard.new

    assert player_board.board.layout.values.all? {|x| x == "     "}

    computer.get_target(player_board)

    refute player_board.board.layout.values.all? {|x| x == "     "}
  end

end
