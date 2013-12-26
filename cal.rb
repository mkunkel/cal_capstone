require_relative 'zellers'
require_relative 'date_parser'
WEEK_LENGTH = 7





def get_month_text month, year
  month = month.capitalize
  start_day = Zellers.get_day month.to_s + '/1/' + year.to_s
  start_day = Zellers.days_from_sunday start_day
  month_days = number_of_days month, year
  output = "#{month} #{year}".center(20) + "  "
  output << "\nSu Mo Tu We Th Fr Sa  \n"

  output << get_date_line(1, month_days, start_day)
  5.times do |index|
    start = WEEK_LENGTH - (start_day - 1) + (WEEK_LENGTH * index)
    output << get_date_line(start, month_days, 0)
  end
  return output
end

def get_date_line start_from, max, offset = 0
  output = ''
  counter = 0
  7.times do |index|
    output << ' ' unless index == 0
    next_num = start_from + index - offset
    if index < offset
      output << '  '
    elsif next_num > max
      output << '  '
    elsif next_num < 10
      output << ' ' + next_num.to_s
    else
      output << next_num.to_s
    end
  end
  return output + "  \n"
end

def number_of_days month, year
  month = month.downcase

  if month == 'february'
    # puts is_leap_year?(year)
    is_leap_year?(year) ? 29 : 28
  elsif ['april', 'june', 'september', 'november'].index(month)
    30
  elsif ['june', 'september', 'november', 'january', 'march', 'may', 'july', 'august', 'october', 'december'].index(month)
    31
  end
end

def is_leap_year? year
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

if ARGV.length == 1
  # Assume user supplied only a year
elsif ARGV.length == 2
  if ARGV[0].index(/[a-zA-Z]/)
    month_array = ['january', 'february', 'march', 'april',
                   'may', 'june', 'july', 'august', 'september',
                   'october', 'november', 'december'
                  ]
    month = month_array[ARGV[0]] + 1 # add 1 to month to index from 1 instead of 0
  else
    if (1..12).include?(ARGV[0].to_i)
      month = ARGV[0].to_i
    else
      # User supplied an invalid argument
    end
  end
  puts get_month_text month, ARGV[1]
elsif ARGV.length > 2
  # User supplied too many arguments
end
