require 'tty-prompt'
require 'tty-font'
require  'pastel'

module GamePlay

    def start_quiz
        Quiz.get_data
        prompt = TTY::Prompt.new
        Quiz.all.each do
            |question|
                input = prompt.select(question.prompt, question.options)
                check_answer(input, question.answer, question.value)
                announce_winner(username, question, Quiz.all)
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
        pastel = Pastel.new
        font = TTY::Font.new(:starwars)
        if question == quiz.last
            puts pastel.bright_green(font.write("Congratulations #{username}, You are a Ruby Millionaire"))
        end
    end

    


end


