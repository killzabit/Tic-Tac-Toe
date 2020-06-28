# frozen_string_literal: true

require './game.rb'
require './player.rb'
require './cpu.rb'

puts
board = Game.board
Game.board_ref
puts

Player.choose_token
puts

Player.token == 'x' ? Cpu.token = 'o' : Cpu.token = 'x'
puts "Cpu is #{Cpu.token}."
puts
Game.table

winner_delared = false

until winner_delared == true
  puts
  Player.place_token
  Game.table
  puts

  winner_delared = Game.winner?(Player.token, Cpu.token)

  break if winner_delared == true

  if board.all? { |cells| cells != '-' }
    puts 'No spaces left to place tokens! Tie!'
    break
  end

  puts 'Cpu places a token!'
  puts
  Cpu.place_token
  Game.table

  winner_delared = Game.winner?(Player.token, Cpu.token)

  if board.all? { |cells| cells != '-' }
    puts 'No spaces left to place tokens! Tie!'
    break
  end
end
