puts "\n011 Contructors\n\n"

class YearOfTheCat
  class << self
    def my_new(*args, &blk)
      instance = allocate
      instance.my_initialize(*args, caller.last, &blk)
      instance
    end
  end

  def my_initialize(*args)
    @x, @y, @invocation_location = args
  end

  attr_reader :invocation_location
end

yotc = YearOfTheCat.my_new(1, 2)

puts "This obj was initialized at: #{yotc.invocation_location}"
