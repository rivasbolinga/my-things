require 'json'

class Save
  def books(list)
    File.open('books.json', 'w', &:write) if list.empty?
    data = []
    list.each do |book|
      data << [book.publisher, book.cover_state, book.publish_date, book.label.title]
    end
    File.write('books.json', JSON.generate(data))
  end
end
