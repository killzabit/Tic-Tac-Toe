# frozen_string_literal: true

require '../board.rb'

describe Board do
  describe '#winner?' do
    let(:token_x) { 'x' }

    context 'when 3 spaces in a winning combination are the same token' do
      subject(:winning_board) { described_class.new(%w[ x x x - - - - -]) }

      it 'Returns true' do
        expect(winning_board.winner?(token_x)).to be true
      end
    end

    context 'When there are no winning combinations' do
      subject(:winning_board) { described_class.new(%w[ - - - - - - - -]) }

      it 'returns nil' do
        expect(winning_board.winner?(token_x)).to be false
      end
    end
  end

  describe '#board_full?'do
    context 'When board is full' do
      subject(:full_board) { described_class.new(%w[ x x x x x x x x x]) }

      it 'Returns true' do
        expect(full_board.board_full?).to be true
      end
    end

    context 'When board is not full' do
      subject(:empty_board) { described_class.new(%w[ x - - - - - - - -]) }

      it 'Returns false' do
        expect(empty_board.board_full?).to be false
      end
    end
  end
end
