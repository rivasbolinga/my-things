require './item.rb'

class Genre

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item=(item)
    item.genre = self
    @items << item unless @items.include?(item)
  end

end