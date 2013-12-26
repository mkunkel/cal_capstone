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
    assert_equal 3, Zellers.get_day("12/24/2013")
    assert_equal 4, Zellers.get_day("12/25/2013")
    assert_equal 5, Zellers.get_day("12/26/2013")
    assert_equal 6, Zellers.get_day("12/27/2013")
    assert_equal 6, Zellers.get_day("2/1/2013")
  end

  def test_zellers_returns_correct_day_in_leap_year
    assert_equal 0, Zellers.get_day("12/22/2012")
    assert_equal 1, Zellers.get_day("12/23/2012")
    assert_equal 2, Zellers.get_day("12/24/2012")
    assert_equal 3, Zellers.get_day("12/25/2012")
    assert_equal 4, Zellers.get_day("12/26/2012")
    assert_equal 5, Zellers.get_day("12/27/2012")
    assert_equal 6, Zellers.get_day("12/28/2012")
    assert_equal 4, Zellers.get_day("2/1/2012")
  end

  def test_zellers_days_from_sunday
    assert_equal 5, Zellers.days_from_sunday(0)
    assert_equal 6, Zellers.days_from_sunday(1)
    assert_equal 0, Zellers.days_from_sunday(2)
    assert_equal 1, Zellers.days_from_sunday(3)
    assert_equal 2, Zellers.days_from_sunday(4)
    assert_equal 3, Zellers.days_from_sunday(5)
    assert_equal 4, Zellers.days_from_sunday(6)
  end

  def test_zellers_has_a_get_day_as_string_method
    Zellers.get_day_as_string(0)
  end

  def test_zellers_get_day_as_string_returns_correct_day
    assert_equal "Saturday", Zellers.get_day_as_string(0)
    assert_equal "Sunday", Zellers.get_day_as_string(1)
    assert_equal "Monday", Zellers.get_day_as_string(2)
    assert_equal "Tuesday", Zellers.get_day_as_string(3)
    assert_equal "Wednesday", Zellers.get_day_as_string(4)
    assert_equal "Thursday", Zellers.get_day_as_string(5)
    assert_equal "Friday", Zellers.get_day_as_string(6)
  end


end
