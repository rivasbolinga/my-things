require_relative '../classes/game_class'

describe Game do
  context '#new' do
    it 'creates a new game' do
      game = Game.new('multiplayer', '2000-02-02')
      game.should be_an_instance_of Game
    end
  end
end