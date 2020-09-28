require 'byebug'
class WrongPasswordError < StandardError
end

def enter_password
  puts "whats the password?"

  begin
    get_input
  # rescue happens only when any code from begin block raises an error
  # rescue [WrongPasswordError, TypeError] => e
  rescue WrongPasswordError => e
    # puts "Wrong password! Try again."
    # debugger
    puts e.message
    retry
  # rescue TypeError
  #   puts "Something went wrong."
  end

  puts "thanks!"
end

def get_input
  input = gets.chomp

  echo_input(input)

  unless input == "starwars"
    raise WrongPasswordError.new("Wrong password!")
  end
end

def echo_input(input)
  puts 3 * input # broken code
  # puts input * 3 # working code
end

# get_input
enter_password