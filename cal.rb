require_relative 'date_parser'


# puts "enter a date"
# input = gets.chomp
# puts DateParser.parse(input)




def number_of_days month, year
  month = month.downcase
  if month == 'february'
    is_leap_year?(year) ? 29 : 28
  elsif ['april', 'june', 'september', 'november'].index(month)
    return 30
  elsif ['june', 'september', 'november', 'january', 'march', 'may', 'july', 'august', 'october', 'december'].index(month)
    return 31
  end
end

def is_leap_year? year
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
