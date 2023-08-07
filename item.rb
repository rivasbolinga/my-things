require 'date'

class Item
  # attr_accessor :genre
  # attr_accessor :author
  # attr_accessor :source
  # attr_accessor :label
  attr_reader :publish_date

  attr_accessor :archived

  def initialize(id, publish_date: Date.today, archived: false)
    @id = id
    # @genre = Genre.new()
    # @author = Author.new()
    # @source = Source.new()
    # @label = Label.new()
    @publish_date = publish_date.strftime('%Y-%m-%d')
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    year, month, day = @publish_date.split('-').map(&:to_i)
    return true if (Date.today - Date.new(year, month, day)) / 365.25 > 10

    false
  end
end

item = Item.new(1, publish_date: Date.new(2013, 8, 6), archived: false)
# p item.genre
# p item.author
# p item.source
# p item.label

p item.publish_date
p item.archived
p item.move_to_archive
p item.archived
