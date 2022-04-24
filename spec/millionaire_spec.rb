require_relative '../lib/gameplay.rb'
require_relative '../lib/quiz.rb'
require_relative '../lib/player.rb'
# require_relative '../lib/menu.rb'

describe Questions do
  it 'creates an instance of Quiz' do
    new_quiz = Questions.new
    expect(new_quiz).to be_kind_of(Questions)
  end
end

describe Player do
  it 'creates an instance of Player' do
    username = "John"
    new_player = Player.new(username)
    expect(new_player).to be_kind_of(Player)
  end
  
  it 'should get the players lifelines' do
    username = "John"
    new_player = Player.new(username)
    new_player.lifelines = 2
    expect(new_player.lifelines).to eq(2)
  end
end

describe Gameplay do
  it 'creates an instance of Gameplay' do
    new_quiz = Questions.new
    new_player = Player.new("Felix")
    game = Gameplay.new(new_quiz, new_player)
    expect(game).to be_kind_of(Gameplay)
  end

  it 'populates an array of hashes from a json file' do
    new_quiz = Questions.new
    new_player = Player.new("Felix")
    game = Gameplay.new(new_quiz, new_player)
    quiz = Gameplay.get_data
    expect(quiz.empty?).to eq(false)
  end

  it 'quiz returns a prompt for a question' do
    new_quiz = Questions.new
    new_player = Player.new("Felix")
    game = Gameplay.new(new_quiz, new_player)
    quiz = Gameplay.get_data
    expect(quiz[0].prompt).to eq("Who Is The Developer Of Ruby?")
  end

  it 'quiz returns an array of options' do
    new_quiz = Questions.new
    new_player = Player.new("Felix")
    game = Gameplay.new(new_quiz, new_player)
    quiz = Gameplay.get_data
    expect(quiz[1].options.class).to eq(Array)
  end

  it 'quiz returns an answer to a question' do
    new_quiz = Questions.new
    new_player = Player.new("Felix")
    game = Gameplay.new(new_quiz, new_player)
    quiz = Gameplay.get_data
    expect(quiz[2].answer).to eq("method")
  end
end
