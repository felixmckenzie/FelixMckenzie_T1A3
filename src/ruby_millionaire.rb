require_relative "./menu.rb"
require 'optparse'

class ArgParser
  def self.parse(args)
    options = {}
    opts = OptionParser.new do |opts|
      opts.banner = "Usage: ruby_millionare.rb"

      opts.on('-h', '--help', 'Opens the help file') do |help|
        options[:help] = help
      end

      opts.on('-q', '--quick', 'Takes user to log in and play') do |quick|
        options[:quick] = quick
      end
    end

    begin
      opts.parse(args)
    rescue Exception => e
      puts "Error encountered: #{e}"
      exit
    end

    options
  end
end

options = ArgParser.parse(ARGV)

if options[:help]
  file = File.open("../help.txt")
  puts file.read

elsif options[:quick]
  Menu.log_in
else
  Menu.display_menu
end
