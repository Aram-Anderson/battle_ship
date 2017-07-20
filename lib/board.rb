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
    print "=========================" + "\n"
    print ["  .  ", "  1  ", "  2  ", "  3  ", "  4  "].join + "\n"
    print [" A>  ", @board["A1"].center(5), @board["A2"].center(5), @board["A3"].center(5), @board["A4"].center(5)].join + "\n"
    print [" B>  ", @board["B1"].center(5), @board["B2"].center(5), @board["B3"].center(5), @board["B4"].center(5)].join + "\n"
    print [" C>  ", @board["C1"].center(5), @board["C2"].center(5), @board["C3"].center(5), @board["C4"].center(5)].join + "\n"
    print [" D>  ", @board["D1"].center(5), @board["D2"].center(5), @board["D3"].center(5), @board["D4"].center(5)].join + "\n"
    print "=========================" + "\n"
  end

end
