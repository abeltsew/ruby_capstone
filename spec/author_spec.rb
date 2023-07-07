require_relative '../author'
require_relative '../game'

describe Author do
  context 'Tests for Author class' do
    let(:author) { Author.new('Ubda', 'Dev') }
    let(:game) { Game.new('23-03-2020', '02-07-1989', multiplayer: true) }

    it 'Should create new author' do
      expect(author).to be_an_instance_of(Author)
    end

    it 'Should add item to its item array' do
      author.add_item(game)
      expect(author.items).to include(game)
    end
  end
end
