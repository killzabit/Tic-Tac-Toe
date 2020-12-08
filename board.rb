# frozen_string_literal: true

# State of the board and other general commands
class Board
  attr_accessor :board

  def initialize(board = %w[- - - - - - - - -])
    @board = board
  end

  def board_ref
    board_ref = %w[0 1 2
                   3 4 5
                   6 7 8]

    puts 'Here is a reference of the board positions.'

    puts <<~HEREDOC
    
      *****************
      ( | #{board_ref[0]} | #{board_ref[1]} | #{board_ref[2]} | )
      ) | #{board_ref[3]} | #{board_ref[4]} | #{board_ref[5]} | ( 
      ( | #{board_ref[6]} | #{board_ref[7]} | #{board_ref[8]} | )
      *****************

    HEREDOC
  end

  def table
    puts <<~HEREDOC

      *****************
      ( | #{board[0]} | #{board[1]} | #{board[2]} | )
      ) | #{board[3]} | #{board[4]} | #{board[5]} | ( 
      ( | #{board[6]} | #{board[7]} | #{board[8]} | )
      *****************

    HEREDOC
  end

  def board_full?
    board.all? { |cell| cell != '-' }
  end

  def winner?(token)
    [
      [board[0], board[1], board[2]],
      [board[3], board[4], board[5]],
      [board[6], board[7], board[8]],
      [board[0], board[4], board[8]],
      [board[6], board[4], board[2]],
      [board[0], board[3], board[6]],
      [board[1], board[4], board[7]],
      [board[2], board[5], board[8]]
    ].each do |set|
      return true if set.all? { |cell| cell == token }
    end
  end
end
