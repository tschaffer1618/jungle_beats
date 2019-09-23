class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(string)
    beats = string.split
    beats.each do |beat|
      @list.append(beat)
    end
  end

  def count
    @list.count
  end

  def play
    `say -r 200 #{@list.to_string}`
  end
end
