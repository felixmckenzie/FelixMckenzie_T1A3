require_relative './player.rb'
require_relative './gameplay.rb'
require_relative './quiz.rb'
require 'tty-prompt'


class Menu


    def self.log_in
        prompt = TTY::Prompt.new
        puts "Please enter a username between 3 and 10 characters long?"
        username = prompt.ask("What would you like your user name to be?",)
         new_player = Player.new(username)
         puts new_player.username
         new_quiz = ::Gameplay.new(Quiz.new, new_player)
         new_quiz.start_quiz(new_player)
end
end

Menu.log_in 