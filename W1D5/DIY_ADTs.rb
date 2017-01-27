class Stack
  def initialize(array = [])
    @stack_arr = array
  end

  def add(el)
    @stack_arr.push(el)
  end

  def remove
    @stack_arr.pop
  end

  def show
    @stack_arr
  end

end

class Queue

  def initialize(array = [])
    @queue_arr = array
  end

  def enqueue(el)
    @queue_arr.push(el)
  end

  def dequeue
    @queue_arr.shift
  end

  def show
    @queue_arr
  end

end

class Map

  def initialize(array = [[]])
    @map_arr = array
  end

  def assign(key, value)
    remove(key) if lookup(key)
    @map_arr << [key, value]
  end

  def lookup(key)
    @map_arr.each_with_index { |item, i| return i if item.first == key }
    nil
  end

  def remove(key)
    @map_arr.delete_at(lookup(key))
  end

  def show
    @map_arr
  end

end
