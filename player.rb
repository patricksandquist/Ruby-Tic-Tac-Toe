class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def alert_invalid_move
    puts "Invalid move!"
  end
end
