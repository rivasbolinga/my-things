require './item.rb'
require './music_album.rb'

RSpec.describe MusicAlbum do
  let(:publish_date) { Date.new(2023, 1, 1) }
  let(:archived) { false }
  let(:on_spotify) { false }

  subject(:music_album) { described_class.new(publish_date, archived: archived, on_spotify: on_spotify) }

  describe '#initialize' do
    it 'sets the publish date' do
      expect(music_album.publish_date).to eq(publish_date)
    end

    it 'sets the archived flag' do
      expect(music_album.archived).to eq(archived)
    end

    it 'sets the on_spotify flag' do
      expect(music_album.on_spotify).to eq(on_spotify)
    end
  end

  describe '#can_be_archived?' do
    context 'when the item can be archived' do
      let(:archived) { true }
      let(:on_spotify) { true }

      it 'returns true' do
        puts music_album.archived
        expect(music_album.send(:can_be_archived?)).to be true
      end
    end

    context 'when the item cannot be archived' do
      let(:archived) { false }
      let(:on_spotify) { true }

      it 'returns false' do
        expect(music_album.send(:can_be_archived?)).to be false
      end
    end
  end
end