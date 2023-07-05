require_relative '../music'
require_relative '../genre'
require_relative '../item'

describe Genre do
  it('Should create new genre') do
    genre = Genre.new('Hip hop')
    expect(genre.name).to eq('Hip hop')
  end

  it('should take an instance of the Item class or subclass as an input') do
    music = MusicAlbum.new(true, '2023-07-05')
    item = Item.new('2023-07-04', archived: true)
    genre = Genre.new('R&B')
    genre.add_item(music)
    genre.add_item(item)
    expect(genre.name).to eq('R&B')
  end
end
