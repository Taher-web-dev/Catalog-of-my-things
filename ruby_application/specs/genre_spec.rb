require './classes/genre'
require './classes/item'


describe Genre do
    context 'Test the Genre Class' do
      newgenre = Genre.new('classical')
      newitem = Item.new('5-5-2006')    

      it 'test genre name' do
      expect(newgenre.name).to eq 'classical'
    end


    it 'test add new item' do
        newgenre.add_item(newitem)
        expect(newgenre.items.size).to eq(1)
    end
end
end