# frozen_string_literal: true

# Class Game (main)

# players take turns to place X or O on empty square
# Current board/score is shown between turns
# Check on victory condition
# if true
#     game-score update
#     victory message
#     new game?
#     if true
#         new game
#     if false
#         end
# if false
#     repeat from step 1
#
# Contains the core gameplay loop. def play is a round. def start initiates a new game
class Game
  def initialize
    create_players
    @board = Board.new
    @current_player = @player1
  end

  def create_players
    puts "Lets play a game, first off, who will play with 'X'?"
    name = gets.chomp
    @player1 = Player.new(1, name.empty? ? 'Player 1' : name, 'X')
    puts "Thank you #{@player1.name} and now.. who will play with 'O'?"
    name = gets.chomp
    @player2 = Player.new(2, name.empty? ? 'Player 2' : name, 'O')
  end

  # requests a row and column and returns an array with row and column
  def request_player_move
    row = column = nil
    loop do
      puts 'in which row (0,1,2) do you want to place your mark?'
      row = gets.chomp
      puts 'and in what column (0,1,2) do you want to place your mark?)'
      column = gets.chomp
      valid = %w[0 1 2]
      break if valid.include?(row) && valid.include?(column)

      puts 'This is an invalid input, try again'
    end
    [row.to_i, column.to_i]
  end

  def take_turn(player)
    loop do
      puts "#{@current_player.name}, your up!"
      move = request_player_move
      if @board.empty?(move[0], move[1])
        @board.place_marker(move[0], move[1], player.marker)
        break
      end
      puts 'This place is already taken, try again'
    end
  end

  def switch_turn
    @current_player = other_player
  end

  def other_player
    @current_player == @player1 ? @player2 : @player1
  end

  def victory
    puts "Congratulations #{@current_player.name} you won!"
    @current_player.add_win
    other_player.add_loss
  end

  def play
    @board.show
    loop do
      take_turn(@current_player)
      @board.show
      winner = @board.check_victory
      if winner.include?('XO')
        victory
        break
      elsif @board.draw?
        puts "It's a draw, hope you both had fun!"
        break
      else
        @current_player = @other_player
      end
    end
  end

  def start
    @board = Board.new
    @current_player = @player1
    play
  end
end
