# frozen_string_literal: true

require '../lib/player.rb'
require_relative '../lib/win_messages.rb'

describe Player do
  describe '#choose_token' do
    context 'When player chooses a valid token choice' do
      subject(:valid_token_player) { described_class.new('player') }
      let(:token_x) { 'x' }

      before do
        allow(valid_token_player).to receive(:puts).once
        allow(valid_token_player).to receive(:gets).and_return(token_x)
        allow(valid_token_player).to receive(:verify_token).with(token_x).and_return(token_x)
      end

      it 'Updates the value of @token' do
        expect { valid_token_player.choose_token }.to change { valid_token_player.token }.to token_x
      end
    end
  end

  context 'When a player chooses an invalid token choice once' do
    subject(:invalid_token_player) { described_class.new('player') }
    let(:token_t) { 't' }
    let(:token_x) { 'x' }

    before do
      allow(invalid_token_player).to receive(:puts).twice
      allow(invalid_token_player).to receive(:gets).and_return(token_t, token_x)
      allow(invalid_token_player).to receive(:verify_token).twice
      allow(invalid_token_player).to receive(:verify_token).and_return(token_x)
    end

    it 'gets called by #verify_token' do
      expect(invalid_token_player).to receive(:choose_token).once
      invalid_token_player.choose_token
    end

    it 'calls #verify_token twice' do
      expect(invalid_token_player).to receive(:verify_token).twice
      2.times { invalid_token_player.choose_token }
    end

    it 'updates the value of @token to the correct choice' do
      expect { invalid_token_player.choose_token }.to change { invalid_token_player.token }.to token_x
      1.times { invalid_token_player.choose_token }
    end
  end
end
