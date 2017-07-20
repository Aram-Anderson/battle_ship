require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'


class BoardTest < Minitest::Test

  def test_board_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_it_has_correct_keys
    board = Board.new
    expected = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]

    assert_equal expected, board.layout.keys
  end

  def test_it_has_correct_values
    board = Board.new
    expected = ["     ", "     ", "     ", "     ", "     ", "     ", "     ", "     ", "     ", "     ", "     ", "     ", "     ", "     ", "     ", "     "]

    assert_equal expected, board.layout.values
  end

end
