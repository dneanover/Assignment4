require 'csv'

class PhoneFinder

  def initialize(filename)
    @filename = filename
  end

  def data
    CSV.read(@filename)[1..-1]
  end

  def get_numbers
    data.flatten.select {|s| s.match(/\d{3}-\d{3}-\d{4}/)}
  end

  def invalid_number
    invalid_numbers = []
    data.each_with_index do |row,counter|
      unless row[4].match(/\d{3}-\d{3}-\d{4}/)
        invalid_numbers << counter + 1
      end
    end
    invalid_numbers
  end

  def invalid_date
    invalid_dates = []
    data.each_with_index do |row,counter|
      unless row[1].match(/\d{1,2}\/\d{1,2}\/\d{2,4}$/)
        invalid_dates << counter + 1
      end
    end
    invalid_dates
  end

  def  invalid_email
    invalid_emails =[]
    data.each_with_index do |row, counter|
      unless row[3].match(/^\w+@\w+\.\w{2,4}/)
        invalid_emails << counter + 1
      end
    end
    invalid_emails
  end

  def invalid_lines
    invalid_line =[]
    data.each_with_index do |row,counter|
      unless row[4].match(/\d{3}-\d{3}-\d{4}/) && row[1].match(/\d{1,2}\/\d{1,2}\/\d{2,4}$/) && row[3].match(/^\w+@\w+\.\w{2,4}/)
        invalid_line << counter + 1
      end
    end
    invalid_line
  end

  def line_count
    data.count
  end

  def generate_report
    puts "There were #{line_count} rows"
    puts "Line(s) #{invalid_lines} were invalid lines"
    puts "Line(s) #{invalid_number} had invalid phone numbers"
    puts "Line(s) #{invalid_date} had issues with join date"
    puts "Line(s) #{invalid_email} had issues with valid emails"
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
