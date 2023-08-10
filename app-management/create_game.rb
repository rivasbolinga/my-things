require_relative '../classes/game_class'
require_relative '../classes/author_class'
require_relative '../store-data/save_game_author'
require 'date'

class CreateGame
  def initialize
    @game_data_storage = StoreData.new('./data-files/games.json')
    @author_data_storage = StoreData.new('./data-files/authors.json')
    reset_arrays
  end

  def reset_arrays
    @games = []
    @authors = []
  end

  def create_game
    create_game_data
    create_author_data
    store_data(@game_data_storage, @games)
    store_data(@author_data_storage, @authors)
  end

  private

  def create_game_data
    multiplayer = input_value('Multiplayer')
    last_played_at = parse_date_input(input_value('Last time played [YYYY-MM-DD]'))
    publish_date = parse_date_input(input_value('Publish date [YYYY-MM-DD]'))

    new_game = {
      multiplayer: multiplayer,
      last_played_at: last_played_at.to_s,
      publish_date: publish_date.to_s
    }
    @games.push(new_game)
    puts '🟢 Game created successfully!'
  end

  def create_author_data
    author_name = input_value('Author Name')
    author_last_name = input_value('Author Last Name')
    number_items = input_value('How many items has?').to_i
    items = []
    number_items.times do |i|
      item_name = input_value("Enter item ##{i + 1} name")
      items << item_name
    end

    new_author = {
      author_name: author_name,
      author_last_name: author_last_name,
      items: items
    }
    @authors.push(new_author)
    puts '🟢 Author created successfully!'
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
