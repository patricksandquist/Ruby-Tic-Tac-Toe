require_relative "player.rb"

class TicTacToe
  def initialize(*players)
    @players = players
    initialize_board
  end

  def run
  end

  private

  def initialize_board
    # Make board and start everything as blank
    @board = Array.new(3) { Array.new(3) }

    @board.each do |row|
      row.each do |el|
        el = :b
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  hp = HumanPlayer.new("Patrick")
  cp = ComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
