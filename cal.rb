require_relative 'cal_helper'

raise ArgumentError.new("Cal expects 1 or 2 arguments, you provided 0") if ARGV.length == 0
raise ArgumentError.new("Cal expects 1 or 2 arguments, you provided #{ARGV.length}") if ARGV.length > 2

if ARGV.length == 1
  # Assume user supplied only a year
  months = []
  12.times do |index|
    months << CalHelper.get_month_text(index + 1, ARGV[0], false)
  end
  puts "                            #{ARGV[0]}"
  CalHelper.put_months_array [months[0], months[1], months[2]]
  puts "\n"
  CalHelper.put_months_array [months[3], months[4], months[5]]
  puts "\n"
  CalHelper.put_months_array [months[6], months[7], months[8]]
  puts "\n"
  CalHelper.put_months_array [months[9], months[10], months[11]]



elsif ARGV.length == 2
  if ARGV[0].index(/[a-zA-Z]/)
    month_array = ['january', 'february', 'march', 'april',
                   'may', 'june', 'july', 'august', 'september',
                   'october', 'november', 'december'
                  ]

    month = month_array.index(ARGV[0].downcase) + 1 # add 1 to month to index from 1 instead of 0
  else
    if (1..12).include?(ARGV[0].to_i)
      month = ARGV[0].to_i
    else
      # User supplied an invalid argument
    end
  end
  puts CalHelper.get_month_text month, ARGV[1]
end
