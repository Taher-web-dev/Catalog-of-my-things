require './ruby_application/classes/author'
require './ruby_application/classes/item'
describe Author do
  item = Item.new('15-01-2015', archived: false)
  author = Author.new('Michael','Nakhla')
  it 'Add item when call add_item method' do
    author.add_item(item)
    expect(author.items).to contain_exactly(item)
  end
end