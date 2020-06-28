# frozen_string_literal: true

require './game.rb'
# the computer player class. create token positions and places token.
class Cpu
  class <<self
    attr_accessor :token
  end

  def self.place_token
    index = Cpu.rand_index
    board = Game.board
    if board[index] == '-'
      Game.place_token(index, Cpu.token)
    elsif board.all? { |cells| cells != '-' }
      puts 'No space left for Cpu token!'
    else
      Cpu.place_token
    end
  end

  def self.rand_index
    board = Game.board
    rand(board.length)
  end
end
