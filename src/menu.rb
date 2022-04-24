require_relative './player.rb'
require_relative './gameplay.rb'
require_relative './quiz.rb'
require 'tty-prompt'
require 'colorize'
require 'artii'
require 'terminal-table'

class Menu
  def self.print_welcome_message
    font = Artii::Base.new
    puts font.asciify("Welcome to").colorize(:cyan)
    puts font.asciify('Who Wants to Be A Ruby Millionaire!').colorize(:light_green)
  end

  def self.log_in
    prompt = TTY::Prompt.new
    details = Menu.get_user_details
    player = Player.new(details)
    player.username = player.player_stats[:name]
    player.lifelines = player.player_stats[:lifelines]
    input = prompt.select("Choose to start quiz or view score board") do |menu|
      menu.choice "Start quiz"
      menu.choice "View Scoreboard"
    end
    if input == "Start quiz"
      puts "Ok #{player.username}, Let's play 'Who Wants To Be a Ruby Millionaire".colorize(:light_green)
      puts "You have #{player.lifelines} life lines to use".colorize(:cyan)
      new_quiz = ::Gameplay.new(Questions.new, player)
      new_quiz.start_quiz(player)
    elsif input == "View Scoreboard"
      player.display_scoreboard(player)
      if prompt.yes?("Type 'Y' to return to main menu or 'N' to exit the app")
        Menu.display_menu
      else
        exit
      end
    end
  end

  def self.prize_money
    prompt = TTY::Prompt.new
    table = Terminal::Table.new do |t|
      t << ["QUESTION".colorize(:blue), "VALUE".colorize(:light_green)]
      t.add_separator
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
    puts "Test your Ruby knowledge by logging in and answering 12 multiple choice questions"
    puts "Throughout the quiz you may utilise two 50/50 lifelines"
    puts "These reduce the multiple choice options from four to two"
    puts "if you guess all questions correct you will take home a check for $1,000,000 "
    puts table
    if prompt.yes?("Type 'Y' to return to main menu or 'N' to exit the app")
      Menu.display_menu
    else
      exit
    end
  end

  def self.display_menu
    prompt = TTY::Prompt.new
    choices = [
      { name: "Log in to play or view scoreboard", value: 1 },
      { name: "View Rules and Prize Money", value: 2 },
      { name: "Exit the app", value: 3 }
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
      exit
    end
  end

  def self.get_user_details
    prompt = TTY::Prompt.new
    valid = "Please enter a username. Username must be between 3 and 10 characters long, and can contain letters, numbers, underscores or dashes"
    puts valid
    details = prompt.collect do
      key(:name).ask("What would you like your username to be?", required: true, validate: /^[a-zA-Z0–9_-]{3,10}$/)
    end
    details[:score] = 0
    details[:prizemoney] = ""
    details[:lifelines] = 2
    details
  end
end


