module Logged
  def logged_send(name, *args, &block)
    puts "sending message: #{name} | with args: #{args.join(", ")}"

    bound_send.(name, *args, &block)
    # __send__(name, *args, &block)
  end

  private

  def bound_send
    original_send.bind(self)
  end

  def original_send
    Object.instance_method(:send)
  end
end

module PigeonPost
  def send(name, *args, &block)
    puts "I love ignoring send!"
  end
end

# Order of inclusion does not matter
class Greeter
  include Logged
  include PigeonPost

  def hello(subject)
    puts "Hello #{subject}"
  end
end

greeter = Greeter.new
greeter.logged_send(:hello, "Jim")
