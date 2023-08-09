class ReadGame
  def read_games_data
    return [] unless File.exist?('./data-files/games.json')

    json_data = JSON.parse(File.read('./data-files/games.json'))
    puts json_data
    json_data
  end
end
