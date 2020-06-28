# frozen_string_literal: true

require './game.rb'
# This comment made the ruby police happy
class Player
  class <<self
    attr_accessor :token
  end

  def self.choose_token
    puts 'Choose x or o for a token: '
    self.token = gets.chomp

    if token != 'x' && token != 'o'
      puts 'please choose x or o!'
      choose_token
    end
  end

  def self.place_token
    board = Game.board

    puts 'pick place on the board to place your token'
    position = gets.chomp.to_i

    if board[position] != '-'
      puts 'There is already a token there, choose again!'
      place_token
    else
      Game.place_token(position, token)
    end
  end
end
