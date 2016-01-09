CHOICES = %w(rock paper scissors lizard spock)
CHOICES_HASH = {'r'=> 'rock', 'p'=>'paper','s'=>'scissors','l'=>'lizard', 'sp'=>'spock'}

def prompt(message)
  puts message
end

def won?(points)
  points == 5
end

def win?(player1,player2)
  (player1 == 'rock' && (player2 == 'scissors' || player2 == 'lizard')) ||
    (player1 == 'paper' && (player2 == 'rock' || player2 == 'spock'))   ||
    (player1 == 'scissors' && (player2 == 'paper' || player2 == 'lizard')) ||
    (player1 == 'lizard' && (player2 == 'spock' || player2 == 'paper')) ||
    (player1 == 'spock' && (player2 == 'scissors' || player2 == 'rock'))
end

def display_results(player, computer)
    
  if win?(player,computer)
    result = "You mark!"
  elsif win?(computer,player)
    result = "Computer marks!"
  else
    result = "It's a tie"
  end
  result
end
loop do
  player_points = 0
  computer_points = 0
  loop do
    choice_char = ''
    choice = ''
    loop do 
      puts "Enter your choice: 'r' for rock, 'p' for paper, 's' for scissors, 'l' for lizard or 'sp' for spock"
      choice_char = gets.chomp
      choice = CHOICES_HASH[choice_char]
      if CHOICES.include?(choice)
        break
      else
        puts "It's not a valid choice"
      end
    end
  
    computer_choice = CHOICES.sample
    puts "Your choice is: #{choice} and computer_choice is: #{computer_choice}"
    result = display_results(choice,computer_choice)
    prompt(result)
    if result.match(/you/i)
      player_points += 1
    elsif result.match(/computer/i)
      computer_points += 1
    end
    puts "You have:#{player_points}"
    puts "Computer have:#{computer_points}"
    if won?(player_points)
      puts "You won the game!"
      break
    elsif won?(computer_points)
      puts "Computer won the game!"
      break
    end
  end
  
  puts "Do you want to start a new game? press 'Y'"
    break unless gets.chomp.downcase == 'y'
end
puts "Thank you for playing!"