require_relative "player.rb"

class ComputerPlayer < Player
  def initialize
    super("Robot9000")
  end

  def get_move(board, mark)
    blanks = board.blanks

    puts "No moves!" if blanks.empty? # shouldn't happen...

    blanks.sample
  end
end
