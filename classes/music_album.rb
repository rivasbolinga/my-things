require_relative '../item'

class MusicAlbum < Item
  attr_reader :on_spotify, :archived

  def initialize(archived: false, on_spotify: false)
    super(archived: archived)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    @archived && @on_spotify ? true : false
  end
end
