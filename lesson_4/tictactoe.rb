#require 'pry'

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
loop do
board = initialize_board
display_board(board)
positions = (1..9).to_a


  loop do
    hash_test = board
    pos = ''
    loop do
      puts "Enter a number between 1 and 9"
      #binding.pry
      pos = gets.chomp.to_i
      if positions.include?(pos) && hash_test[pos] != 'X' && hash_test[pos] != 'O'
        break
      else
        puts "Not a correct number"
      end
    end
    board[pos] = 'X'
    pos_computer = ''
    if !board_full?(board)
      loop do 
        pos_computer = positions.sample
        if pos_computer != pos && hash_test[pos_computer] != 'X' && hash_test[pos_computer] != 'O'
            break
        end
      end
    
      board[pos_computer] = 'O'
    end

    display_board(board)
    if winner?(board, 'X') 
      puts "You won!"
      break
    elsif winner?(board, 'O')
      puts "Computer won!"
      break
    elsif board_full?(board)
      puts "It's a tie"
      break
    end  
  end
 
  puts "Do you want to play again? 'Y' to continue"
  ans = gets.chomp
  break unless ans.downcase == 'y'
end
 puts "Thank you for playing!"