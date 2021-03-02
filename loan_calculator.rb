# Mortgage / Car Loan Calculator

require 'yaml'
MESSAGES = YAML.load_file('languages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def add_newline
  puts
end

def integer?(num)
  num =~ /^-?[1-9]+$/
end

class String
  def red;            "\033[31m#{self}\033[0m" end
  def green;          "\033[32m#{self}\033[0m" end
  def magenta;        "\033[35m#{self}\033[0m" end
end

def clear_screen
  system('clear') || system('cls')
end

language = ''
loop do
  prompt "Please select language. En = English, Fr = French!"
  language = gets.chomp.downcase
  case language
  when "en" then break
  when "fr" then break
  else prompt "Wrong entry. Please try again!"
  end
end

add_newline
prompt MESSAGES[language]['welcome']
add_newline


loop do # main loop
  years = ''
  interest_float = ''
  amount_to_float = ''

  loop do
    prompt MESSAGES[language]["loan_amount"]
    amount = Kernel.gets().chomp()
    amount_to_float = amount.to_f()

    if amount_to_float != 0 && amount_to_float > 0 && amount_to_float != ' '
      break
    else
      prompt MESSAGES[language]["positive_number"]
    end
  end

  loop do
    prompt MESSAGES[language]["interest"]
    prompt("(Example: 5 for 5% or 2.5 for 2.5%) ")
    interest = Kernel.gets().chomp()
    interest_float = (interest.to_f()).round(2)

    if interest_float != 0 && interest_float > 0 && interest_float != ''
      break
    else
      prompt MESSAGES[language]["positive_number"]
    end
  end

  loop do
    prompt MESSAGES[language]["years"]
    years = Kernel.gets().chomp()

    if integer?(years)
      break
    else
      prompt MESSAGES[language]["valid_number"]
    end
  end

  annual_interest_rate = interest_float / 100
  monthly_rate = annual_interest_rate / 12
  months = years.to_f * 12

  monthly_payment = amount_to_float * (monthly_rate /
                                      (1 - (1 + monthly_rate)**(-months)))

  total = "$#{format('%.2f', monthly_payment)}"
  prompt MESSAGES[language]["result"] + (total).green
  add_newline

  prompt MESSAGES[language]["do_again?"]
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
  add_newline
  clear_screen
end

prompt MESSAGES[language]["thank_you"]
add_newline
prompt MESSAGES[language]["goodbye"]
