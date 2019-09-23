class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(beat)
    if @head
      find_last_node.next_node = Node.new(beat)
    else
      @head = Node.new(beat)
    end
  end

  def find_last_node
    return @head unless @head.next_node
    node = @head
    return node unless node.next_node while node = node.next_node
  end

  def count
    count = 0
    if !(@head)
      return count
    else
      count += 1
      node = @head
      while node = node.next_node
        count += 1
      end
    end
    count
  end

  def to_string
    string = ""
    node = @head
    string += node.data
    while node = node.next_node
      string += " " + node.data
    end
    string
  end
end
