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

  def test_number_of_days_returns_correct_number_for_february
    assert_equal 28, CalHelper.number_of_days(2, 2013)
  end

  def test_number_of_days_returns_correct_number_for_april
    assert_equal 30, CalHelper.number_of_days(4, 2013)
  end

  def test_number_of_days_returns_correct_number_for_january
    assert_equal 31, CalHelper.number_of_days(1, 2013)
  end

  def test_number_of_days_returns_correct_number_in_leap_year_for_february
    assert_equal 29, CalHelper.number_of_days(2, 2012)
  end

  def test_number_of_days_returns_correct_number_in_leap_year_for_april
    assert_equal 30, CalHelper.number_of_days(4, 2012)
  end

  def test_number_of_days_returns_correct_number_in_leap_year_for_january
    assert_equal 31, CalHelper.number_of_days(1, 2012)
  end


  def test_is_leap_year_returns_true_for_normal_leap_year
    assert_equal true, CalHelper.is_leap_year?(2012)
  end

  def test_is_leap_year_returns_false_for_normal_non_leap_year
    assert_equal false, CalHelper.is_leap_year?(2013)
  end

  def test_is_leap_year_returns_true_for_leap_century
    assert_equal true, CalHelper.is_leap_year?(2000)
  end

  def test_is_leap_year_returns_false_for_non_leap_century
    assert_equal false, CalHelper.is_leap_year?(1900)
  end

  def test_get_date_line
    assert_equal " 1  2  3  4  5  6  7  ", CalHelper.get_date_line(1,8)
  end

def test_get_date_line_with_offset
    assert_equal "    1  2  3  4  5  6  ", CalHelper.get_date_line(1,7,1)
  end

  def test_implementation_with_leap_february
    assert_equal `cal 2 2012`, `ruby cal.rb 2 2012`
  end

  def test_implementation_with_month_starting_on_saturday
    assert_equal `cal 9 2012`, `ruby cal.rb 9 2012`
  end

  def test_implementation_with_4_line_month
    assert_equal `cal 2 2015`, `ruby cal.rb 2 2015`
  end

  def test_implementation_with_non_leap_century_february
    assert_equal `cal 2 1900`, `ruby cal.rb 2 1900`
  end

  def test_implementation_leap_february
    assert_equal `cal 2 2000`, `ruby cal.rb 2 2000`
  end

  def test_implementation_with_month_word
    assert_equal `cal february 2012`, `ruby cal.rb february 2012`
  end

  def test_implementation_with_only_leap_year
    assert_equal `cal 2012`, `ruby cal.rb 2012`
  end

  def test_implementation_with_only_non_leap_year
    assert_equal `cal 2015`, `ruby cal.rb 2015`
  end

  def test_implementation_with_only_non_leap_century
    assert_equal `cal 1900`, `ruby cal.rb 1900`
  end

  def test_implementation_with_only_leap_century
    assert_equal `cal 1900`, `ruby cal.rb 1900`
  end

end
