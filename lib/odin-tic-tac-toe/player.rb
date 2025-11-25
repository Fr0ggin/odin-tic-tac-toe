# frozen_string_literal: true

# Player class is used to define the player used in the game class.
class Player
  attr_reader :id, :marker, :wins, :losses, :draws
  attr_accessor :name

  def initialize(id, name, marker)
    @id = id # identifies the player (1 or 2)
    @name = name # optional but might be nice to give players a chance to input name
    @marker = marker # "X" or "O"
    @wins = 0 # to keep track of won games
    @losses = 0 # to keep track of lost games
    @draws = 0 # to keep track of draws
  end

  def add_win
    @wins += 1
  end

  def add_loss
    @lossed += 1
  end

  def add_draw
    @draws += 1
  end
end
