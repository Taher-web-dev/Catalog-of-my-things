require_relative './all_authors'
class Author
  attr_accessor :first_name, :last_name
  attr_reader :items, :id
  ALL_AUTHORS = AllAuthors.new
  @@id = 0
  def initialize(first_name, last_name)
    @id = @@id
    @first_name = first_name
    @last_name = last_name
    @items = []
    @@id += 1
    ALL_AUTHORS.all_authors << self
  end

  def add_item(item)
    @items << item
  end
end
