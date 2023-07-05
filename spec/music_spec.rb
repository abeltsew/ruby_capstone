require_relative '../music'
require_relative '../item'

describe MusicAlbum do
  it('should create a music album') do
    music = MusicAlbum.new(true, '2023-07-05')

    expect(music.publish_date).to eq('2023-07-05')
  end

  it('should check archive status ') do
    music = MusicAlbum.new(true, '2023-07-04')
    expect(music.can_be_archived?).to eq(false)

    new_album = MusicAlbum.new(false, '2023-07-04')
    expect(new_album.can_be_archived?).to eq(false)

    Item.new('2023-07-04', archived: true)
    new_albu = MusicAlbum.new(true, '2023-07-04')
    expect(new_albu.can_be_archived?).to eq(false)
  end
end
