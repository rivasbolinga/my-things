class Genre
  attr_reader :name

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item=(item)
    item.add_genre = self unless item.genre == self
    @items << item
  end

  def to_json(*args)
    {
      name: @name,
      item: @items
    }.to_json(*args)
  end

end
