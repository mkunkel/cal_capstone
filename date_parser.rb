require_relative 'cal_helper'

class DateParser
  def self.parse(date_string)
    date_string = date_string.gsub /\W+/, "/"
    date_array = date_string.split "/"

    if date_array[0].length == 4 and date_array[0].count("a-z") == 0
      date_array[0], date_array[2] = date_array[2], date_array[0]
    elsif date_array[1].length == 4 and date_array[1].count("a-z") == 0
      date_array[1], date_array[2] = date_array[2], date_array[1]
    end

    if date_array[1].count("a-z") > 0 and date_array[1].count("0-9") == 0
      date_array[0], date_array[1] = date_array[1], date_array[0]
    elsif date_array[2].count("a-z") > 0 and date_array[2].count("0-9") == 0
      date_array[0], date_array[2] = date_array[2], date_array[0]
    end

    # At this point, the last number should be the year
    # If the month is a word, the month should be first

    date_array.map! { |item|
      if item.count("a-z") > 0 and item.count("0-9") == 0
        item = self.month_name_to_number(item)
      elsif item.count("a-z") > 0 and item.count("0-9") > 0
        item.gsub! /\D/, ""
      end
      item.to_s.gsub /\A0+/, ""
    }

    if date_array[0].to_i > 12 # this number must be a day
      date_array[0], date_array[1] = date_array[1], date_array[0]
    end

    date_string = date_array.join "/"
  end

  def self.month_name_to_number name
    number = CalHelper.month_array.index(name.capitalize)
    number += 1 # compensate for 0 index
  end
end

