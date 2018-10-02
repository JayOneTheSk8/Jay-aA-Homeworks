require 'byebug'

class Board
  attr_reader :name1, :name2
  attr_accessor :cups

  def self.make_cups
    all_cups = Array.new(14) { Array.new(4, :stone) }
    all_cups[6] = []
    all_cups[13] = []
    all_cups
  end

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, index|
      next if index == 6 || index == 13
      4.times do
        cup << :stone
      end
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless start_pos.between?(0, 13)
    raise 'Starting cup is empty' if self.cups[start_pos].empty?
    true
  end

  def make_move(start_pos, current_player_name)
    stones = self.cups[start_pos]
    self.cups[start_pos] = []
    cup = start_pos
    until stones.empty?
      cup += 1
      cup = 0 if cup > 13
      if cup == 6
        self.cups[6] << stones.pop if current_player_name == @name1
      elsif cup == 13
        self.cups[13] << stones.pop if current_player_name == @name2
      else
        self.cups[cup] << stones.pop
      end
    end
    render
    next_turn(cup)
  end

  def next_turn(ending_cup_idx)
    print "Ending Index: #{ending_cup_idx}"
    puts
    print self.cups
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    self.cups[ending_cup_idx].empty? ? :switch : ending_cup_idx
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
