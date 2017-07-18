require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'


class BattleshipTest < Minitest::Test

  def test_class_exists
    battleship = BattleShip.new

    assert_instance_of BattleShip, battleship
  end

end
