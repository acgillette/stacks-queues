class Queue
  def initialize
    @store = Array.new
  end

  def enqueue(element)
    return @store.push(element)
  end

  def dequeue
    return @store.shift
  end

  def front
    return @store[0]
  end

  def size
    return @store.length
  end

  def empty?
    return size == 0
  end

  def reverse
    return @store.reverse
  end

  def to_s
    return @store.to_s
  end
end
