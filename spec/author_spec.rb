require_relative '../classes/author_class' 
require_relative '../item'
  
describe Author do
  before :each do
    @author= Author.new('Stephen', 'King')
    @item = Item.new
  end

  describe 'Create a new author' do
    it 'Expected our new author to be an instance of Author' do
      expect(@author).to be_an_instance_of Author
    end

    it 'fist name is equal to first name of Author' do
      expect(@author.first_name).to eq('Stephen')
    end

    it 'last name is equal to first name of Author' do
      expect(@author.last_name).to eq('King')
    end
  end

  describe 'add_item method test' do
    it 'should add new author item' do
      @author.add_item(@item)
      expect(@author.items).to eql([@item])
    end
  end
end
