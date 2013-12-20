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




end
