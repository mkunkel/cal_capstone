require_relative 'cal_helper'

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
  puts CalHelper.get_month_text month, ARGV[1]
elsif ARGV.length > 2
  # User supplied too many arguments
end
