require_relative '../classes/label'

describe Label do
  context '#new' do
    it 'takes two parameters and returns a Label object' do
      label = Label.new('Gift', 'Red')
      label.should be_an_instance_of Label
    end
  end

  context 'test add_item method' do
    it 'adds book to label' do
      book = Book.new('Pub', 'Good', publish_date: Date.new(2012, 8, 7))
      label = Label.new('Gift', 'Red')
      label.add_item(book)
      expect(book.label.title).to be == 'Gift'
    end
  end
end
