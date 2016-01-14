require_relative "player.rb"
require_relative "board.rb"

class TicTacToe
  def initialize(player1, player2)
    @players = [player1, player2]
    @current_mark = :x
    @board = Board.new
  end

  def run
    # 
  end

  private

  def current_player
    @players.first
  end

  def next_player!
    @players.rotate!

    @current_mark = @current_mark == :x ? :o : :x
  end
end

if __FILE__ == $PROGRAM_NAME
  hp = HumanPlayer.new("Patrick")
  cp = ComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
