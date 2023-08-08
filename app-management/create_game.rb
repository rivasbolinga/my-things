require_relative '../classes/game_class'
class CreateGame
  def initialize
    @games = []
  end
   def create_game
   print 'Multiplayer:'
    multiplayer = gets.chomp
    # print 'Publish Date[YYYY-MM-DD]: '
    # publish_date_input = gets.chomp
    # publish_date = parse_date_input(publish_date_input)
    print 'Last time played[YYYY-MM-DD]: '
    last_played_at_input = gets.chomp
    last_played_at = parse_date_input(last_played_at_input)
    new_game = Game.new(multiplayer, last_played_at, )
    @games.push(new_game)
    puts '🟢 Game created succesfully!!'
  end

  def parse_date_input(date_input)
    Date.parse(date_input)
  rescue ArgumentError
    puts '🔴 Invalid date format. Please use YYYY-MM-DD.'
    retry
  end
end