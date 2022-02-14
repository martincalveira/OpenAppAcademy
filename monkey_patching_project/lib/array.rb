# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length == 0
    self.length > 1 ? self.max - self.min : 0
  end

  def average
    self.length == 0 ? nil : (self.sum * 1.0) / self.length  if self.all? { |e| e.is_a? Numeric }
  end

  def median
    return nil if self.length == 0
    self_l = self.length
    self_l_div_2 = self_l / 2
    self_sort = self.sort
    self_l.odd? ? self_sort[self_l_div_2] : (self_sort[self_l_div_2 - 1] + self_sort[self_l_div_2]) * 1.0 / 2
  end

  def counts
    count_hash = Hash.new(0)
    self.each { |e| count_hash[e] += 1 }
    count_hash
  end

  def my_count(element)
    self.counts[element]
  end

  def my_index(element)
    self.each_with_index { |e, i| return i if element == e }
    return nil
  end

  def my_uniq
    hash = Hash.new { |k, v| k[v] = []}
    self.each { |e| hash[e] }
    hash.keys
  end

  def my_transpose
    new_arr = Array.new(self.length).map { Array.new(self[0].length) }
    (0...self.length).each { |i1| (0...self[0].length).each { |i2| new_arr[i2][i1] = self[i1][i2] } } # O(n^2)!!!
    new_arr
  end
end
