require './item'
require './music_album'

RSpec.describe MusicAlbum do
  describe '#initialize' do
    context 'when creating a new music album' do
      let(:archived) { true }
      let(:on_spotify) { true }

      it 'sets the archived and on_spotify attributes' do
        music_album = described_class.new(archived: archived, on_spotify: on_spotify)

        expect(music_album.archived).to eq(archived)
        expect(music_album.on_spotify).to eq(on_spotify)
      end
    end
  end

  describe '#can_be_archived?' do
    context 'when the music album is archived and on Spotify' do
      let(:archived) { true }
      let(:on_spotify) { true }
      subject(:music_album) { described_class.new(archived: archived, on_spotify: on_spotify) }

      it 'returns true' do
        expect(music_album.send(:can_be_archived?)).to be true
      end
    end

    context 'when the music album is not archived' do
      let(:archived) { false }
      let(:on_spotify) { true }
      subject(:music_album) { described_class.new(archived: archived, on_spotify: on_spotify) }

      it 'returns false' do
        expect(music_album.send(:can_be_archived?)).to be false
      end
    end

    context 'when the music album is not on Spotify' do
      let(:archived) { true }
      let(:on_spotify) { false }
      subject(:music_album) { described_class.new(archived: archived, on_spotify: on_spotify) }

      it 'returns false' do
        expect(music_album.send(:can_be_archived?)).to be false
      end
    end
  end
end