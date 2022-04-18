require 'json'
require_relative './gameplay.rb'

class Quiz

    attr_accessor :all, :prompt, :options, :answer, :value 

    def initialize()
        @all_data = []
    end

    def self.all
    @all_data 
    end

 end




