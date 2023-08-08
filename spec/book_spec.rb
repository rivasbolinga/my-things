require_relative '../classes/book.rb'

describe Book do
  context '#new' do
    it 'takes three parameters and returns a Book object' do
      book = Book.new('Pub', 'Good', publish_date: Date.new(2023, 8, 7))
      book.should be_an_instance_of Book
    end
  end

  context 'test can_be_archived? method' do
    it 'returns true when publish date is older than 10 years' do
      book = Book.new('Pub', 'Good', publish_date: Date.new(2012, 8, 7))
      expect(book.send(:can_be_archived?)).to be true
    end

    it 'returns true when cover state is bad' do
      book = Book.new('Pub', 'Bad', publish_date: Date.new(2023, 8, 7))
      expect(book.send(:can_be_archived?)).to be true
    end

    it 'returns false when neither cover state is bad nor publish date is older than 10 years' do
      book = Book.new('Pub', 'Good', publish_date: Date.new(2023, 8, 7))
      expect(book.send(:can_be_archived?)).to be false
    end
  end
end
