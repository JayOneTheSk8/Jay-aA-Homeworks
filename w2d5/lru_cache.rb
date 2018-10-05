class LRUCache
  attr_reader :cache, :size

  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    self.cache.length
  end

  def add(el)
    if self.cache.include?(el)
      self.cache.delete(el)
      self.cache << el
    elsif count >= self.size
      self.cache.shift
      self.cache << el
    else
      self.cache << el
    end
  end

  def show

  end
end
