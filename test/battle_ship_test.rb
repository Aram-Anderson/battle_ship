require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'


class BattleshipTest < Minitest::Test

  def test_class_exists
    battleship = Battleship.new

    assert battleship
  end

end
