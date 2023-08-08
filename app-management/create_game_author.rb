class CreateGame
  def initialize(game)
    @game = game
  end
   def create_game
    print 'Multiplayer:'
    multiplayer = gets.chomp
    print 'Publish Date[YYYY-MM-DD]: '
    publish_date = Date.parse(gets.chomp)
    print 'Lat time played[YYYY-MM-DD]'
    last_played_at = Date.parse(gets.chomp)
    new_game = Game.new(multiplayer, last_played_at, publish_date)
    new_game.push
    puts '🟢 Game created succesfully!! '
  end
end