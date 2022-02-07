class Author
  attr_accessor :first_name, :last_name
  attr_reader :items, :id

  @@id = 0
  def initialize(first_name, last_name)
    @id = @@id
    @first_name = first_name
    @last_namre = last_name
    @items = []
    @@id += 1
  end

  def add_item(item)
    @items << item
  end
end
