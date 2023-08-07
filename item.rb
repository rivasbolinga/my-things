require 'date'

class Item
  attr_reader :genre, :author, :source, :label, :publish_date

  def initialize(publish_date, archived: false)
    # @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.Items.include?(self)
  end

  def author=(author)
    @author = author
  end

  def source=(source)
    @source = source
  end

  def label=(label)
    @label = label
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
