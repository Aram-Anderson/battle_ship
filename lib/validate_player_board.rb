module ValidatePlayerBoard

  def validate_two(input)
    @board.layout.keys.any? { |key| key == input[0] } &&
    @board.layout.keys.any? { |key| key == input[1] } &&
    (input.join[0].next == input.join[2] || input.join[1].next == input.join[3])
  end

  def validate_three(input)
    @board.layout.any? { |key, value| key == input[0] } &&
    @board.layout.any? { |key, value| key == input[1] } &&
    @board.layout.any? { |key, value| key == input[2] } &&
    @ships.flatten.none? { |ship| ship == input[0] && input[1] && input[2] } &&
    (input.join[0].next == input.join[2] || input.join[1].next == input.join[3]) &&
    (input.join[0].next.next == input.join[4] || input.join[1].next.next == input.join[5])
  end

end
