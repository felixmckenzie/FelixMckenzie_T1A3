require 'json'



class Quiz

    attr_accessor :all_data, :prompt, :options, :answer, :value, :lifeline

    def initialize()
        @all_data = []
    end

    def life_line_options(options, answer)
        options.each_slice(2) do 
            |option|
            option.any?(answer)
            return option
        end
     end 

end





