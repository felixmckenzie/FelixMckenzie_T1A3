require 'json'

class Questions
  attr_accessor :prompt, :options, :answer, :value, :lifeline, :number

  def initialize()
    @prompt = prompt
    @options = options
    @answer = answer
    @value = value
    @lifeline = lifeline
    @number = number
  end

  def life_line_options(options, answer)
    options.each_slice(2) do |arr|
      if arr.include?(answer)
        return arr
      end
    end
  end
end


