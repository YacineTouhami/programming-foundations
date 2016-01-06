require 'yaml'
puts MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message,lang='fr')
  MESSAGES[lang][message]
end

def valid_number?(number)
  number == '0' || number.to_i != 0
end

def valid_op?(op)
  op_array = ['+', '-', '*', '/']
  op_array.include?(op)
end

def message_operation(op)
  case op
  when '+'
    'Adding'
  when '-'
    'Substracting'
  when '*'
    'Multiplying'
  when '/'
    'Dividing'
  end
end
puts messages('welcome')
name = ''
loop do
  name = gets().chomp()
  if !name.empty?
    break
  else
    puts messages('valid_name')
  end
end 

puts "Hi #{name}"
loop do
  begin
    puts messages('first_num')
    number1 = Kernel.gets().chomp
  end while !valid_number?(number1)
  number2 = ""
  loop do
    puts messages('second_num')
    number2 = Kernel.gets().chomp
    if valid_number?(number2)
      break
    else
      puts messages('valid_num')
    end
  end
  begin
    puts messages('input_op')
    op = Kernel.gets().chomp
  end while !valid_op?(op)

  number1 = number1.to_i()
  number2 = number2.to_i()
  result = case op
           when '+'
             number1 + number2
           when '_'
             number1 - number2
           when '*'
             number1 * number2
           when '/'
             number1.to_f / number2.to_f
           end
  puts "#{message_operation(op)} numbers ..."
  print messages('result').chomp
  puts result
  puts messages('continue')
  break if gets.chomp.downcase != 'y'
end
puts messages('thanks')
