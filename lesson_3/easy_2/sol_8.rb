flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.each do |name, index|
  if name.start_with?('Be')
    puts flintstones.index(name) 
  end 
end
