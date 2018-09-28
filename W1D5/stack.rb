class Stack
  attr_reader :pile

  def initialize
    @pile = []
  end

  def push(el)
    self.pile << el
  end

  def pop
    self.pile.pop
  end

  def peek
    self.pile.last
  end
end

# s = Stack.new
#
# p s.pile == []
# p s.push("everything") == ["everything"]
# p s.push("is") == ["everything", "is"]
# p s.push("fine") == ["everything", "is", "fine"]
# p s.pop == "fine"
# p s.pile == ["everything", "is"]
# p s.peek == "is"
# p s.pile == ["everything", "is"]
