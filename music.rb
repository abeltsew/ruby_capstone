require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(spotify, publish_date)
    super(publish_date)
    @on_spotify = spotify
  end

  def can_be_archived?
    super && on_spotify == true
  end
end
