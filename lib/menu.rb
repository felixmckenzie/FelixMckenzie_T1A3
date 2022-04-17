require_relative './player.rb'
require_relative './main.rb'
require_relative './quiz.rb'
require 'TTY-Prompt'


class Menu

    extend GamePlay

def self.log_in
    prompt = TTY::Prompt.new
    puts "Please enter a username between 3 and 10 characters long?"
    username = prompt.ask("What would you like your user name to be?",)
    new_user = User.new
    Quiz.start_quiz

end

end

Menu.log_in