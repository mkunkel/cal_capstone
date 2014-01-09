require_relative 'zellers'
require_relative 'date_parser'
WEEK_LENGTH = 7
class CalHelper
  def self.get_month_text month, year, display_year = true
    start_day = Zellers.get_day month.to_s + '/1/' + year.to_s
    start_day = Zellers.days_from_sunday start_day
    month_days = number_of_days month, year
    year_string = display_year ? " #{year}" : ""
    output = []
    output << "#{get_month_name month}#{year_string}".center(20) + "  "
    output << "Su Mo Tu We Th Fr Sa  "

    output << get_date_line(1, month_days, start_day)
    5.times do |index|
      start = WEEK_LENGTH - (start_day - 1) + (WEEK_LENGTH * index)
      output << get_date_line(start, month_days, 0)
    end
    return output
  end

  def self.get_date_line start_from, max, offset = 0
    output = ''
    7.times do |index|
      output << ' ' unless index == 0
      next_num = start_from + index - offset
      if index < offset or next_num > max
        output << '  '
      elsif next_num.to_s.length == 1
        output << ' ' + next_num.to_s
      else
        output << next_num.to_s
      end
    end
    return output + "  "
  end

  def self.number_of_days month, year
    if month == 2
      is_leap_year?(year) ? 29 : 28
    elsif [4, 6, 9, 11].include?(month)
      30
    elsif [1, 3, 5, 7, 8, 10, 12].include?(month)
      31
    end
  end

  def self.is_leap_year? year
    year = year.to_i
    if year % 400 == 0
      true
    elsif year % 100 == 0
      false
    elsif year % 4 == 0
      true
    else
      false
    end
  end

  def self.get_month_name month
    CalHelper.month_array[month - 1]
  end

  def self.put_months_array months
    months = months.transpose
    months.each { |month_line|
      puts month_line.join("") # + "  "
    }
  end

  def self.month_array
    ['January', 'February', 'March', 'April',
     'May', 'June', 'July', 'August', 'September',
     'October', 'November', 'December'
    ]
  end
end
