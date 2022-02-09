require './classes/book'

describe Book do
  context 'Test Book class' do
    newbook = Book.new('All prints', '10-10-2021', 'very good')

    it 'newbook should be an instance of book' do
      expect(newbook).to be_an_instance_of Book
    end

    it 'book publisher should retuen All prints' do
      expect(newbook.publisher).to eq 'All prints'
    end

    it 'book cover state should return very good' do
      expect(newbook.cover_state).to eq 'very good'
    end

    it 'should return false unless @archived or cover_state == bad' do
      expect(newbook.can_be_archived?).to eq false
    end
  end
end
