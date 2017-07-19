require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/computer'
require './lib/player_board'


class ComputerTest < Minitest::Test

  def test_computer_initializes
    computer = Computer.new

    assert_instance_of Computer, computer
  end

  def test_it_can_shoot_at_grid_spaces
    @computer = Computer.new
    @board = PlayerBoard.new

    assert @board.board.board.values.all? {|x| x == "     "}

    @computer.get_target(@board)

    refute @board.board.board.values.all? {|x| x == "     "}
  end

end
