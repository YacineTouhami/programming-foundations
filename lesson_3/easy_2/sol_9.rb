flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! do |name, index|
  name[0,3]
end
p flintstones