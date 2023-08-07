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
    @publish_date = publish_date
    @archived = archived
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  private

  def can_be_archived?
    Date.today - @publish_date >= 10 * 365.25
  end
end
