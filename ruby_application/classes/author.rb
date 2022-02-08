class Author
  attr_accessor :first_name, :last_name
  attr_reader :items, :id

  @@id = 0
  def initialize(first_name, last_name)
    @id = ID
    @first_name = first_name
    @last_name = last_name
    @items = []
    @@id += 1
  end

  def add_items(item)
    @items << item
  end
end
