require_relative "player.rb"

class HumanPlayer < Player
  def get_move(board, mark)
    print_board(board)
    puts "#{name}, where would you like to put a #{mark.to_s.upcase} next?"
    gets.chomp.split(",")
  end

  private

  def print_board(board)
    system("clear")

    # Print out the 2D array of the board
    board.each do |row|
      output = ""

      row.each do |el|
        case el
        when :x
          output += "X"
        when :o
          output += "0"
        when :b
          output += " "
        end
        output += "|"
      end

      puts output[0...-1]
    end
  end
end
