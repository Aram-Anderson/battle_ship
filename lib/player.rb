require './lib/output'

class Player

  include Output

  def initialize
    @player_board = Board.new
    @ships = []
  end

  def acquire_target
    fire_coordinates_message
    input = gets.chomp
    if (input[0] == "A" || "B" || "C" || "D") && (input[1] == "1" || "2" || "3" || "4")
      fire(input)
    else
      invalid_input
      acquire_target
    end
  end

  def fire(input)
    if @player_board[input].strip.empty?
      @ships.each do |array|
        array.each do |ship|
        if ship == input
          ship.delete
          @player_board[ship] = "  \xF0\x9F\x92\xA5  "
        else
          @player_board[ship] = "  \xF0\x9F\x92\xA6  "
        end
      end
    end
    else
      already_fired_at_that_coordinate
      acquire_target
    end
  end



end
