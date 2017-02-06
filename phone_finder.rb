require 'csv'

class PhoneFinder

  def initialize(filename)
    @filename = filename
    @data = CSV.read(@filename)[1..-1]
  end

  def get_numbers
    @data.flatten.select {|s| s.match(/\d{3}-\d{3}-\d{4}/)}
#@data is an array of arrays
    # @data.each do |subarray|
    #   subarray.each do |string|
    #     good_stuff += string.scan(/\d{3}-\d{3}-\d{4}/)
    #   end
    # end
    # good_stuff
  end

  def invalid_number
    invalid_rows = []
    @data.each_with_index do |row,counter|
      unless row[4].match(/\d{3}-\d{3}-\d{4}/)
        invalid_rows << counter + 1
      end
    end
    invalid_rows
  end

  def invalid_date
    invalid_dates = []
    @data.each_with_index do |row,counter|
      unless row.match(/\d{1,2}\/\d{1,2}\/\d{2,4}$/)
        invalid_dates << counter + 1
      end
    end
    invalid_rows
  end

  def  invalid_email
    invalid_emails =[]
    @data.each_with_index do |row, counter|
      unless row.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
        invalid_emails << counter + 1
      end
    end
    invalid_emails
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
