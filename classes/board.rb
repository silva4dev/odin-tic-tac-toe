class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3, " ") }
  end

  def display
    puts "   1 2 3"
    puts "  -------"
    @grid.each_with_index do |row, i|
      print "#{i + 1}| "
      row.each { |cell| print "#{cell}|" }
      puts "\n  -------"
    end
  end

  def place_symbol(symbol, row, col)
    @grid[row][col] = symbol
  end

  def cell_empty?(row, col)
    @grid[row][col] == " "
  end

  def full?
    @grid.all? { |row| row.none? { |cell| cell == " " } }
  end

  def winner?(symbol)
    winning_lines = [
      [[0, 0], [0, 1], [0, 2]],
      [[1, 0], [1, 1], [1, 2]],
      [[2, 0], [2, 1], [2, 2]],
      [[0, 0], [1, 0], [2, 0]],
      [[0, 1], [1, 1], [2, 1]],
      [[0, 2], [1, 2], [2, 2]],
      [[0, 0], [1, 1], [2, 2]],
      [[0, 2], [1, 1], [2, 0]],
    ]
    winning_lines.any? do |line|
      line.all? { |row, col| @grid[row][col] == symbol }
    end
  end
end
