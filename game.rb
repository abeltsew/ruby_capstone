require_relative "item.rb"

class Game < Item
  attr_accessor :multiplayer, :last_played_at
  
  def initialize (multiplayer = false, last_played_at, publish_date)
    super(publish_date = publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?()
    is_expired = Time.now.year - Date.parse(@last_played_at).year > 2
    super and is_expired ? true : false
  end

end