require_relative "player.rb"

class HumanPlayer < Player
  def get_move
    puts "Where would you like to move next?"
    gets.chomp.split(",")
  end
end
