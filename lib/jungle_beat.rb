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
end
