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
      quiz = Quiz.new
      quiz.prompt = res[:prompt]
      quiz.options = res[:options]
      quiz.answer = res[:answer]
      quiz.value = res[:value]
      quiz.lifeline = res[:lifeline]
      quiz
    end
  end

  def start_quiz(player)
    quiz = Gameplay.get_data
    quiz.each do |question|
      begin
        first_input = @prompt.select(question.prompt, question.options)
        if first_input == question.lifeline && player.lifelines == 0
          puts "Warning: No life lines left, please try again".colorize(:red)
          redo
        end

        if first_input == question.lifeline && player.lifelines > 0
          new_options = question.life_line_options(question.options, question.answer)
          second_input = @prompt.select(question.prompt, new_options)
          check_answer(second_input, question.answer, question.value)
          player.lifelines -= 1;
        else
          check_answer(first_input, question.answer, question.value)
          announce_winner(player.username, question, quiz)
        end
      end
    end
  end

  def check_answer(input, answer, value)
    if input == answer
      puts "#{input} is correct, you've earnt #{value}"
    else
      puts "#{input} is incorrect"
      puts "Thanks for playing"
      exit
    end
  end

  def announce_winner(username, question, quiz)
    if question == quiz.last
      puts @winner_font.asciify("Congratulations #{username}, You are a Ruby Millionaire!").colorize(:light_green)
    end
  end
end

