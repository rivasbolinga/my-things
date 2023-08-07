require './book'
require './label'

class Create
  def new_book(lists)
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover State [Good/Bad]: '
    cover_state = gets.chomp
    print 'Publish Date[YYYY-MM-DD]: '
    publish_date = Date.parse(gets.chomp)
    print 'Label: '
    label_title = gets.chomp

    book = Book.new(publisher, cover_state, publish_date: publish_date)
    saved_label = lists[:labels_list].find { |label| label.title == label_title }
    unless saved_label
      colors = %w[Red Green Blue Yellow Orange Purple]
      saved_label = Label.new(label_title, colors.sample)
      lists[:labels_list] << saved_label
    end
    saved_label.add_item(book)
    puts 'Press Enter to continue!'
    lists[:books_list] << book
    lists
  end
end
