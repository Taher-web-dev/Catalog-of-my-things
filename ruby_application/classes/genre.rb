class Genre
  attr_reader :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
