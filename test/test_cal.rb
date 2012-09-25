require 'test/unit'
require 'cal'

class CalTest < Test::Unit::TestCase

  def test_01_Week_has_7_days_and_inst_vars
    week = Week.new
  end

  def test_02_set_leap_year_calcs_leap_years_and_works_with_defaults

    m = Month.new( 0, 0 )

    assert_equal true, m.set_leap_year( 2000 )
    assert_equal false, m.set_leap_year( 1900 )
    assert_equal true, m.set_leap_year( 1604 )
    assert_equal false, m.set_leap_year( 1923 )

  end

  def test_03_leap_year_returns_boolean

    m = Month.new( 1, 1337 )
    assert_equal false, m.leap_year

    m.set_leap_year( 60 )
    assert_equal true, m.leap_year
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

end
