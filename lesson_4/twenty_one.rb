

def total_cards(cards)
  total = 0
  cards.each do |arr|
    if arr[0] != 'ace'
      if arr[0].to_i == 0 
        total += 10
      elsif 
        total += arr[0]          
      end
    else
      if total <= 10
        total += 11
      else
        total += 1
      end
    end
  end
    total
end
def busted?(cards)
  total_cards(cards) > 21
end
def hit(cards)
cards.push(DECK.sample)
DECK.delete(cards.last)
end
loop do
DECK = ((2..10).to_a + ['jack','queen','king','ace']).product(['hearts', 'diamonds', 'clubs','spades'])
player_cards = []
dealer_cards = []
  loop do
    2.times do |i|
      player_cards.push(DECK.sample)
      DECK.delete(player_cards[i])
      dealer_cards.push(DECK.sample)
      DECK.delete(dealer_cards[i])
    end
    p "palyer: #{player_cards}"
    p "dealer: #{dealer_cards}"
    puts total_cards(player_cards)
    puts total_cards(dealer_cards)
    # Player turn
    ans = nil
    loop do
      puts "h for hit, s for stay"
      ans = gets.chomp.downcase
      if ans == 'h'
        hit(player_cards)
        puts "After hit, player has: #{total_cards(player_cards)}"
        puts "player cards: #{player_cards.inspect}"
        break if busted?(player_cards)
      elsif ans == 's' || busted?(player_cards)
        break
      end
      
      
      
    end
    if busted?(player_cards)
      puts "Player busted has: #{total_cards(player_cards)}"
      puts "Player busted: Dealer won!"
      break
    else
      puts "You choose to stay"
      total_player = total_cards(player_cards)
    end

    # Dealer turn
    loop do
      
      if total_cards(dealer_cards) >= 17 || busted?(dealer_cards)
        break
      end
      hit(dealer_cards)
      puts "After hit, dealer has: #{total_cards(dealer_cards)}"
      puts "dealer cards: #{dealer_cards.inspect}"

    end 
    if busted?(dealer_cards)
      puts "dealer busted has: #{total_cards(dealer_cards)}"
      puts "Dealer busted: Player won!"
      break
    else
      total_dealer = total_cards(dealer_cards)
      puts "dealer has: #{total_dealer}"
    end
    if total_player > total_dealer
      puts "After compare: Player won!!!"
      break
    elsif total_player < total_dealer
      puts "After compare: Dealer won!!!"
      break
    else
      puts "It's a tie"
      break
    end
  end
  puts "Play again? hit 'y'"
  answer = gets.chomp.downcase
  break if answer != 'y'
end
puts "Thank you for playing"
