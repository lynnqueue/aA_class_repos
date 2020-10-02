require "byebug"
class MaxIntSet
  attr_reader :store
  
  def initialize(max)
     @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    @store[num] = true
  end

  def remove(num)
    store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    (0...@store.size).include?(num)
  end

  def validate!(num)
    if is_valid?(num)
      true
    else
      raise "Out of bounds"
    end
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
    # p self
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count
  
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  
  def insert(num)
    if !include?(num)
      self[num] << num
      @count += 1
    end
    
    if num_buckets == @count
      resize!
    end 
  end
  
  def num_buckets
    @store.length
  end

  def remove(num)
    if include?(num)
    self[num].delete(num)
    @count -= 1
    else
      return
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end


#   def resize!
#     if self.num_buckets == @count
#       temp_store = []
#       # debugger
#       @store.each do |bucket| 
#         bucket.each {|num| temp_store << num}
#       end 
#       # debugger
#       old_num_buckets = self.num_buckets.dup
#       new_num_buckets = old_num_buckets * 2
#       @store = Array.new(new_num_buckets) {Array.new}
#       # debugger
#       temp_store.each {|num| insert(num)} 
#     end 
#   end
# end

# NOTHING WORKS!!!!


