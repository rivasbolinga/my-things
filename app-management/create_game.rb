require_relative '../classes/game_class'
require_relative '../classes/author_class'
require_relative '../store-data/save_game'
require_relative '../store-data/save_author'
require 'date'

class CreateGame
  def initialize
    @games = []
    @authors = []
    @game_data_storage = StoreData.new('./data-files/games.json')
    @author_data_storage = StoreData.new('./data-files/authors.json')
  end

  def create_game
    multiplayer = input_value('Multiplayer')
    last_played_at = parse_date_input(input_value('Last time played [YYYY-MM-DD]'))
    author_name = input_value('Author Name')
    author_last_name = input_value('Author Last Name')

    new_game = Game.new(multiplayer, last_played_at)
    @games.push(new_game)
    puts '🟢 Game created successfully!'

    new_author = Author.new(author_name, author_last_name)
    @authors.push(new_author)
    puts '🟢 Author created successfully!'

    store_data(@game_data_storage, @games)
    store_data(@author_data_storage, @authors)
  end

  def input_value(prompt)
    print "#{prompt}: "
    gets.chomp
  end

  def parse_date_input(date_input)
    Date.parse(date_input)
  rescue ArgumentError
    puts '🔴 Invalid date format. Please use YYYY-MM-DD.'
    nil
  end

  def store_data(storage, data)
    storage.store(data)
  end
end
