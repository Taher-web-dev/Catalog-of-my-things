require './classes/label'
require './classes/item'

describe Label do
  context 'Test the label class' do
    newlabel = Label.new('test label', 'black')
    newitem = Item.new('2-2-2022')

    it 'test the label title' do
      expect(newlabel.title).to eq 'test label'
    end

    it 'test the label color' do
      expect(newlabel.color).to eq 'black'
    end

    it 'newlabel should be an instance of class' do
      expect(newlabel).to be_an_instance_of Label
    end

    it 'test adding an item' do
      newlabel.add_item(newitem)
      expect(newlabel.items.size).to eq(1)
    end
  end
end
