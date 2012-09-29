require 'test/unit'
require 'cal'

class CalTest < Test::Unit::TestCase

#  def test_02_set_leap_year_calcs_leap_years_and_works_with_defaults
#
#    m = Month.new( 0, 0 )
#
#    assert_equal true, m.set_leap_year( 2000 )
#    assert_equal false, m.set_leap_year( 1900 )
#    assert_equal true, m.set_leap_year( 1604 )
#    assert_equal false, m.set_leap_year( 1923 )

#  end

  def test_02_not_a_leap_year_returns_false

    m = Month.new( 1, 1337 )
    assert_equal false, m.leap_year?
  end

  def test_03_leap_year_returns_true

    m = Month.new( 2, 2000 )
    assert_equal true, m.leap_year?
  end

  def test_04_calc_num_days_returns_correct_number
  
    m1 = Month.new(1, 2001)
    m2 = Month.new(9, 2001)
    m3 = Month.new(2, 2001)
    m4 = Month.new(2, 1996)
    assert_equal  31, m1.num_days
    assert_equal  30, m2.num_days
    assert_equal  28, m3.num_days
    assert_equal  29, m4.num_days
  end

  def test_05_leap_year_offset_works
    
  end
  def test_06_calc_start_day_returns_right_day

    m1 = Month.new(1, 2000)
    m2 = Month.new(12, 2000)
    m3 = Month.new(3, 1999)

    assert_equal 0, m1.first_day
    assert_equal 6, m2.first_day
    assert_equal 2, m3.first_day

  end

  def test_07_get_title_line_returns_formatted_string
    m1 = Month.new(9, 1989).get_title_line(20, 9, 1989)
    m2 = Month.new(2, 2014).get_title_line(20, 2, 2014)
    
    assert_equal "   September 1989     ", m1
    assert_equal '   February 2014      ', m2
    
  end

  def test_08_get_day_names

    assert_equal 'Su Mo Tu We Th Fr Sa  ', DAYNAMES 
  end

  def test_09_display_dates
    m = Month.new( 10, 2002 )
   expected =
"""       1  2  3  4  5  
 6  7  8  9 10 11 12  
13 14 15 16 17 18 19  
20 21 22 23 24 25 26  
27 28 29 30 31        
                      """
    assert_equal expected, m.to_string 
  end

  def test_10_year_get_title_line
    
    title_line = Year.new(2000).get_title_line(60, 100, 2000).rstrip
    expected = "                            2000"

    assert_equal expected, title_line

  end

  def test_11_month_header_title_jan_to_march
    year = Year.new(2000)
    month_array = year.months_array.slice(0, 3)
    result = year.months_header_title(month_array)

    expected = "      January               February               March          "

    assert_equal expected, result
  end

  def test_12_month_header_title_april_to_june
    year = Year.new(2001)
    month_array = year.months_array.slice(3, 3)
    result = year.months_header_title(month_array)

    expected = "       April                  May                   June          "

    assert_equal expected, result
  end

  def test_13_month_header_title_july_to_sept
    year = Year.new(2002)
    month_array = year.months_array.slice(6, 3)
    result = year.months_header_title(month_array)

    expected = "        July                 August              September        "

    assert_equal expected, result
  end

  def test_14_month_header_title_oct_to_dec
    year = Year.new(2003)
    month_array = year.months_array.slice(9, 3)
    result = year.months_header_title(month_array)

    expected = "      October               November              December        "

    assert_equal expected, result
  end

  def test_15_DAYNAMES_can_be_multiplied_to_make_year_display

    result = DAYNAMES * 3
    expected = "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  "

    assert_equal expected, result
  end
end
