require_relative "player.rb"

class HumanPlayer < Player
  def get_move(board, mark)
    puts board.to_s
    puts "#{name}, where would you like to put a #{mark.to_s.upcase} next?"
    gets.chomp.split(",").map { |num| num.to_i }
  end
end
