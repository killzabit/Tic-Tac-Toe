# frozen_string_literal: true

require_relative './win_messages.rb'

# This class is for the humans
class Player
  attr_accessor :token, :name, :wins

  include WinMessages

  def initialize(name = 'human')
    @name, @token, @wins = name, token, 0
  end

  def choose_token
    puts 'Please choose x or o for a token: '
    @token = verify_token gets.chomp
  end

  def verify_token(token)
    return token if token == 'x' || token == 'o'
    choose_token
  end

  def get_position
    puts 'Pick a place on the board to place your token: '
    gets.chomp.to_i
  end
end
