require_relative '../classes/game_class'
require_relative '../store-data/manage_game'
require_relative '../store-data/save_game'
require 'date'

class CreateGame
  def initialize
    @games = []
    @data_manager = ManageData.new
    @data_storage = StoreGame.new
  end

  def create_game
    print 'Multiplayer: '
    multiplayer = gets.chomp
    last_played_at = nil

    loop do
      print 'Last time played [YYYY-MM-DD]: '
      last_played_at_input = gets.chomp
      last_played_at = parse_date_input(last_played_at_input)
      break if last_played_at
    end

    new_game = Game.new(multiplayer, last_played_at)
    @games.push(new_game)
    puts '🟢 Game created successfully!!'
    hashed = @data_manager.convert_game_to_hash(@games)
    stored = @data_storage.store_game(hashed)
     #list
     #store
    
    
  end

  def parse_date_input(date_input)
    Date.parse(date_input)
  rescue ArgumentError
    puts '🔴 Invalid date format. Please use YYYY-MM-DD.'
    nil
  end
end
