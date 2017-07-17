module Output

  def intro_message
    puts "Welcome To Battleship!"
  end

  def main_menu
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    puts "> "
  end

  def show_instructions
     puts "Battleship is a guessing game in which there is a 4x4 grid with columns labeled from A to D, and rows labeled from 1 to 4. You will be playing against a computer oponent. Both you and your oponent will each have two ships to place on the board. One ship occupies two consecutive spaces of the grid, and the other occupies three. Ships must be placed either vertically or horizontally. They cannot wrap around the board. Once gameplay starts, you and your oponent will take turns shooting at the other player's ships. This is done by guessing grid spaces (ie A1). Once a grid space has been fired at, it will display an indication of either a \xF0\x9F\x92\xA5 (which indicates a hit) or \xF0\x9F\x92\xA6 (which indicates a miss). The game is won when all of the oponent's ships have been sunk, or lost if the oponent sinks all of yours."
  end

  def player_board_message
    puts "Your board"
  end

  def computer_board_message
    puts "Your opponent's board"
  end

  def quit_message
    puts "Thank you for playing!"
  end

  def invalid_input
    puts "You have entered an invalid selection. Please reenter your selection"
  end

  def place_two_square_ships_message
    puts "Please enter two grid coodinates which are next to each other on the board. The Grid coordinates must be touching one another (ie A1 A2)."
  end

  def def place_three_square_ships_message
    puts "Please enter three grid coodinates which are next to each other on the board. The Grid coordinates must be touching one another (ie A1 A2 A3)."
  end

  def fire_coordinates_message
    puts "What grid coordinate would you like to fire at? Enter a grid position beginning with a letter from A-D followed by a number from 1-4 (ie A2): "
  end

  def hit_message
    puts "That shot was a hit!"
  end

  def miss_message
    puts "That shot was a miss!"
  end

  def already_fired_at_that_coordinate
    puts "You already fired at that grid space! Select another one: "
  end

  def change_turns_opponent_message
    puts "It's your opponent's turn"
  end

  def change_turns_player_message
    puts "It's your turn again"
  end

  def sank_opponent_ship_message
    puts "You sank your opponent's ship with that last shot!"
  end

  def opponent_sank_your_ship_message
    puts "Your opponent sank your ship with that last shot!"
  end

  def win_message
    puts "You won! You sank all your opponent's ships!"
  end

  def lose_message
    puts "Your opponent sank all your ships! Sorry, but you lost this time."
  end

  def play_again_message
    puts "Would you like to play again? Type (y)es or (n)o: "
  end
end
