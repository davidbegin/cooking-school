# I am going to build a very goofy DSL
# for setting file permissions,
#


# The real lesson is to_s is magical
# we can represent any base of number by passing
# integer to the to_s method called on a number

require 'pry'; binding.pry; 1

require "minitest/autorun"

class BinaryVersusBaseTen < Minitest::Test
  def setup
    @base_ten = 0
    @binary = 0b0
  end

  def test_they_are_the_same_class
    assert_equal @base_ten.class, @binary.class
  end

  def test_they_are_equal
    assert_equal @base_ten, @binary
  end

  def test_they_have_the_same_object_id
    assert_equal @base_ten.object_id, @binary.object_id
  end
end

# 42
# 3.14159
# "foo"
#
# 0x7FFF # => 32767
# 0755   # => 493
#
# require 'fileutils'
# include FileUtils
#
# chmod 0755, 'somefile'
#
# # U  G  O
# # rwxrwxrwx
# 0b111101101
#
# perms = 0b111101101
# perms.to_s(8) # => "755"
#
# chmod perms, 'somefile'
