require 'date'

class Item
  attr_accessor :author, :source, :label
  attr_reader :genre, :publish_date

  def initialize(publish_date: Date.today, archived: false)
    @id = rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.Items.include?(self)
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
