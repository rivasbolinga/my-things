require_relative '../classes/genre'

RSpec.describe Genre do
  let(:genre_name) { 'Action' }
  let(:item) { double('Item') }
  let(:genre) { Genre.new(genre_name) }

  describe '#initialize' do
    it 'creates a new genre with a name and an empty item list' do
      expect(genre.instance_variables).to include(:@name, :@items)
      expect(genre.instance_variable_get(:@name)).to eq(genre_name)
      expect(genre.instance_variable_get(:@items)).to be_empty
    end
  end

  describe '#add_item=' do
    it 'assigns the genre to the item and adds the item to the items list' do
      expect(item).to receive(:add_genre=).with(genre)
      genre.add_item = item
      expect(genre.instance_variable_get(:@items)).to include(item)
    end
  end
end
