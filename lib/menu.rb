require_relative './player.rb'
require_relative './gameplay.rb'
require_relative './quiz.rb'
require 'tty-prompt'
require 'tty-table'

class Menu
  attr_accessor :table

  def initialize
    @table = []
  end

  def self.print_welcome_message
    
  end

  def self.log_in
    prompt = TTY::Prompt.new
    puts "Please enter a username between 3 and 10 characters long?"
    username = prompt.ask("What would you like your user name to be?")
    player = Player.new(username)
    player.lifelines = 2
    puts "Ok #{player.username}, Let's play 'Who Wants To Be a Ruby Millionaire', You have #{player.lifelines} lifelines to use"
    new_quiz = ::Gameplay.new(Quiz.new, player)
    new_quiz.start_quiz(player)
  end

  def self.prize_money
    table = TTY::Table.new do |t|
      t << ["question 1", "$500"]
      t << ["question 2", "$1,000"]
      t << ["question 3", "$2,000"]
      t << ["question 4", "$5,000"]
      t << ["question 5", "$10,000"]
      t << ["question 6", "$20,000"]
      t << ["question 7", "$50,000"]
      t << ["question 8", "$75,000"]
      t << ["question 9", "$150,000"]
      t << ["question 10", "$250,000"]
      t << ["question 11", "$500,000"]
      t << ["question 12", "$1,000,000"]
    end

    puts table.render(:ascii, alignment: [:center])
  end
end

Menu.log_in
