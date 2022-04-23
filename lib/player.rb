require 'json'
require 'terminal-table'

class Player
  attr_accessor :all_player_details, :username, :lifelines, :score, :prize_money, :score_board

  def initialize(all_player_details)
    @username = username
    @lifelines = lifelines
    @score = score
    @prize_money = prize_money
    @all_player_stats = all_player_stats
    @score_board = []
    end

  def update_prize_money(value, player)
  player.prize_money = value
  player.all_player_details[:prizemoney] = player.prize_money
  player.prize_money
end

def update_player_score(question_number, player)
  player.score = question_number
  player.all_player_details[:score] = player.score
  player.score
end

def update_life_lines(player)
  player.lifelines -= 1
  player.all_player_details[:lifelines] = player.lifelines
  puts "you have #{player.lifelines} life line remaining"
  player.lifelines
end

def update_score_board(player)
  player.score_board << player.all_player_details
  player.score_board
end

def load_scoreboard(player)
data = JSON.parse(File.read("../data/scoreboard.json"))
player.score_board = data.map do |player_detail|
  player_detail.transform_keys(&:to_sym)
end
 return player.score_board
end

def update_json_scoreboard(player)
  File.write("../data/scoreboard.json", player.score_board.to_json)
end 

def save_scoreboard(player)
load_scoreboard(player)
update_score_board(player)
update_json_scoreboard(player)
end

def display_scoreboard(player)
  scoreboard_table = player.score_board
  scoreboard_table = Terminal::Table.new :title => "Score Board".colorize(:green) do |t|
    t << ["Name".colorize(:green), "Score".colorize(:cyan), "Prize Money".colorize(:light_green), "Life Lines Used".colorize(:red)]
    scoreboard_table.each do |player|
      t.add_separator
      t.style = {:border => :ascii}
      t << [player[:name], player[:score], player[:prizemoney], player[:lifelines]]
    end
  end
  puts scoreboard_table
end

end
