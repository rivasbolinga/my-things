require_relative '../classes/book'
require_relative '../classes/label'

class Open
  def books
    lists = {
      books_list: [],
      labels_list: []
    }

    return lists unless File.exist?('books.json')

    list = JSON.parse(File.read('books.json'))
    list.each do |detail|
      book = Book.new(detail[0], detail[1], publish_date: Date.parse(detail[2]))
      saved_label = lists[:labels_list].find { |label| label.title == detail[3] }
      unless saved_label
        colors = %w[Red Green Blue Yellow Orange Purple]
        saved_label = Label.new(detail[3], colors.sample)
        lists[:labels_list] << saved_label
      end
      saved_label.add_item(book)
      lists[:books_list] << book
    end
    lists
  end
end
