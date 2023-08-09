require_relative '../classes/game_class'
require_relative '../item'

describe Game do
  context '#new' do
    it 'takes three parameters and returns a Game object' do
      last_played_date = (Date.today - (2 * 365))
      game = Game.new('Andrea', last_played_date)
      game.should be_an_instance_of Game
    end
  end
  describe '#can_be_archived?' do
    context 'when last_played_at is more than 2 years return true' do
      it 'returns true' do
        last_played_date = (Date.today - (4 * 365))
        game = Game.new('multiplayer', last_played_date)
        expect(game.can_be_archived?).to be true
      end
    end
      context 'when last_played_at is less than 2 years return true' do
      it 'returns true' do
        last_played_date = (Date.today - (1 * 365))
        game = Game.new('multiplayer', last_played_date)
        expect(game.can_be_archived?).to be false
      end
    end
end
end

