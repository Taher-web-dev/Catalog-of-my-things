require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state
  ALL_BOOKS = []
  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    ALL_BOOKS << self
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
