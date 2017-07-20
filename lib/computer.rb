require './lib/board'
require './lib/output'


class Computer

  attr_reader :all_grid_spaces

  include Output

  def initialize
    @all_grid_spaces = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    @player_board = nil
  end

  def get_target(player_board)
    @player_board = player_board
    target = @all_grid_spaces.shuffle!.pop
    acquire_target(target)
  end

  def acquire_target(target)
    if @player_board.ships.flatten.include?(target)
      opponent_hit_message
       @player_board.board.layout[target] = "  \xF0\x9F\x92\xA5  "
      if @player_board.ships[0].include?(target)
         @player_board.ships[0].delete(target)
         if @player_board.ships[0].empty?
           opponent_sank_your_two_ship_message
         end
      else
         @player_board.ships[1].delete(target)
         if @player_board.ships[1].empty?
           opponent_sank_your_three_ship_message
         end
      end
    else
      opponent_miss_message
      @player_board.board.layout[target] = "  \xF0\x9F\x92\xA9  "
    end
  end
end
