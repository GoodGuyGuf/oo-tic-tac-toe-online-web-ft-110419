require 'pry'
class TicTacToe

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

  def initialize(board = nil)
  @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(string)
    input = string.to_i - 1
    input
  end

  def move(index, token = "X")
  @board[index] = token
  end

  def position_taken?(index)
    position = true
      if @board[index] == " "
      position = false
      end
    position
  end
# if position is taken it is not a valid move. It is false.
# if index is a number that is not allowed than it is returned false
  def valid_move?(index)
    if position_taken?(index)
      false
    elsif index < 0 || index > 8
      false
    else
      true
    end
  end

  def turn_count
  @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
  turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Play using numbers 1-9!"
    input = gets
    index = input_to_index(input)
    if valid_move?(index)
        move(index, current_player)
        display_board
    else
        input = gets
    end
  end

  #The logic is that we don't know the outcome like the spec does.
  #We don't actually know if the winning combo is [0,4,8]
  #This method should work on any winning combo.
  def won?
    WIN_COMBINATIONS.detect do |combo|
    @board[combo.first] == @board[combo[1]] &&
    @board[combo.first] == @board[combo[2]] &&
    @board[combo.first] != " "
    end
  end

  #Should return true for a draw
  #should return false if the board isn't filled
  #Should return true if every element in @board contains either an X or O
  def full?
 # if the board length is less than 9 then it is not full.
 # if the board length has a winner or a draw then it is full.
 binding.pry
  end

  def draw?

  end

  def over?
  won? || draw? || full?
  end

  def winner

  end

  def play

  end

end
