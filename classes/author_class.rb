class Author
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

  def initialize(_id, first_name, last_name, _items)
    @id = Random.rand(1...100)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_author(self) unless item.author == (self)
  end
end