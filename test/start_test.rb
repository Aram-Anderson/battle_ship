require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/start'


class StartTest < Minitest::Test

  def test_player_exists_on_start
    start = Start.new

    assert_instance_of Start
  end

end
