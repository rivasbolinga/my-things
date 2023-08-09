require 'json'

class StoreGame
  def store_game(games)
    existing_data = []

    begin
      if File.exist?('./data-files/games.json')
        existing_data = JSON.parse(File.read('./data-files/games.json'))
      end

      hashed_data = games.map do |game|
        {
          multiplayer: game.multiplayer,
          last_played_at: game.last_played_at.to_s
        }
      end

      combined_data = existing_data + hashed_data

      File.write('./data-files/games.json', JSON.pretty_generate(combined_data))

      puts '📝 Games data saved to games.json!'
    rescue StandardError => e
      puts "🚨 An error occurred while saving the games data: #{e.message}"
    end
  end
end

