CHOICES = %w(rock paper scissors)
def prompt(message)
  puts message
end

def win?(player1,player2)
  (player1 == 'rock' && player2 == 'scissors') ||
    (player1 == 'paper' && player2 == 'rock')   ||
    (player1 == 'scissors' && player2 == 'paper')
end
def display_results(player, computer)
  if win?(player,computer)
    result = "You won!"
  elsif win?(computer,player)
    result = "Computer won!"
  else
    result = "It's a tie"
  end
  result
end

loop do
  choice = ''
  loop do 
    puts "Enter your choice: rock, paper or scissors"
    choice = gets.chomp
    if CHOICES.include?(choice)
      break
    else
      puts "It's not a valid choice"
    end
  end

  computer_choice = CHOICES.sample
  puts "Your choice is: #{choice} and computer_choice is: #{computer_choice}"
  prompt display_results(choice,computer_choice)
  puts "Do you want to continue? press 'Y'"
  break unless gets.chomp.downcase == 'y'
end
puts "Thank you for playing!"
    