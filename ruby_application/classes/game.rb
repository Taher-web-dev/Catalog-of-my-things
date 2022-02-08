require 'date'
require './item'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at, archived: true)
    super(publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = Date.strptime(last_played_at, '%d-%m-%Y')
  end

  private

  def can_be_archived?
    current_year = Time.new.year
    last_played_time = current_year - @last_played_at.year
    super() && last_played_time > 2
  end
end
