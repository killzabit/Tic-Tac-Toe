# frozen_string_literal: true

require './win_messages.rb'

# This class is for the humans
class Player
  attr_accessor :token, :name, :wins

  include WinMessages

  def initialize(name = 'human')
    @name, @token, @wins = name, token, 0
  end

  def choose_token
    puts 'Choose x or o for a token: '
    self.token = gets.chomp
    puts
    if self.token != 'x' && self.token != 'o'
      puts "please choose x or o!\n"
      choose_token
    end
  end

  def get_position
    puts 'Pick a place on the board to place your token: '
    gets.chomp.to_i
  end
end
