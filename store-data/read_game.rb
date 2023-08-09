
class ReadGame
  def read_games_data
  if File.exist?('./data-files/games.json')
    json_data = JSON.parse(File.read('./data-files/games.json'))
    puts json_data
    return json_data
  else
    return []
  end
end
end