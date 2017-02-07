require 'minitest/autorun'
require 'minitest/pride'
require'./phone_finder'

class PhoneFinderTest < Minitest::Test
  def test_initialize
    assert PhoneFinder.new('homework.csv')
  end

  def test_simple
    finder = PhoneFinder.new('homework.csv')
    assert_equal '919-111-1111', finder.get_numbers[0]
  end


  def test_invalid_number
   finder = PhoneFinder.new('homework.csv')
   assert_equal [2,3,4,5,6], finder.invalid_number
   end

  def test_invalid_date
    finder = PhoneFinder.new('homework.csv')
    assert_equal [2,5,6,7], finder.invalid_date
  end

  def test_invalid_email
    finder = PhoneFinder.new('homework.csv')
    assert_equal [2,3,4], finder.invalid_email
  end

  def test_invalid_lines
    finder = PhoneFinder.new('homework.csv')
    assert_equal (2..7).to_a, finder.invalid_lines
  end

  def test_line_count
    finder = PhoneFinder.new('homework.csv')
    assert_equal 7, finder.line_count

  end

  def test_generate_report
  finder = PhoneFinder.new('homework.csv')
  finder.generate_report
  end


end



# Instantiates with a string which is the path to the CSV file on disk.
# Reviews all the data in the CSV file, and then puts back a description of the lines which were invalid.
# If the joined field does not contain a valid date, it should be reported.
# If the email field does not contain a valid email address, it should be reported.
# If the phone field does not contain a valid phone number, it should be reported.
# The program should report a count of how many lines were valid, then report the line numbers of lines which were invalid, as well as which fields were invalid for each.
# All of this reporting should be done at the end of the review process, not by putsing all along the way.
# This code should be written with small validation methods inside it which are tested!
