require_relative '../game'

describe Game do
  context 'Tests for Game class' do
    let(:game) { Game.new('23-03-2020', '02-07-1989', multiplayer: true) }

    it 'Should create new game' do
      expect(game).to be_an_instance_of(Game)
    end

    it 'Can_be_archived method should return correct value' do
      archived = game.can_be_archived?
      expect(archived).to eq true
    end
  end
end
