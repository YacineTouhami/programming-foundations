require 'yaml'
MESSAGES = YAML.load_file('mortage_calculator_messages.yml')

LANGUAGE = 'fr'
def messages(message)
  MESSAGES[LANGUAGE][message]
end

def valid_loan_amount(loan)
  loan.to_i().to_s() == loan
end

def valid_apr(input)
  /^\d+$/.match(input) || (/\d/.match(input) && /^\d*\.?\d*$/.match(input))
end

def valid_loan_duration(loan_dur)
  loan_dur.to_i().to_s() == loan_dur
end

loop do
  puts messages('welcome')
  loan_am = ''
  loop do
    puts messages('loan_amount')
    loan_am = Kernel.gets().chomp()
    if valid_loan_amount(loan_am)
      break
    else
      puts messages('valid_loan')
    end
  end
  apr = ''
  loop do
    puts messages('apr')
    apr = Kernel.gets().chomp()
    if valid_apr(apr)
      break
    else
      puts messages('valid_apr')
    end
  end
  loan_dur_months = ''
  loop do
    puts messages('loan_dur')
    loan_dur_months = Kernel.gets().chomp()
    if valid_loan_duration(loan_dur_months)
      break
    else
      puts messages('valid_loan_dur')
    end
  end

  # mrc : monthly interst rate

  apr = apr.to_f
  loan_am = loan_am.to_i
  loan_dur_months = loan_dur_months.to_i

  mrc = apr / 10 / 12

  # fmp : fixed monthly payment
  # fmp = loan_am * (mrc * ((1 + mrc)raise to power loan_dur_months))/(((1 + mrc) power loan_dur_months)-1 )

  # first lets calculate (1 + mrc)raise to power loan_dur_months
  sub_total = 1.0
  for i in 1..loan_dur_months
    sub_total *= (1 + mrc)
  end

  fmp = loan_am * (mrc * sub_total) / (sub_total - 1)

  print messages('result').chomp
  puts "$ #{fmp}"

  puts messages('continue')
  ans = Kernel.gets.chomp
  break unless ans.downcase == 'y'
end
puts messages('thanks')
