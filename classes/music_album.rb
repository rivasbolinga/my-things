require_relative '../item'

class MusicAlbum < Item
  attr_reader :on_spotify, :archived

  def initialize(archived: false, on_spotify: false, publish_date: Date.today)
    super(archived: archived, publish_date: publish_date)
    @on_spotify = on_spotify
  end

  def to_json(*args)
    {
      genre: @genre,
      author: @author,
      source: @source,
      publish_date: @publish_date,
      archived: @archived,
      on_spotify: @on_spotify
    }.to_json(*args)
  end

  private

  def can_be_archived?
    @archived && @on_spotify ? true : false
  end
end
