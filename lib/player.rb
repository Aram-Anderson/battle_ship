require './lib/output'

class Player

  include Output

  def initialize
    @player_board = Board.new
    @ships = []
  end

  def place_two_unit_ship
    place_two_square_ships_message
    input = gets.chomp.sort
      if @player_board.keys.any? { |key| key == input[0..1] || input[3..4] } && input[0].next == input[3] || input[1].next == input[4]
        @ships << [input]
      else
        invalid_input
        place_ships
      end
  end


  def acquire_target
    fire_coordinates_message
    input = gets.chomp
    if @player_board.keys.any? { |key| key == input[0..1] }
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
          @ships.delete(ship)
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
