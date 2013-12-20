require_relative '../date_parser'
require 'minitest/autorun'

class TestDateParser < MiniTest::Unit::TestCase
  def test_date_parser_has_a_parse_method
    DateParser.parse("2004/12/24")
  end

  def test_parse_proper_date
    assert_equal "12/24/2013", DateParser.parse("12/24/2013")
  end

  def test_parse_date_with_hyphens
    assert_equal "12/24/2013", DateParser.parse("12-24-2013")
  end

  def test_parse_date_with_periods
    assert_equal "12/24/2013", DateParser.parse("12.24.2013")
  end

  def test_parse_uk_date
    assert_equal "12/24/2013", DateParser.parse("24/12/2013")
  end

  def test_parse_iso_date
    assert_equal "12/24/2013", DateParser.parse("2013/12/24")
  end

  def test_parse_date_with_leading_zeros
    assert_equal "2/6/2013", DateParser.parse("02/06/2013")
  end

  def test_parse_date_with_month_name
    assert_equal "2/6/2013", DateParser.parse("February/06/2013")
  end

  def test_parse_date_with_1st_name
    assert_equal "2/6/2013", DateParser.parse("2/6th/2013")
  end

  def test_parse_date_sentence
    assert_equal "2/6/2013", DateParser.parse("February 6th 2013")
    assert_equal "2/6/2013", DateParser.parse("February 6th, 2013")
  end

  def test_parse_out_of_order_date_sentence
    assert_equal "2/6/2013", DateParser.parse("2013 February 6th")
  end
end
