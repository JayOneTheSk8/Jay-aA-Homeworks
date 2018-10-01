class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play

  end

  def take_turn
    show_sequence
    require_sequence
    unless self.game_over
      round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    sequence_length.times do
      add_random_color
    end
    self.seq.each do |color|
      puts color
      sleep(1)
      system('clear')
    end
  end

  def require_sequence
    self.seq.each do |color|
      picked_color = gets.chomp
      if picked_color != color
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    random_color = COLORS.sample
    self.seq << random_color
    random_color
  end

  def round_success_message
    "Great job!"
  end

  def game_over_message

  end

  def reset_game

  end
end
