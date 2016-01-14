class Board
  def initialize
    # Make board and start everything as blank
    @grid = Array.new(3) { Array.new(3) }

    @grid.each do |row|
      row.each do |el|
        el = :b
      end
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def over?
    won? || full?
  end

  def won?
    # Are any of the 8 possible trios matching and not blank?
    trios.any? do |trio|
      trio[0] == trio[1] && trio[1] == trio[2] && trio[0] != :b
    end
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

  def diagonals
    [[[0, 0], [1, 1], [2, 2]], [[0, 2], [1, 1], [2, 0]]].map do |diagonal|
      diagonal.map { |pos| self[pos] }
    end
  end

  def full?
    @grid.none? do |row|
      row.none? do |el|
        el == :b
      end
    end
  end
end
