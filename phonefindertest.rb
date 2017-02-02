require 'minitest/autorun'
require 'minitest/pride'
require'./PhoneFinder'

class PhoneFinderTest < Minitest::Test
  def test_initialize
    assert PhoneFinder.new('homework.csv')
  end

  def test_simple
    finder = PhoneFinder.new('homework.csv')
    assert_equal ['910-546-7631'], finder.get_numbers
  end

end
