def generate_UUID
  arr = (0..10).to_a + ('a'..'f').to_a
  array = [8, 4, 4, 4, 12]
  uuid = ''
  array.each_with_index do |value, index|
    value.times do 
      uuid += arr.sample.to_s
    end
    uuid += '-' unless index == 4
  end
  uuid
end
puts generate_UUID