require_relative '../zellers'
require 'minitest/autorun'

class TestZellers < MiniTest::Unit::TestCase
  def test_zellers_has_a_get_day_method
    Zellers.get_day("12/20/2013")
  end

  def test_zellers_returns_correct_day
    assert_equal 0, Zellers.get_day("12/21/2013")
    assert_equal 1, Zellers.get_day("12/22/2013")
    assert_equal 2, Zellers.get_day("12/23/2013")
  end

  def test_zellers_returns_correct_day_in_leap_year
    assert_equal 5, Zellers.get_day("12/27/2012")
    assert_equal 6, Zellers.get_day("12/28/2012")
    assert_equal 4, Zellers.get_day("2/1/2012")
  end

  def test_zellers_days_from_sunday
    assert_equal 6, Zellers.days_from_sunday(0)
    assert_equal 0, Zellers.days_from_sunday(1)
    assert_equal 1, Zellers.days_from_sunday(2)
  end

  def test_zellers_has_a_get_day_as_string_method
    Zellers.get_day_as_string(0)
  end

  def test_zellers_get_day_as_string_returns_correct_day
    assert_equal "Saturday", Zellers.get_day_as_string(0)
    assert_equal "Sunday", Zellers.get_day_as_string(1)
    assert_equal "Monday", Zellers.get_day_as_string(2)
  end


end
