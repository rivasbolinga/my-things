require './item.rb'

class MusicAlbum < Item
  attr_reader :on_spotify,  :archived

  def initialize(publish_date, archived: false, on_spotify: false)
    super(publish_date, archived:)
    @on_spotify = on_spotify
  end

  private
  def can_be_archived?
    @archived && @on_spotify ? true : false
  end

end
