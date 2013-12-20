require_relative '../cal'
require 'minitest/autorun'

class TestCal < MiniTest::Unit::TestCase
  def test_a_month_in_a_non_leap_year
    shell_output = `ruby cal.rb 2 2013`
    expected_output = <<EOS
   February 2013
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28


EOS
    assert_equal expected_output, shell_output
  end

  def test_number_of_days_returns_correct_number
    assert_equal 28, number_of_days("february", 2013)
    assert_equal 30, number_of_days("april", 2013)
    assert_equal 30, number_of_days("june", 2013)
    assert_equal 30, number_of_days("september", 2013)
    assert_equal 30, number_of_days("november", 2013)
    assert_equal 31, number_of_days("january", 2013)
    assert_equal 31, number_of_days("march", 2013)
    assert_equal 31, number_of_days("may", 2013)
    assert_equal 31, number_of_days("july", 2013)
    assert_equal 31, number_of_days("august", 2013)
    assert_equal 31, number_of_days("october", 2013)
    assert_equal 31, number_of_days("december", 2013)
  end

  def test_number_of_days_returns_correct_number_in_leap_year
    assert_equal 29, number_of_days("february", 2012)
    assert_equal 30, number_of_days("april", 2012)
    assert_equal 30, number_of_days("june", 2012)
    assert_equal 30, number_of_days("september", 2012)
    assert_equal 30, number_of_days("november", 2012)
    assert_equal 31, number_of_days("january", 2012)
    assert_equal 31, number_of_days("march", 2012)
    assert_equal 31, number_of_days("may", 2012)
    assert_equal 31, number_of_days("july", 2012)
    assert_equal 31, number_of_days("august", 2012)
    assert_equal 31, number_of_days("october", 2012)
    assert_equal 31, number_of_days("december", 2012)
  end

  def test_is_leap_year_returns_correctly
    assert_equal true, is_leap_year?(2012)
    assert_equal false, is_leap_year?(2013)
    assert_equal true, is_leap_year?(2000)
    assert_equal false, is_leap_year?(1900)
  end


end
