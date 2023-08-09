require_relative '../store-data/read_game'
class ListGame
  def initialize
    @read_games_data = ReadGame.new
  end
  def list_games
    data = @read_games_data.read_games_data
    puts ':::::::::::'
    puts 'GAMES LIST'
    puts ':::::::::::'
    data.each { |game| puts " Multiplayer: #{game['multiplayer']}, Last played at: #{game['last_played_at']}" }
    puts ':::::::::::::::::::::::::::::::::::::::::::::::::'
  end
end