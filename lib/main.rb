require 'tty-prompt'

module GamePlay

    def start_quiz
        Quiz.get_data
        prompt = TTY::Prompt.new
     Quiz.all.each do
        |question|
        prompt.select(question.prompt, question.options)
     end
    end

end


