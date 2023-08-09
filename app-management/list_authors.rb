class ListAuthors
  def initialize
    @authors = [
      'Stephen King', 'J.K. Rowling', 'Leo Tolstoy', 'Sally Rooney', 'Agatha Christie'
    ]
  end

  def list_authors
    puts ':::::::::::::'
    puts 'AUTHORS LIST'
    puts ':::::::::::::'
    @authors.each { |author| puts " Name: #{author}" }
    puts ':::::::::::::::::::::::::::::::::::::::::::::::::'
  end
end
