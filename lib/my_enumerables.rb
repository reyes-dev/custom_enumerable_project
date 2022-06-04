module Enumerable
  # Your code goes here
  def my_each_with_index
    x = 0
    for i in self
      yield(i, x)
      x = x + 1
    end
  end

  def my_select
    arr = []
    for i in self
      arr << i if yield(i)
    end
    return arr
  end

  def my_all?
    for i in self
      break if yield(i) == false
    end
    return yield(i)
  end

  def my_any?
    for i in self
      break if yield(i)
    end
    yield(i)
  end

  def my_none?
    for i in self
      value = yield(i)
      break if value == true
    end
    return !value
  end

  def my_count
    count = 0
    if block_given?
      for i in self
        count = count + 1 if yield(i)
      end
    else
      for i in self
        count = count + 1
      end
    end
    return count
  end

  def my_map
    arr = []
      for i in self
        arr << yield(i)
      end
    arr
  end

  def my_inject(arg)
    for i in self
      arg = yield arg, i
    end
    arg
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for i in self
      yield i
    end
  end
end
