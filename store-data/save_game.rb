require 'json'

class StoreGame
  def store_game(hashed_data)
    begin
      json_data = hashed_data.map do |game|
        {
          multiplayer: game[:multiplayer],
          last_played_at: game[:last_played_at]
        }
      end

      File.open('./data-files/games.json', 'w') do |file|
        file.write(JSON.pretty_generate(json_data))
      end

      puts '📝 Games data saved to games.json!'
    rescue StandardError => e
      puts "🚨 An error occurred while saving the games data: #{e.message}"
    end
  end
end





