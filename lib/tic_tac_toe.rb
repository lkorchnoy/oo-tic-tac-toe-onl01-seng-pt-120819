class TicTacToe
  
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end
  
def position_taken?(index)
    ((@board[index] == "X") || (@board[index] == "O"))
  end  
  

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    @board.count{|square| square != " " }
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please enter a number (1-9):"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.detect do |winner|
      if (@board[winner[0]]) == "X" &&
        (@board[winner[1]]) == "X" &&
        (@board[winner[2]]) == "X"
          return winner
        elsif
          (@board[winner[0]]) == "O" &&
          (@board[winner[1]]) == "O" &&
          (@board[winner[2]]) == "O"
          return winner
      end
        false
    end
  end  

  def full?
    @board.all?{|square| square != " " }
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if combo = won?
      @board[combo[0]]
    end
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end 
  
  #WIN_COMBINATIONS = [
  #[0, 1, 2],
  #  [3, 4, 5],
  # [6, 7, 8],
 #  [0, 4, 8],
  # [2, 4, 6],
   # [0, 3, 6],
  #  [2, 5, 8],
  #   [1, 4, 7],
   #  [6, 7, 8],
   #  [0, 1, 2],
   #  [3, 4, 5]
   #  ]
  
  # def initialize(game)
   #  @game = game
  
 #  @board = [" "," "," "," "," "," "," "," "," "]
    #   end
  
  # def display_board(board)
    # @board = board
   #  row_index = 0
    # while row_index < @board.length do
     #  puts "row #{row_index} has # { @board[row_index] }  columns"
    #   column_index = 0
     #  while column_index < @board[row_index].length do 
     #    coord = "#{row_index}, #{column_index}"
      #   inner_len = @board[row_index][column_index].length
      #   puts "\t Coordinate [ #{coord} ] points to an
      #   #{ @board[row_index][column_index].class } at length
      #   #{inner_len}"
     #    inner_index = 0
     #    while inner_index < inner_len do
     #      puts "\t \t (#{coord}, #{inner_index}) is: #{  @board[row_index][column_index][inner_index] }"
     #      inner_index += 1
     #    end
     #    column_index += 1
   #    end
    #   row_index += 1
   #  end
    

  
  
  # def input_to_index(str)
  #  str.to_i. i + 1 
    
    