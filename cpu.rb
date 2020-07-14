# frozen_string_literal: true

require './win_messages.rb'
# the computer player class. create token positions and places token.
class Cpu
  attr_accessor :token, :wins
  attr_reader :name

  include WinMessages

  def initialize
    @token, @wins, @name = token, 0, 'Cpu'
  end
  # you are redoing everything to be more OOP and new feature and this cpu class
  # no more control flow in the classes.

  def get_position
    rand(1...9)
  end
end
