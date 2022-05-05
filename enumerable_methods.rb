module MyEnumerable
  value = true
  def all?
    yield(item)
end

class MyList
  @@value = true
  include MyEnumerable
  def initialize(list)
    @list = list
  end

  def my_each
    @list.each do |item|
      @@value &&= yield(item)
    end
    p @@value
  end
end

array = MyList.new([1, 2, 3])
array.my_all { |item| item >= 1 }
