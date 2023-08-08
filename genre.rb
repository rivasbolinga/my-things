class Genre
  def initialize(name)
    @name = name
    @items = []
  end

  def add_item=(item)
    item.add_genre = self
    @items << item
  end
end
