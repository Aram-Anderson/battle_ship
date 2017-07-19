require './lib/output'
require './lib/board'
require './lib/computer_board'
require 'pry'

class Player

  include Output

  def initialize
    @computer_board = nil
  end

  def get_target(computer_board)
    @computer_board = computer_board
    fire_coordinates_message
    target = gets.chomp
    acquire_target(target)
  end

  def acquire_target(target)
    if @computer_board.board.board.keys.any? { |key, value| key == target[0..1] }
      fire(target)
    else
      invalid_target
      get_target(computer_board = @computer_board)
    end
  end


  def fire(target)
    if @computer_board.board.board[target].strip.empty?
      if @computer_board.ships.flatten.include?(target)
        @computer_board.board.board[target] = "  \xF0\x9F\x92\xA5  "
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
      else
      @computer_board.board.board[target] = "  \xF0\x9F\x92\xA6  "
      end
    else
      already_fired_at_that_coordinate
      get_target(computer_board = @computer_board)
    end
  end



end
