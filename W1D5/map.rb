class Map
  attr_reader :pairs

  def initialize
    @pairs = []
  end

  def include_key?(key)
    self.pairs.any? { |pair| pair.first == key }
  end

  def set(key, value)
    if include_key?(key)
      pair_location = self.pairs.index { |pair| pair.first == key }
      self.pairs.delete_at(pair_location)
      self.pairs.insert(pair_location, [key, value])
    else
      self.pairs << [key, value]
    end
  end

  def get(key)
    return nil unless include_key?(key)
    correct_pair = self.pairs.select { |pair| pair.first == key }
    correct_pair[0].last
  end

  def delete(key)
    return nil unless include_key?(key)
    pair_location = self.pairs.index { |pair| pair.first == key }
    self.pairs.delete_at(pair_location)
  end

  def show
    copy(self.pairs)
  end

  private
  def copy(pairs)
    pairs.map { |el| el.is_a?(Array) ? copy(el) : el }
  end

end

# m = Map.new
#
# p m.pairs == []
# p m.set(:a, 1) == [[:a, 1]]
# p m.set(:b, 2) == [[:a, 1], [:b, 2]]
# p m.set(:b, 3) == [[:a, 1], [:b, 3]]
# p m.set(:a, "A") == [[:a, "A"], [:b, 3]]
# p m.include_key?(:a) == true
# p m.include_key?("A") == false
# p m.get(:c) == nil
# p m.get(:a) == "A"
# p m.delete(:a) == [:a, "A"]
# p m.delete(:a) == nil
# p m.show == [[:b, 3]]
