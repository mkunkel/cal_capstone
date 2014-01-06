require_relative '../cal'
require_relative '../cal_helper'
require 'minitest/autorun'

class TestCal < MiniTest::Unit::TestCase
  def test_a_month_in_a_non_leap_year
    expected_output = `cal 2 2013`
    assert_equal expected_output.split("\n"), CalHelper.get_month_text(2, 2013)
  end

  def test_a_month_in_a_leap_year
    expected_output = `cal 2 2012`
    assert_equal expected_output.split("\n"), CalHelper.get_month_text(2, 2012)
  end

  def test_number_of_days_returns_correct_number
    assert_equal 28, CalHelper.number_of_days(2, 2013)
    assert_equal 30, CalHelper.number_of_days(4, 2013)
    assert_equal 30, CalHelper.number_of_days(6, 2013)
    assert_equal 30, CalHelper.number_of_days(9, 2013)
    assert_equal 30, CalHelper.number_of_days(11, 2013)
    assert_equal 31, CalHelper.number_of_days(1, 2013)
    assert_equal 31, CalHelper.number_of_days(3, 2013)
    assert_equal 31, CalHelper.number_of_days(5, 2013)
    assert_equal 31, CalHelper.number_of_days(7, 2013)
    assert_equal 31, CalHelper.number_of_days(8, 2013)
    assert_equal 31, CalHelper.number_of_days(10, 2013)
    assert_equal 31, CalHelper.number_of_days(12, 2013)
  end

  def test_number_of_days_returns_correct_number_in_leap_year
    assert_equal 29, CalHelper.number_of_days(2, 2012)
    assert_equal 30, CalHelper.number_of_days(4, 2012)
    assert_equal 30, CalHelper.number_of_days(6, 2012)
    assert_equal 30, CalHelper.number_of_days(9, 2012)
    assert_equal 30, CalHelper.number_of_days(11, 2012)
    assert_equal 31, CalHelper.number_of_days(1, 2012)
    assert_equal 31, CalHelper.number_of_days(3, 2012)
    assert_equal 31, CalHelper.number_of_days(5, 2012)
    assert_equal 31, CalHelper.number_of_days(7, 2012)
    assert_equal 31, CalHelper.number_of_days(8, 2012)
    assert_equal 31, CalHelper.number_of_days(10, 2012)
    assert_equal 31, CalHelper.number_of_days(12, 2012)
  end

  def test_is_leap_year_returns_correctly
    assert_equal true, CalHelper.is_leap_year?(2012)
    assert_equal false, CalHelper.is_leap_year?(2013)
    assert_equal true, CalHelper.is_leap_year?(2000)
    assert_equal false, CalHelper.is_leap_year?(1900)
  end

  def test_get_date_line
    assert_equal " 1  2  3  4  5  6  7  ", CalHelper.get_date_line(1,8)
    assert_equal " 1  2  3  4  5  6  7  ", CalHelper.get_date_line(1,7)
    assert_equal "    1  2  3  4  5  6  ", CalHelper.get_date_line(1,7,1)
  end

  def test_implementation_with_month_and_year
    assert_equal `cal 2 2012`, `ruby cal.rb 2 2012`
    assert_equal `cal 9 2012`, `ruby cal.rb 9 2012`
    assert_equal `cal 2 2015`, `ruby cal.rb 2 2015`
    assert_equal `cal 2 1900`, `ruby cal.rb 2 1900`
    assert_equal `cal 2 2000`, `ruby cal.rb 2 2000`
    assert_raises ArgumentError do
      `ruby cal.rb`
    end
    # assert_equal `cal 2 1799`, `ruby cal.rb 2 1799`
    # assert_equal `cal 2 3001`, `ruby cal.rb 2 3001`
  end

  def test_implementation_with_month_word
    assert_equal `cal february 2012`, `ruby cal.rb february 2012`
    assert_equal `cal September 2012`, `ruby cal.rb September 2012`
    assert_equal `cal May 2015`, `ruby cal.rb May 2015`
    assert_equal `cal ApRiL 1900`, `ruby cal.rb ApRiL 1900`
    assert_equal `cal June 2000`, `ruby cal.rb June 2000`
    # assert_equal `cal November 1799`, `ruby cal.rb November 1799`
    # assert_equal `cal JANUARY 3001`, `ruby cal.rb JANUARY 3001`
  end

  def test_implementation_with_only_year
    assert_equal `cal 2012`, `ruby cal.rb 2012`
    assert_equal `cal 2012`, `ruby cal.rb 2012`
    assert_equal `cal 2015`, `ruby cal.rb 2015`
    assert_equal `cal 1900`, `ruby cal.rb 1900`
    assert_equal `cal 2000`, `ruby cal.rb 2000`
    # assert_equal `cal 1799`, `ruby cal.rb 1799`
    # assert_equal `cal 3001`, `ruby cal.rb 3001`
  end

end
