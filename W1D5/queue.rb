class Queue
  attr_reader :line

  def initialize
    @line = []
  end

  def enqueue(el)
    self.line << el
  end

  def dequeue
    self.line.shift
  end

  def peek
    self.line.first
  end
end

# q = Queue.new
#
# p q.line == []
# p q.enqueue("everything") == ["everything"]
# p q.enqueue("is") == ["everything", "is"]
# p q.enqueue("fine") == ["everything", "is", "fine"]
# p q.dequeue == "everything"
# p q.line == ["is", "fine"]
# p q.peek == "is"
# p q.line == ["is", "fine"]
