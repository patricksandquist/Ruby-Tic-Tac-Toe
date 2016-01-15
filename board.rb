class Board
  def initialize
    # Make board and start everything as blank
    @grid = Array.new(3) { Array.new(3) }

    @grid.map! do |row|
      row.map! do |el|
        el = :b
      end
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def to_s
    # Return a nicely formatted board
    @grid.map do |row|
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

      # Get rid of the last "|"
      output[0...-1]
    end
  end

  def place_mark(pos, mark)
    self[pos] = mark
  end

  def over?
    won? || full?
  end

  def full?
    @grid.flatten.none? { |el| el == :b }
  end

  def won?
    # Are any of the 8 possible trios matching and not blank?
    trios.any? do |trio|
      trio[0] == trio[1] && trio[1] == trio[2] && trio[0] != :b
    end
  end

  def winner
    # Find winning trio
    winning_trio = trios.select do |trio|
      trio[0] == trio[1] && trio[1] == trio[2] && trio[0] != :b
    end

    # Return the winning mark, capitolized
    winning_trio[0][0].to_s.upcase
  end

  def trios
    # Return an array of all 8 trios
    rows + columns + diagonals
  end

  def rows
    @grid
  end

  def columns
    @grid.transpose
  end

  def blanks
    blanks = []

    @grid.each_with_index do |row, i|
      row.each_with_index do |el, j|
        blanks << [i, j] if el == :b
      end
    end

    blanks
  end

  def diagonals
    [[[0, 0], [1, 1], [2, 2]], [[0, 2], [1, 1], [2, 0]]].map do |diagonal|
      diagonal.map { |pos| self[pos] }
    end
  end
end
