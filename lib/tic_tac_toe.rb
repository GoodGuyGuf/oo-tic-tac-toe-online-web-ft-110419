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

  def valid_move?(index)
  #Should check if position is occupied
  #Should expect 0 - 8 to be truthy as long as it is not occupied
  #Should expect 4 to be falsey because it is occupied
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


  def won?
    WIN_COMBINATIONS.detect do |combo|
    

    end

  end


  def full?

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
