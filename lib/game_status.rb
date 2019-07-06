# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Middle column
  [2,5,8], # Last column
  [0,4,8], # Left diagonal
  [2,4,6]  # Right diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do | index |  # iterate over WIN_COMBINATIONS collection to return value #index array
    if index.all? { |i| board[i] == "X" }  # iterate through each element of each WIN_COMBINATIONS array and return array's (#index) with #all? "X"
      return index  # return the 3 element array (#index) with "X" representing the winning combination
    elsif index.all? { |i| board[i] == "O"}  # iterate through each element of each WIN_COMBINATIONS array and return array's (#index) with #all? "O"
      return index  # return the 3 element array (#index) with "O" representing the winning combination
    end
  end
    nil # return falsey/nil when 3 element array (#index) does not represent winning combination
end


def full?(board)
  board.all? do |i|
    i == "X" || i == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if (!full?(board) || draw?(board)) && !won?(board)
    return nil
  elsif (board[won?(board)[0]] == "X")
    return "X"
  elsif (board[won?(board)[0]] == "O")
    return "O"
  end
end
