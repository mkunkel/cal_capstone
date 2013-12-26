class Zellers
  CENTURY_LENGTH_IN_YEARS = 100
  def self.get_day(date_string)
    date_array = date_string.split "/"
    month = date_array[0].to_i
    year = date_array[2].to_i
    year -= 1 if month < 3
    month += 12 if month < 3
    day = date_array[1].to_i
    year_of_century = year % CENTURY_LENGTH_IN_YEARS
    century = (year / CENTURY_LENGTH_IN_YEARS).floor

    zeller_math = day
    zeller_math += ((13 * (month + 1)) / 5).floor
    zeller_math += year_of_century
    zeller_math += (year_of_century / 4).floor
    zeller_math += (century / 4).floor
    zeller_math += 5 * century

    zeller_math % 7
  end

  def self.get_day_as_string(zeller_num)
    day_strings = ["Saturday",
                   "Sunday",
                   "Monday",
                   "Tuesday",
                   "Wednesday",
                   "Thursday",
                   "Friday"
                  ]

    day_strings[zeller_num]
  end

  def self.days_from_sunday zeller_num
    [5,6,0,1,2,3,4][zeller_num]
  end

end

