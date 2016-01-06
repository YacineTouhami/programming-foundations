def iinteger?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(input)
  iinteger?(input) || float?(input)
end

puts float?(2.2)
puts float?(1)
puts number?("a")
puts number?(0.9)
puts iinteger?(2.2)
puts iinteger?(4)
