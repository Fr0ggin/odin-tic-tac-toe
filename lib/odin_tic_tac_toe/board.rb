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

  # rubocop:disable Metrics/AbcSize
  def diagonals
    [
      [board[0][0], board[1][1], board[2][2]],
      [board[0][2], board[1][1], board[2][0]]
    ]
  end
  # rubocop:enable Metrics/AbcSize

  def all_lines
    rows + columns + diagonals
  end

  # to check if player input is valid
  def empty?(row, column)
    !@board.fetch(row).fetch(column)
  end

  # takes player input and updates board
  def place_marker(row, column, marker)
    @board[row][column] = marker
  end

  def check_line(line)
    return unless line.uniq.length == 1

    case line.first
    when nil
      nil
    when 'X'
      'X'
    when 'O'
      'O'
    end
  end

  def draw?
    all_lines.flatten.none?(nil)
  end

  # to check if victory condition is fulfilled
  def check_victory
    all_lines.each do |line|
      if check_line(line) == 'X'
        return 'X'
      elsif check_line(line) == 'O'
        return 'O'
      end
    end
  end

  # show the board state in console through p and puts
  def show
    3.times do |r|
      p board[r].join(' | ')
      puts '---------' unless r == 2
    end
  end
end
