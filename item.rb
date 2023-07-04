require 'date'

class Item
  attr_reader :id, :archived, :publish_date
  attr_accessor :label, :author

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
    @label = nil
  end

  def can_be_archived?
    Time.now.year - Date.parse(@publish_date).year > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
