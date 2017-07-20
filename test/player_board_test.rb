require 'player_board'
require 'simplecov'
SimpleCov.start

class PlayerBoardTest < Minitest::Test

  def test_it_exists
    player_board = PlayerBoard.new

    assert_instance_of PlayerBoard, player_board
  end

  def test_it_can_place_two_unit_ship
    player_board = PlayerBoard.new

    assert_equal 0, player_board.ships.count

    player_board.place_two_unit_ship(["A1", "A2"])

    assert_equal 1, player_board.ships.count
  end

  def test_it_can_place_three_unit_ship
    player_board = PlayerBoard.new

    assert_equal 0, player_board.ships.count

    player_board.place_three_unit_ship(["B1", "B2", "B3"])

    assert_equal 1, player_board.ships.count
  end

  def test_it_can_place_both_ships
    player_board = PlayerBoard.new

    assert_equal 0, player_board.ships.count

    player_board.place_two_unit_ship(["A1", "A2"])
    player_board.place_three_unit_ship(["B1", "B2", "B3"])

    assert_equal 2, player_board.ships.count
  end

end
