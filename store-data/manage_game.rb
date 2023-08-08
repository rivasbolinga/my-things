class ManageData

  def convert_game_to_hash(games)
   games_hash = games.map do |game|
        {
          multiplayer: game.multiplayer,
          last_played_at: game.last_played_at.to_s
        }
  end
  puts games_hash
end
end