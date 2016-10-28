require 'pry'

puts "What is your name?"
@user = gets.strip
puts "Welcome to the Magic 8 Ball, #@user"
@ans = ['It is certain', 'It is decidedly so', 'Without a doubt', 'Yes definitely', 'You may rely on it', 'As I see it, yes', 'Most likely', 'Outlook good', 'Yes', 'Signs point to yes', 'Reply hazy try again', 'Ask again later', 'Better not tell you now', 'Cannot predict now', 'Concentrate and ask again', 'Dont count on it', 'My reply is no', 'My sources say no', 'Outlook not so good', 'Very doubtful']
@fun_ans = []
# @ans2 = []
# @fun_ans2 = []
@ans_bank = []
@hist_arr = []
# @ans2 = @ans.clone
# @fun_ans2 = @fun_ans.clone


def menu_options
  puts "\n---The Magic 8 Ball---"
  puts "1: Ask it a question"
  puts "2: Add a funny answer"
  puts "3: See answer bank"
  puts "4: Reset to original answers"
  puts "5: Display history"
  puts "6: Exit\n"
end

def question # takes a user question and outputs a random answer
  @ans2 = @ans.clone
  @fun_ans2 = @fun_ans.clone
  puts "What would you like to ask the Magic 8 Ball #@user?"
  ask = gets.strip
  comb = @ans2.concat(@fun_ans2)
  shake = comb.sample()
  final = ("#{ask} = #{shake}")
  @hist_arr << final
  puts "The Magic 8 Ball says '#{shake}'"
end

def answer # takes a user answer
  puts "What answer would you like to add to the Magic 8 Ball? #@user"
  add = gets.strip
  if @ans_bank.include?(add)
    @fun_ans << add
  # elsif @fun_ans.include?(add)
  #   @fun_ans << add
  else
    puts "ERROR: that answer is already in use"
    puts "Would you like to exit or try again? (exit/try)"
    try = gets.strip.downcase
    if try == 'try'
      answer
    elsif try == 'exit'
      menu
    else
      puts "ERROR: Please input a valid option."
      answer
    end
  end
end

def answer_bank # displays all possible answers
  ans_bank = []
  @ans2 = @ans.clone
  @fun_ans2 = @fun_ans.clone
  ans_bank << @ans2.concat(@fun_ans2)
  @ans_bank = ans_bank.flatten
  puts "---The Magic 8 Ball Answer Bank---"
  @ans_bank.each do |bank|
    puts bank
  end
end

def reset # resets all answers to classic answers
  puts "Are you sure you would like to reset the answer bank (y/n)?"
  bank = gets.strip.downcase
  if bank == 'y'
    @fun_ans.clear
    puts "You successfully reset the answers #@user"
  else
    menu
  end
end

def history #puts the history of the answers
  puts "---The Magic 8 Ball History---"
  @hist_arr.each do |hist|
    puts hist
  end
end

def menu #puts menu
  menu_options
  puts "What would you like to do #@user?"
  option = gets.strip.downcase
  case option
    when '1', 'ask', 'question', 'ask it a question'
      question
    when '2', 'add', 'funny', 'answer', 'add a funny answer'
      answer
    when '3', 'see', 'answer', 'answer bank', 'see answer bank'
      answer_bank
    when '4', 'reset', 'original', 'reset to original answers'
      reset
    when '5', 'display', 'history', 'display history'
      history
    when '6', 'exit'
      puts "Goodbye"
      exit
    else
      puts "ERROR: please select a valid option #@user"
  end
end

while true
  menu
end
