# frozen_string_literal: true

# Holds the win message and win_increment method
module WinMessages
  def win_message
    puts "#{name} won with #{wins} winning games!"
  end

  def round_win
    puts "#{name} wins this round!\n"
    win_increment
  end

  def tie_message
    puts "It's a tie!"
  end

  private

  def win_increment
    self.wins += 1
  end
end
