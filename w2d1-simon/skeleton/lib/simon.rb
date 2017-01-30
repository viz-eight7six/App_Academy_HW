class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false

  end

  def play

    until @game_over
      take_turn
    end

    puts game_over_message
    reset_game


  end

  def take_turn
    self.show_sequence

    self.require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    @seq.dup
    add_random_color
  end

  def require_sequence
    puts "please enter the sequence"
    player_seq = gets.chomp.split(' ')
    if player_seq != seq
      @game_over = true
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    "good job!"
  end

  def game_over_message
    "wrong GG! better luck next time!"
  end

  def reset_game
    @game_over = false
    @seq = []
    @sequence_length = 1

  end
end
