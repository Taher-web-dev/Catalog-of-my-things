require './item'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(id, publish_date, multiplayer, last_played_at, archived: true)
    super(id, publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived
    current_year = time.new.year
    last_played_time = current_year - @last_played_at.year
    super() && last_played_time > 2
  end
end
