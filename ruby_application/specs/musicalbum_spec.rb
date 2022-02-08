require './classes/musicAlbum'

describe MusicAlbum do
    context 'Test the music album' do
        newalbum = MusicAlbum.new(true,'Albumname','10-10-2020')

        it 'newalbum title should be album name' do
            expect(newalbum.name).to eq 'Albumname'
        end
        
        it 'test if album is on spotify' do
            expect(newalbum.on_spotify).to eq true
        end
    end
end