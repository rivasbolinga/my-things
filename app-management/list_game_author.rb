require_relative '../store-data/read_game_author'

class ListData
  def initialize
    @game_data_storage = ReadData.new('./data-files/games.json')
    @author_data_storage = ReadData.new('./data-files/authors.json')
  end

  def list_games
    games = @game_data_storage.read_data
    if games.empty?
      puts '🚨 No games found!'
    else
      puts '------------------'
      puts '🎮 LIST OF GAMES'
      puts '------------------'
      games.each_with_index do |game, index|
        puts "#{index + 1} - Multiplayer: #{game['multiplayer']}, " \
             "Last time played: #{game['last_played_at']}, " \
             "Published: #{game['publish_date']}"
      end
      puts '---------------------------------------------------------'
    end
  end

  def list_authors
    authors = @author_data_storage.read_data
    if authors.empty?
      puts '🚨 No authors found!'
    else
      puts '-------------------'
      puts '🖌️  LIST OF AUTHORS'
      puts '-------------------'
      authors.each_with_index do |author, index|
        items_list = author['items'].join(', ')
        puts "#{index + 1} - Name: #{author['author_name']}, " \
             "Last Name: #{author['author_last_name']}, " \
             "Items: #{items_list}."
      end
      puts '---------------------------------------------'

    end
  end
end
