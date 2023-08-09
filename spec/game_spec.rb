require_relative '../classes/game_class'
require_relative '../item'

describe Game do
  let(:date) { Date.new(2023, 1, 1) }

  describe '#can_be_archived?' do
    context 'when last_played_at is more than 2 years ago and publish_date is more than 10 years ago' do
      it 'returns true' do
        last_played_date = Date.new(2020, 1, 1)
        published_date = Date.new(1990, 1, 1)
        game = Game.new('multiplayer', last_played_date)
        puts game

        expect(game.can_be_archived?).to be true
      end
    end

    # context 'when last_played_at is more than 2 years ago and publish_date is less than 10 years ago' do
    #   it 'returns false' do
    #     game = Game.new('multiplayer', Date.today - 2 * 365, publish_date: Date.today - 5 * 365)
    #     expect(game.can_be_archived?).to be false
    #   end
    # end

    # context 'when last_played_at is less than 2 years ago and publish_date is more than 10 years ago' do
    #   it 'returns false' do
    #     game = Game.new('multiplayer', Date.today - 365, publish_date: Date.today - 11 * 365)
    #     expect(game.can_be_archived?).to be false
    #   end
    # end

    # context 'when last_played_at is less than 2 years ago and publish_date is less than 10 years ago' do
    #   it 'returns false' do
    #     game = Game.new('multiplayer', Date.today - 365, publish_date: Date.today - 5 * 365)
    #     expect(game.can_be_archived?).to be false
    #   end
    # end
  end
end
