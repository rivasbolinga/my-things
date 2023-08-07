class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    super
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    if super
      @last_played_at < (Date.today.year - 2)
    else
      false
    end
  end
end
