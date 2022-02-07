require './ruby_application/classes/item'
require './ruby_application/classes/genre'
require './ruby_application/classes/author'
describe Item do
  item = Item.new('15-12-2010', archived: false)
  it 'Add genre when use add_genre' do
    genre = Genre.new('action')
    item.add_genre(genre)
    expect(genre.items).to contain_exactly(item)
  end
  it 'Add author when use add_author' do
    author = Author.new('Michael', 'Nakhla')
    item.add_author(author)
    expect(author.items).to contain_exactly(item)
  end
  it 'move item to archive when its publish date is older than 10 years using move_to_archive method' do
    item.move_to_archive
    expect(item.archived).to be true
  end

  it "Doesn't move item to archive when its publish date is younger than 10 years " do
    young_item = Item.new('01-01-2020', archived: false)
    young_item.move_to_archive
    expect(young_item.archived).to be false
  end
end
