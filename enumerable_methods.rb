module MyEnumerable
  def all?
    each { |item| return false unless yield(item) }
    true
  end

  def any?
    each { |item| return true unless yield(item) }
    false
  end

  def filter
    new_list = []
    each { |item| new_list << item if yield(item) }
    new_list
  end
end

class MyList
  include MyEnumerable
  def initialize(list)
    @list = list
  end

  def each(&block)
    @list.each(&block)
  end
end

array = MyList.new([1, 2, 3, 4])

p(array.all? { |num| num <= 5 })

p(array.any? { |num| num == 2 })

p array.filter(&:even?)
