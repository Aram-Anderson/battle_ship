require 'colorize'

class Board
  attr_accessor :layout
  attr_reader :print_board

  def initialize
    @layout =  {
      "A1" => "     ",
      "A2" => "     ",
      "A3" => "     ",
      "A4" => "     ",
      "B1" => "     ",
      "B2" => "     ",
      "B3" => "     ",
      "B4" => "     ",
      "C1" => "     ",
      "C2" => "     ",
      "C3" => "     ",
      "C4" => "     ",
      "D1" => "     ",
      "D2" => "     ",
      "D3" => "     ",
      "D4" => "     "
    }
  end

  def print_board
    print "=========================".blue + "\n"
    print ["  .  ", "  1  ", "  2  ", "  3  ", "  4  "].join + "\n"
    print [" A>  ", @layout["A1"].center(5), @layout["A2"].center(5), @layout["A3"].center(5), @layout["A4"].center(5)].join + "\n"
    print [" B>  ", @layout["B1"].center(5), @layout["B2"].center(5), @layout["B3"].center(5), @layout["B4"].center(5)].join + "\n"
    print [" C>  ", @layout["C1"].center(5), @layout["C2"].center(5), @layout["C3"].center(5), @layout["C4"].center(5)].join + "\n"
    print [" D>  ", @layout["D1"].center(5), @layout["D2"].center(5), @layout["D3"].center(5), @layout["D4"].center(5)].join + "\n"
    print "=========================".blue + "\n"
  end

end
