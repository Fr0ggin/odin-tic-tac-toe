# frozen_string_literal: true

# board contains all the information containing board-state and methods
class Board
  attr_reader :board

  # initialize with nil values so returns falsy on unused
  def initialize
    @board = Array.new(3) { Array.new(3) }
  end

  def rows
    board
  end

  def columns
    board.transpose
  end

  def diagonals
    [
      [board[0][0], board[1][1], board[2][2]],
      [board[0][2], board[1][1], board[2][0]]
    ]
  end

  def all_lines
    rows + columns + diagonals
  end

  def empty?(row, column)
    !@board.fetch(row).fetch(column)
  end

  def place_marker(row, column, marker)
    @board[row][column] = marker
  end

  def check_line(line)
    case line.all?
    when false
      false
    when true
      if line[0] == 'X'
        'X'
      elsif line[0] == 'O'
        'O'
      end
    end
  end

  def check_victory
    all_lines.each do |line|
      if check_line(line) == 'X'
        return 'X'
      elsif check_line(line) == 'O'
        return 'O'
      end
    end
  end

  def show
    3.times do |r|
      p board[r].join(' | ')
      puts '---------' unless r == 2
    end
  end
end
