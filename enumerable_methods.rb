module MyEnumerable
  def all?
    each { |item| return false unless yield(item) }
    true
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
end

# list = MyList.new([1, 2, 3, 4])

# puts list.any? { |num| num >= 3 }

# puts list.all? { |num| num <= 3 }

# p list.filter { |num| num.even? }