require "forwardable"

# I did not know you could delegate to nested objects with Forwardable
class Child
  extend Forwardable

  def initialize(parent)
    @parent = parent
  end

  def_delegators :@parent, :last_name

  # WOAH crazy
  def_delegators "@parent.address", :street
end

class Parent
  def initialize(last_name, address)
    @last_name = last_name
    @address   = address
  end

  attr_reader :address;

  private

  attr_reader :last_name
end

Address = Struct.new(:street)

address = Address.new("123 Main st")
parent = Parent.new("Begin", address)
child  = Child.new(parent)

puts "Child's last name: " + child.last_name
puts "Child's street: " + child.street

