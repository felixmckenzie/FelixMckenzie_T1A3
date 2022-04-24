require 'json'
require 'terminal-table'

class Player
  attr_accessor :player_stats, :username, :lifelines, :score, :prize_money, :score_board

  def initialize(player_stats)
    @username = username
    @lifelines = lifelines
    @score = score
    @prize_money = prize_money
    @player_stats = player_stats
    @score_board = []
  end

  def update_prize_money(value, player)
    player.prize_money = value
    player.player_stats[:prizemoney] = player.prize_money
    player.prize_money
  end

  def update_player_score(number, player)
    player.score = number
    player.player_stats[:score] = player.score
    player.score
  end

  def update_life_lines(player)
    player.lifelines -= 1
    player.player_stats[:lifelines] = player.lifelines
    puts "you have #{player.lifelines} life line remaining"
    player.lifelines
  end

  def update_score_board(player)
    player.score_board << player.player_stats
    player.score_board
  end

  def load_scoreboard(player)
    data = JSON.parse(File.read("../data/scoreboard.json"))
    player.score_board = data.map do |player_detail|
      player_detail.transform_keys(&:to_sym)
    end
    return player.score_board
  rescue Errno::ENOENT
    "File Not Found"
  end

  def update_json(player)
    File.write("../data/scoreboard.json", player.score_board.to_json)
  end

  def save_scoreboard(player)
    load_scoreboard(player)
    update_score_board(player)
    update_json(player)
  end

  def display_scoreboard(player)
    scoreboard_table = player.load_scoreboard(player)
    scoreboard_table = Terminal::Table.new :title => "Score Board".colorize(:green) do |t|
      t << ["Name".colorize(:green), "Score".colorize(:cyan), "Prize Money".colorize(:light_green),
            "Life Lines Used".colorize(:red)]
      scoreboard_table.each do |player|
        t.add_separator
        t.style = { :border => :ascii }
        t << [player[:name], player[:score], player[:prizemoney], player[:lifelines]]
      end
    end
    puts scoreboard_table
  end
end
