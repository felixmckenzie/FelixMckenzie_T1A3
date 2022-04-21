require 'json'

class Quiz
  attr_accessor :prompt, :options, :answer, :value, :lifeline

  def initialize()
    @all_data = []
  end

  def life_line_options(options, answer)
    options.each_slice(2) do |arr|
      if arr.include?(answer)
        return arr
      end
    end
  end
end
