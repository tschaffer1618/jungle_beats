class LinkedList
  attr_reader :head

  def initialize()
    @head = nil
  end

  def append(beat)
    @head = Node.new(beat)
  end

  def count
    @head == nil ? 0 : 1
  end

  def to_string
    @head == nil ? nil : @head.data
  end
end
