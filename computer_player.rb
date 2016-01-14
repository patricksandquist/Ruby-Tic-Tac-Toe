require_relative "player.rb"

class ComputerPlayer < Player
  def get_move(board, mark)
    blanks = []

    board.each_with_index do |row, i|
      row.each_with_index do |el, j|
        blanks << [i, j] if el == :b
      end
    end

    puts "No moves!" if blanks.empty? # shouldn't happen...

    blanks.sample
  end
end
