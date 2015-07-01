module Toolbox
  def sharpen
    super if defined?(super)
    puts "sharpening my tools!"
  end
end

class Skillz
  def sharpen
    puts "sharpening my skillz!"
  end
end

class Person < Skillz
  include Toolbox
end

class PersonWithNoSkillz
  include Toolbox
end

person1 = Person.new
person2 = PersonWithNoSkillz.new

puts person1.sharpen
puts person2.sharpen
