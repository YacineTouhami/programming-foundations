# def factors(number)
#   dividend = number
#   divisors = []
#   begin
#     divisors << number / dividend if number % dividend == 0
#     dividend -= 1
#   end until dividend == 0
#   divisors
# end
# p factors(16)
def factors(number)
  dividend = number
  divisors = []
  if number <= 0
    return "It's a negative number!"
  end
  loop do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
    if dividend == 0 
      break
    end
  end
  divisors
end
p factors(16)
p factors(-1)