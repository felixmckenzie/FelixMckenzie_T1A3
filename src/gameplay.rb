require 'tty-prompt'
require 'colorize'
require 'artii'

class Gameplay
  def initialize(quiz, player)
    @quiz = quiz
    @player = player
    @prompt = TTY::Prompt.new
    @winner_font = Artii::Base.new
  end

  def self.get_data
    file = File.read('../data/questions.json')
    data = JSON.parse(file, { :symbolize_names => true })
    data.map do |res|
      question = Questions.new
      question.prompt = res[:prompt]
      question.options = res[:options]
      question.answer = res[:answer]
      question.value = res[:value]
      question.lifeline = res[:lifeline]
      question.number = res[:number]
      question
    end
  rescue Errno::ENOENT 
    puts "File Not Found"
  end 

  def start_quiz(player)
    quiz = Gameplay.get_data
    quiz.each do |question|
      begin
        first_input = @prompt.select(question.prompt, question.options)
        if first_input == question.lifeline && player.lifelines == 0
          puts "Warning: No life lines left".colorize(:red)
          if @prompt.yes?("Would you like to exit the app?")
            exit
          else
            redo
          end
        end
        if first_input == question.lifeline && player.lifelines > 0
          life_line_options = question.life_line_options(question.options, question.answer)
          lifeline_input = @prompt.select(question.prompt, life_line_options)
          check_answer(lifeline_input, question.answer, question.value, question.number, player)
          player.update_life_lines(player)
        else
          check_answer(first_input, question.answer, question.value, question.number, player)
          announce_winner(player, question, quiz)
        end
      end
    end
  end

  def check_answer(input, answer, value, number, player)
    if input == answer
      puts "#{input} is correct, you've earnt #{value}".colorize(:light_green)
      player.update_prize_money(value, player)
      player.update_player_score(number, player)
    else
      puts "#{input} is incorrect".colorize(:red)
      puts "Thanks for playing".colorize(:light_green)
      player.save_scoreboard(player)
      sleep 1
      Menu.display_menu
    end
  end
end

def announce_winner(player, question, quiz)
  if question == quiz.last
    puts @winner_font.asciify("Congratulations #{player.username}, You are a Ruby Millionaire!").colorize(:light_green)
    player.save_scoreboard(player)
    sleep 2
    Menu.display_menu
  end
end
