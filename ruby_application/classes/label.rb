class Label
  attr_accessor :title, :color
  attr_reader :items

  def initialize(title, color)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(new_item)
    @item << new_item
    new_item.label = self
  end
end
