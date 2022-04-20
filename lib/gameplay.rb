require 'tty-prompt'

class Gameplay
  def initialize(quiz, player)
    @quiz = quiz
    @player = player
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
    prompt = TTY::Prompt.new
    quiz = Gameplay.get_data
    quiz.each do |question|
      input = prompt.select(question.prompt, question.options)
      if input == question.lifeline && player.life_lines > 0
        new_options = question.life_line_options(question.options, question.answer)
        input = prompt.select(question.prompt, new_options)
      elsif input == question.lifeline && player.lifelines <= 0
        puts "Unfortunately #{player.username} you have used all your lifelines, please pick an answer"
      else
        check_answer(input, question.answer, question.value)
        announce_winner(player.username, question, quiz)
      end
    end
  end

  def check_answer(input, answer, value)
    prompt = TTY::Prompt.new
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
      puts "Congratulations #{username}, You are a Ruby Millionaire"
    end
  end
end


