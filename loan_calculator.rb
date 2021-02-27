# Mortgage / Car Loan Calculator

def prompt(message)
  Kernel.puts("=> #{message}")
end

# check if user entry is an float
def float?(num)
  num == num.to_f().to_s()
end

prompt("Welcome to Mortgage Calculator!")
prompt("-------------------------------")

loop do # main loop
  years_to_float = ''
  interest_float = ''
  amount_to_float = ''

  loop do
    prompt("What is the loan amount? ")
    amount = Kernel.gets().chomp()
    amount_to_float = amount.to_f()

    if amount_to_float != 0 && amount_to_float > 0 && amount_to_float != ' '
      break
    else
      prompt("Please enter a positive number")
    end
  end

  loop do
    prompt("What is the interest rate? ")
    prompt("(Example: 5 for 5% or 2.5 for 2.5%) ")
    interest = Kernel.gets().chomp()
    interest_float = interest.to_f()

    interest_float.class()

    if interest_float != 0 && interest_float > 0 && interest_float != ''
      break
    else
      prompt("Please enter a positive number")
    end
  end

  loop do
    prompt("What is the loan duration (in years)? ")
    prompt("(Example: 2 for 2 years or 2.5 for 2 and half years) ")
    years = Kernel.gets().chomp()
    years_to_float = years.to_f()

    if years_to_float != 0 && years_to_float > 0 && years_to_float != ' '
      break
    else
      prompt("Please enter a positive number")
    end
  end

  annual_interest_rate = interest_float / 100
  monthly_rate = annual_interest_rate / 12
  months = years_to_float * 12

  monthly_payment = amount_to_float * (monthly_rate /
                                      (1 - (1 + monthly_rate)**(-months)))

  prompt("Your monthly payment is: $#{format('%.2f', monthly_payment)}")

  prompt("Another calculation? (Y / N)")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator!")
prompt("Good bye!")
