require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/player'
require './lib/computer_board'
require 'simplecov'
SimpleCov.start

class ComputerTest < Minitest::Test

  def test_it_exists
    player = Player.new

    assert_instance_of Player, player
  end

  def test_it_initializes_with_shots
    player = Player.new

    assert_equal 0, player.shots
  end

  def test_player_can_shoot_at_grid_spaces
    # skip
    player = Player.new
    computer_board = ComputerBoard.new

    assert computer_board.board.layout.values.all? {|x| x == "     "}

    player.acquire_target("A1", computer_board)

    refute computer_board.board.layout.values.all? {|x| x == "     "}
  end
end
