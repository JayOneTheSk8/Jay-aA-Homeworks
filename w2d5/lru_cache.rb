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
    p self.cache
  end
end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count == 2
johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})

johnny_cache.show
