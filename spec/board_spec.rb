# frozen_string_literal: true

require '../board.rb'

describe Board do
  describe '#winner?' do
    let(:token_x) { 'x' }

    context 'when 3 spaces in a winning combination are the same token' do
      subject(:winning_board) { instance_double(Board, board: %w[ - - - - - - - -]) }

      it 'returns true' do
        expect(winning_board.winner?(token_x)).to be_true
      end
    end
  end
end
