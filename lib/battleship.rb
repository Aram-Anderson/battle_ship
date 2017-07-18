require './lib/start'
require './lib/output'
require 'pry'

class BattleShip

include Output

  def initialize
    game_intro
  end

  def game_intro
    main_menu
    player_selection = gets.chomp

    case player_selection
    when "p" || "play" then start_game
    when "i" || "instructions" then instructions
    when "q" || "quit" then quit_game
    else
      invalid_input
      game_intro
    end
  end

  def start_game
    game = Start.new
  end

  def instructions
    show_instructions
    game_intro
  end

  def quit_game
    quit_message
    exit
  end

end
