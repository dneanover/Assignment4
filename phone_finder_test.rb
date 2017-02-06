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
   #Go over each line checking to make sure that the phone numbers match the RegEx for Phone number.  If a line (or subarray I guess) doesn't have a phone number, or an invalid one
   #It should say which line has the error
   #Regex /\d{3}-\d{3}-\d{4}/

   end

  def test_valid_join_date
    finder = PhoneFinder.new('homework.csv')
    assert_equal [2,3], finder.invalid_date
    #Very similar to the above valid_phone_number.
    #regex ^\d{1,2}\/\d{1,2}\/\d{2,4}$
  end

  def test_valid_email
    finder = PhoneFinder.new('homework.csv')
    assert_equal [2,6,7,8], finder.invalid_email
    #Very similar to above
    #RegEx
  end

  def test_valid_data

    #Say which lines contain everything using all the regexs?
    #Use a counter, put the line numbers that were bad in an array so that they can be told
    #put the count tat the end?  This should be a global variable?
  end

  #puts "There were #{counter} lines in the csv.
  #{invalid_rows} lines were invalid"
end


# Instantiates with a string which is the path to the CSV file on disk.
# Reviews all the data in the CSV file, and then puts back a description of the lines which were invalid.
# If the joined field does not contain a valid date, it should be reported.
# If the email field does not contain a valid email address, it should be reported.
# If the phone field does not contain a valid phone number, it should be reported.
# The program should report a count of how many lines were valid, then report the line numbers of lines which were invalid, as well as which fields were invalid for each.
# All of this reporting should be done at the end of the review process, not by putsing all along the way.
# This code should be written with small validation methods inside it which are tested!
