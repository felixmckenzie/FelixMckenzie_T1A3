require 'json'
require_relative './main.rb'
require_relative './player.rb'

class Quiz

    extend GamePlay 
    attr_accessor :all, :prompt, :options, :answer, :value 

    @@all_data = []

    def initialize()
        @@all_data << self
    end

    def self.all
    @@all_data
    end

    def self.get_data
        file = File.read('../data/questions.json')
        data = JSON.parse(file, {:symbolize_names => true})
        data.each do 
            |res|
            quiz = Quiz.new
            quiz.prompt = res[:prompt]
            quiz.options = res[:options]
            quiz.answer = res[:answer]
            quiz.value = res[:value]
             end
     end

 end

Quiz.get_data



# class Question

#     attr_reader :data, :prompts, :options

# def initialize(question_number)
#     @data = []
#     load_data()
#     @prompts = []
#     @options = []
#     @values = []
#     get_values()
# end


# def load_data
#     file = File.read('../data/questions.json')
#     @data = JSON.parse(file, {:symbolize_names => true})
# end

# def get_values
#     @data.each do
#     |res|
#     @prompts << res[:prompt]
#     @options<< res[:options]
#     @values << res[:values]
# end
# end