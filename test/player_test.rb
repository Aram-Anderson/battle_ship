require 'simplecov'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer_board'

SimpleCov.start

class ComputerBoardTest < Minitest::Test

  def test_it_exists
    player = Player.new

    assert_instance_of Player, player
  end

  def test_it_can_place_two_unit_ship
    player = Player.new

    assert_equal 0, player.ships.count

    player.place_two_unit_ship

    assert_equal 1, player.ships.count
  end

  def test_it_can_place_three_unit_ship
    player = Player.new

    assert_equal 0, player.ships.count

    player.place_three_unit_ship

    assert_equal 1, player.ships.count
  end

  def test_it_can_place_both_ships
    player = Player.new

    assert_equal 0, player.ships.count

    player.place_two_unit_ship
    player.place_three_unit_ship

    assert_equal 2, player.ships.count
  end
end
