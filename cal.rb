require_relative 'cal_helper'

raise ArgumentError.new("Cal expects 1 or 2 arguments, you provided 0") if ARGV.length == 0
raise ArgumentError.new("Cal expects 1 or 2 arguments, you provided #{ARGV.length}") if ARGV.length > 2
SPACES_TO_YEAR = 28
if ARGV.length == 1
  # Assume user supplied only a year
  months = []
  12.times do |index|
    months << CalHelper.get_month_text(index + 1, ARGV[0], false)
  end

  puts "#{' '*SPACES_TO_YEAR}#{ARGV[0]}"
  quarters = []
  months.each_slice(3) { |month| quarters << month }
  4.times do |index|
    CalHelper.put_months_array quarters[index]
    puts "\n" unless index == 3
  end

elsif ARGV.length == 2
  if ARGV[0].index(/[a-zA-Z]/)
    month = CalHelper.month_array.index(ARGV[0].capitalize) + 1 # add 1 to month to index from 1 instead of 0
  else
    if (1..12).include?(ARGV[0].to_i)
      month = ARGV[0].to_i
    else
      # User supplied an invalid argument
    end
  end
  puts CalHelper.get_month_text month, ARGV[1]
end
