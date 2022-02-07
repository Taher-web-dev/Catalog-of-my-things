class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id, :archived

  def initialize(id, publish_date, archived: true)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
    @genre.items << self
  end

  def add_author(author)
    @author = author
    @author.items << self
  end

  def add_source(source)
    @source = source
    @source.items << self
  end

  def add_label(label)
    @label = label
    @label.items << self
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    current_year = time.new.current_year
    publish_year = @publish_date.current_year
    current_year - publish_year >= 10
  end
end
