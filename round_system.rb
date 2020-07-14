
module RoundSystem

  def round_vs(who)
    self.current_board = Board.new
    while self.rounds_played < self.rounds_to_play
      turn_start_message self.player1
      current_board.board_ref
      place_token self.player1
      self.current_board.table
      if self.current_board.winner?(self.player1.token) == true
        increment_rounds_played
        self.player1.round_win
        if self.rounds_played < self.rounds_to_play
          new_round who
          break
        else
          break
        end
      end
      if self.current_board.board_full? == true
        who.tie_message
        if self.rounds_played < self.rounds_to_play
          new_round who
          break
        else
          break
        end
      end
      turn_start_message who
      place_token who
      current_board.table
      if self.current_board.winner?(who.token) == true
        increment_rounds_played
        who.round_win
        if self.rounds_played < self.rounds_to_play
          new_round who
          break
        else
          break
        end
      end
      if current_board.board_full? == true
        who.tie_message
        if self.rounds_played < self.rounds_to_play
          new_round who
          break
        else
          break
        end
      end
    end
  end

  def turn_start_message(who)
    puts "#{who.name}'s turn.\n"
  end

  def new_round(who)
    puts "New round starting now!\n"
    increment_rounds_played
    sleep 1
    round_vs who
  end

  def increment_rounds_played
    self.rounds_played += 1
  end

  def place_token(who)
    position = who.get_position
    if current_board.board[position] != '-'
      puts "Invalid selection\n" if who != cpu
      place_token who
    else
      current_board.board[position] = who.token
    end
  end

  def ask_num_round
    puts "How many rounds do you want to play: \n"
    self.rounds_to_play = gets.chomp.to_i
    if rounds_to_play < 1
      ask_rounds_error
      puts
      ask_num_round
    end
  end

  def ask_rounds_error
    puts "Amount of rounds must be 1 or greater! \n"
  end
end
