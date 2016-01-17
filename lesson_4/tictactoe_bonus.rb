require 'pry'

WINNING_LINES = [[1, 2, 3],[4, 5, 6],[7, 8, 9]] +
                [[1, 4, 7],[2, 5, 8],[3, 6, 9]] +
                [[1, 5, 9],[3, 5, 7]]
SCORE_TO_WIN = 5
POSITIONS = (1..9).to_a

def display_board(brd)
  puts "     |     |     "
  puts " #{brd[1]}   |  #{brd[2]}  |  #{brd[3]}   "
  puts "     |     |     "
  puts "-----------------"
  puts "     |     |     "
  puts " #{brd[4]}   |  #{brd[5]}  |  #{brd[6]}   "
  puts "     |     |     "
  puts "-----------------"
  puts "     |     |     "
  puts " #{brd[7]}   |  #{brd[8]}  |  #{brd[9]}   "
  puts "     |     |     "
end
def initialize_board
  board = {}
  (1..9).each { |num| board[num] = ' '}
  board
end
def empty_pieces(board)
  board.keys.select { |num| board[num] == ' ' }
end
def winner?(board,char)
  (board[1] == char && board[2] == char && board[3] == char) || 
  (board[4] == char && board[5] == char && board[6] == char) || 
  (board[7] == char && board[8] == char && board[9] == char) ||
  (board[1] == char && board[4] == char && board[7] == char) ||
  (board[2] == char && board[5] == char && board[8] == char) ||
  (board[3] == char && board[6] == char && board[9] == char) ||
  (board[1] == char && board[5] == char && board[9] == char) ||
  (board[3] == char && board[5] == char && board[7] == char) 
end
def board_full?(board)
  board.each do |index,value|
    return false if value != 'X' && value != 'O'
  end
  true
end
def joinor(arr, delimiter)
  arr[-1] = "or #{arr[-1]}" if arr.size > 1
  arr.join(delimiter)
end
def computer_defense?(board) 
   WINNING_LINES.each do |line|
     
    if board.values_at(line[0],line[1],line[2]).count('X') == 2 &&
       board.values_at(line[0],line[1],line[2]).count(' ') == 1
    
      return true
    end
   end
   return false
end
def computer_offense?(board) 
   WINNING_LINES.each do |line|
     
    if board.values_at(line[0],line[1],line[2]).count('O') == 2 &&
       board.values_at(line[0],line[1],line[2]).count(' ') == 1
    
      return true
    end
   end
   return false
end
def play_computer_defense(board)
   WINNING_LINES.each do |line|
    if board.values_at(line[0],line[1],line[2]).count('X') == 2 &&
       board.values_at(line[0],line[1],line[2]).count(' ') == 1
     
      line.each do |num|
        return num if board.values_at(num) == [' ']
      end 
      
    end
   end
   
end
def play_computer_offense(board)
   WINNING_LINES.each do |line|
    if board.values_at(line[0],line[1],line[2]).count('O') == 2 &&
       board.values_at(line[0],line[1],line[2]).count(' ') == 1
     
      line.each do |num|
        return num if board.values_at(num) == [' ']
      end 
    end
   end
   
end
def player_play(board)
  pos = ''
  loop do
    puts "Enter a positon: #{joinor(empty_pieces(board),', ')}"
    pos = gets.chomp.to_i
    if empty_pieces(board).include?(pos) 
      break
    else
      puts "Not a correct position"
    end
  end
  board[pos] = 'X'
end
def computer_play(board)
   
  pos_computer = ''
  if !computer_offense?(board) && !computer_defense?(board) 
    loop do 
      pos_computer = POSITIONS.sample
      
      break if empty_pieces(board).include?(pos_computer)
    end
    if board[5] == ' ' 
      pos_computer = 5
    end
  end
  if computer_defense?(board)
     #binding.pry
    pos_computer = play_computer_defense(board)
   
  end
  if computer_offense?(board)
   
    pos_computer = play_computer_offense(board)
  end  
  board[pos_computer] = 'O'
end

loop do
puts "player starts: p or computer starts: c"
CHOOSE = gets.chomp.downcase
player_points = 0
computer_points = 0
    loop do
        board = initialize_board
        display_board(board)
      loop do
        if CHOOSE == 'p'
          player_play(board)
        else
          computer_play(board)
          if winner?(board, 'O')
           computer_points += 1
            display_board(board)
            break
          end
          display_board(board)
        end
        if !board_full?(board)
          if CHOOSE == 'p'
            computer_play(board)
          else
              player_play(board)
              if winner?(board, 'X')
                 player_points += 1 
                 display_board(board)
              break
              end
             
          end
        end
        display_board(board)
        if winner?(board, 'X')
          player_points += 1 
          break
          elsif winner?(board, 'O')
          computer_points += 1
          break
        elsif board_full?(board)
          puts "It's a tie"
          break
        end  
      end
      puts "Your score is: #{player_points}"
        puts "Computer score is: #{computer_points}"
      if player_points == SCORE_TO_WIN
          puts "You won the game!"
          break
      elsif computer_points == SCORE_TO_WIN
          puts "Computer won the game!"
          break
      end
    end  
 
  puts "Do you want to play again? 'Y' to continue"
  ans = gets.chomp
  break unless ans.downcase == 'y'
end
 puts "Thank you for playing!"