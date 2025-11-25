# odin-tic-tac-toe
Build a tic-tac-toe game on the command line where two human players can play against each other and the board is displayed in between turns.

<!-- thoughts, how to form the project while maintaining OOP 

PSEUDOCODE

Class Game (main)
Contains the core gameplay loop, 
players take turns to place X or O on empty square
Current board/score is shown between turns
Check on victory condition 
if true
    gamescore update
    victory message
    new game?
    if true
        new game
    if false
        end 
if false
    repeat from step 1


Class Player # contains all the player information needed
@id, # identifies the player (1 or 2) 
@name, # optional but might be nice to give players a chance to input name
@marker, # "X" or "O" 
@wins, # to keep track of won games
@losses, # to keep track of lost games
@draws, # to keep track of draws

Class Board # contains the gamestate

def is_taken? # to check if player input is valid
def is_victory? # to check if victory condition is fullfilled
def place_marker # takes player input and updates board 
def show # to show the board 










-->
