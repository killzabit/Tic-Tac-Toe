# frozen_string_literal: true

require_relative './player.rb'
require_relative './cpu.rb'
require_relative './board.rb'
require_relative './round_system.rb'

# Places game tokens and runs the game, checks for wins etc.
class Game
  attr_accessor :rounds_to_play, :player1, :player2, :cpu, :current_board, :rounds_played, :num_players

  include RoundSystem

  def initialize
    @rounds_to_play = 0
    @rounds_played = 0
    @num_players = 1
  end

  def start_game
    puts "Hello, and welome to Tic-Tac-Toe!\n"
    amt_players
    puts
    if num_players == '1'
      self.player1 = player_creator
      self.cpu = Cpu.new
      get_tokens cpu
      ask_num_round
      round_vs cpu
      compare_wins cpu
    else
      self.player1 = player_creator
      self.player2 = player_creator
      get_tokens player2
      ask_num_round
      round_vs player2
      compare_wins player2
    end
  end

  def compare_wins(who)
    if player1.wins > who.wins
      player1.win_message
    elsif  player1.wins == who.wins
      who.tie_message
    else
      who.win_message
    end
  end

  def amt_players
    amt_players_message
    self.num_players = gets.chomp
    unless num_players == '1' || num_players == '2'
      puts "Please enter 1 or 2\n"
      amt_players
    end
  end

  def amt_players_message
    puts "Is this a one player or two players game?:\n"
    puts "Please enter 1 or 2\n"
  end

  def player_creator
    puts "Please enter the players name:\n"
    name = gets.chomp
    puts
    Player.new name
  end

  def get_tokens(who)
    player1.choose_token

    if player1.token == 'x'
      who.token = 'o'
    else
      who.token = 'x'
    end
  end
end
