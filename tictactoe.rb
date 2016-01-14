require_relative "player.rb"
require_relative "board.rb"

class TicTacToe
  def initialize(player1, player2)
    @players = [player1, player2]
    @current_mark = :x
    @board = Board.new
  end

  def run
    until @board.over?
      take_turn
      next_player!
    end

    if @board.won?
      puts "#{@board.winner} has won the game!"
    else
      puts "Tie game!"
    end
  end

  private

  def take_turn
    move = current_player.get_move(@board, @current_mark)

    until valid_move?(move)
      # Let the player know that their move was invalid
      current_player.alert_invalid_move
      # Redo move
      move = current_player.get_move(@board, @current_mark)
    end

    # Make move
    @board.place_mark(move, @current_mark)
  end

  def valid_move?(move)
    # Make sure the move is in range
    return false unless move.all? { |el| (0..2).include?(el) }

    # Make sure there is not a mark already there
    @board[move] == :b
  end

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
