require './lib/output'
require './lib/board'
require './lib/computer_board'
require 'pry'

class Player

  include Output

  attr_reader :shots

  def initialize
    @computer_board = nil
    @shots = 0
  end

  def get_target(computer_board)
    fire_coordinates_message
    target = gets.chomp.upcase
    acquire_target(target, computer_board)
  end

  def acquire_target(target, computer_board)
    @computer_board = computer_board
    if @computer_board.board.layout.keys.any? { |key| key == target[0..1] }
      fire(target)
    else
      invalid_target
      get_target(computer_board = @computer_board)
    end
  end


  def fire(target)
    if validate_target(target)
      if board_includes(target)
        hit_target(target)
        sink_ship(target)
      else
        @shots += 1
        you_miss_message
        @computer_board.board.layout[target] = "  \xF0\x9F\x92\xA6  "
      end
    else
      already_fired_at_that_coordinate
      get_target(computer_board = @computer_board)
    end
  end

  def validate_target(target)
    @computer_board.board.layout[target].strip.empty?
  end

  def board_includes(target)
    @computer_board.ships.flatten.include?(target)
  end

  def hit_target(target)
    @shots += 1
    you_hit_message
    @computer_board.board.layout[target] = "  \xF0\x9F\x92\xA5  "
  end

  def sink_ship(target)
    if @computer_board.ships[0].include?(target)
       @computer_board.ships[0].delete(target)
       if @computer_board.ships[0].empty?
         sank_opponent_two_ship_message
       end
    else
      @computer_board.ships[1].delete(target)
      if @computer_board.ships[1].empty?
        sank_opponent_three_ship_message
      end
    end
  end

end
