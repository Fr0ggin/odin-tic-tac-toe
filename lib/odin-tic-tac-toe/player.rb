# frozen_string_literal: true

# Player class is used to define the player used in the game class.
class Player
  attr_accessor :id, :name, :marker, :wins, :losses, :draws

  initialize(id, name, marker)
  @id = id # identifies the player (1 or 2)
  @name = name # optional but might be nice to give players a chance to input name
  @marker = marker # "X" or "O"
  @wins = 0 # to keep track of won games
  @losses = 0 # to keep track of lost games
  @draws = 0 # to keep track of draws
end
