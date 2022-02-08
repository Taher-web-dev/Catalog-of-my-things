require 'date'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id, :archived

  @@id = 0

  def initialize(publish_date, archived: true)
    @id = @@id
    @publish_date = Date.strptime(publish_date, '%d-%m-%Y')
    @archived = archived
    @@id += 1
  end

  def add_genre(genre)
    @genre = genre
    @genre.add_items(self)
  end

  def add_author(author)
    @author = author
    @author.add_items(self)
  end

  def add_source(source)
    @source = source
    @source.add_items(self)
  end

  def add_label(label)
    @label = label
    @label.add_items(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    current_year = Time.new.year
    publish_year = @publish_date.year
    current_year - publish_year >= 10
  end
end
