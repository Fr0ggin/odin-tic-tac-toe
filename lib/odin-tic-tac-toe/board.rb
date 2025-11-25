# frozen_string_literal: true

# board contains all the information containing board-state and methods
class Board
  attr_reader :board

  # initialize with nil values so returns falsy on unused
  def initialize
    @board = Array.new(3, Array.new(3))
  end

  def empty?(row, column)
    !@board.fetch(row).fetch(column)
  end

  def add_marker(row, column, marker)
    @board[row][column] = marker
  end

  def check_victory
    # define all win conditions in tic-tac-toe
    # 3 in a row
    # 3 in a column
    # 3 diagonally
    # possible ways to check in array is iterate and check for equal
    # otherwise possible trough multiple if statements
    # you could also count "X" and "O" in each row/column/diag
  end
end
