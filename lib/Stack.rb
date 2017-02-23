class Stack
  def initialize
    @store = Array.new
  end

  def push(element)
    return @store.push(element)
  end

  def pop
    return @store.pop
  end

  def top
    return @store[-1]
  end

  def size
    return @store.length
  end

  def empty?
    return size == 0
  end

  def to_s
    return @store.to_s
  end
end
