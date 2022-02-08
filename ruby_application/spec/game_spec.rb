require './classes/game'
describe Game do
  it 'Archive game when it is older than 10 year and its last played has more than 2 years' do
    game1 = Game.new('01-01-2009', 'multiplayer', '01-05-2018', archived: false)
    game1.move_to_archive
    expect(game1.archived).to be true
  end
  it "Doesn't archive game if it is last played in less than 2 years , even if it is older than 10 years" do
    game2 = Game.new('01-01-2009', 'multiplayer', '01-01-2022', archived: false)
    game2.move_to_archive
    expect(game2.archived).to be false
  end
end
