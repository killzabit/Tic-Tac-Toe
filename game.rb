# frozen_string_literal: true

# Stores the board and checks for wins as well as places game tokens
class Game
  @board = %w[- - -
              - - -
              - - -]

  attr_reader :board

  def self.board
    @board
  end

  def self.place_token(position, token)
    @board[position] = token
  end

  def self.board_ref
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

  def self.table
    puts <<~HEREDOC
      *****************
      ( | #{@board[0]} | #{@board[1]} | #{@board[2]} | )
      ) | #{@board[3]} | #{@board[4]} | #{@board[5]} | ( 
      ( | #{@board[6]} | #{@board[7]} | #{@board[8]} | )
      *****************
    HEREDOC
  end

  def self.winner?(h_token, cpu_token)
    winning_combos = [
      [@board[0], @board[1], @board[2]],
      [@board[3], @board[4], @board[5]],
      [@board[6], @board[7], @board[8]],
      [@board[0], @board[4], @board[8]],
      [@board[6], @board[4], @board[2]],
      [@board[0], @board[3], @board[6]],
      [@board[1], @board[4], @board[7]],
      [@board[2], @board[5], @board[8]]
    ]

    winning_combos.each do |set|
      if set.all? { |item| item == h_token }
        puts 'Great job you win!'
        return true
      elsif set.all? { |item| item == cpu_token }
        puts 'The Cpu beat you down!'
        return true
      else
        false
      end
    end
  end
end
