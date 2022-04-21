require_relative './player.rb'
require_relative './gameplay.rb'
require_relative './quiz.rb'
require 'tty-prompt'
require 'tty-table'
require 'colorize'
require 'artii'

class Menu
  def self.print_welcome_message
    font = Artii::Base.new
    puts font.asciify("Welcome to").colorize(:cyan)
    puts font.asciify('Who Wants to Be A Ruby Millionaire!').colorize(:light_green)
  end

  def self.log_in
    prompt = TTY::Prompt.new
    puts "Please enter a user name between 3 and 10 characters long".colorize(:cyan)
    puts "user name can contain upper or lowercase letters, numbers, underscores or dashes".colorize(:cyan)
    username = prompt.ask("What would you like your user name to be?") do |q|
      q.validate(/^[a-zA-Z0–9_-]{3,10}$/, "Invalid username: %{value}, please enter again".colorize(:red))
    end
    system("clear")
    player = Player.new(username)
    player.lifelines = 2
    puts "Ok #{player.username}, Let's play 'Who Wants To Be a Ruby Millionaire".colorize(:light_green)
    puts "You have #{player.lifelines} life lines to use".colorize(:cyan)
    new_quiz = ::Gameplay.new(Quiz.new, player)
    new_quiz.start_quiz(player)
  end

  def self.prize_money
    table = TTY::Table.new do |t|
      t << ["QUESTION", "VALUE"]
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

  def self.display_menu
    prompt = TTY::Prompt.new

    choices = [
      { name: "Log in and play", value: 1 },
      { name: "View prize money", value: 2 },
      { name: "How to play", value: 3 },
      { name: "Exit the app", value: 4 }
    ]

    Menu.print_welcome_message
    puts input = prompt.select("What would you like to do?", choices, cycle: true)
    Menu.user_selection(input)
  end

  def self.user_selection(input)
    case input
    when 1
      Menu.log_in
    when 2
      Menu.prize_money
    when 3
      Menu.rules
    when 4
      exit
    end
  end
end
