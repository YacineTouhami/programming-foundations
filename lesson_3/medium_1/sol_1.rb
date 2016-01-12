str = "The flintstones rock"
10.times do 
  p str
  str = "  " + str
end

# or

10.times { |number| puts " " * number }
