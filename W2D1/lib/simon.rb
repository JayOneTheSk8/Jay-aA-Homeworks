require 'byebug'
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    system('clear')
    until self.game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless self.game_over
      round_success_message
      self.sequence_length += 1
    end
    system('clear')
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
    puts "Great job!"
    sleep(1.5)
  end

  def game_over_message
    puts "Sorry! You Lose :("
  end

  def reset_game
    initialize if self.game_over
    puts "Would you like to play again? (Y/N)"
    input = gets.chomp.downcase
    unless input == "y" || input == "n"
      puts "\'Y\' or \'N\' please!"
      reset_game
    end
    if input == "y"
      play
    elsif input == "n"
      "Exiting Game..."
    end
  end
end
