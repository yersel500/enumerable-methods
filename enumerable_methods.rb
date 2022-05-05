module MyEnumerable
  def all?
    each { |item| return false unless yield(item) }
    true
  end
  def any?
    each { |item| return true unless yield(item) }
    false
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

puts array.all? { |num| num <= 5 }

list_item.any? { |num| num == 2 }
