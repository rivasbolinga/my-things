require_relative '../classes/book'
require_relative '../classes/label'

class Open
  def books
    lists = {
      books_list: [],
      labels_list: []
    }

    return lists unless File.exist?('./data-files/books.json')

    list = JSON.parse(File.read('./data-files/books.json'))
    list.each do |detail|
      book = Book.new(detail[0], detail[1], publish_date: Date.parse(detail[2]))
      saved_label = lists[:labels_list].find { |label| label.title == detail[3] }
      unless saved_label
        saved_label = new_label(detail[3])
        lists[:labels_list] << saved_label
      end
      saved_label.add_item(book)
      lists[:books_list] << book
    end
    lists
  end

  def new_label(label)
    colors = %w[Red Green Blue Yellow Orange Purple]
    Label.new(label, colors.sample)
  end
end
