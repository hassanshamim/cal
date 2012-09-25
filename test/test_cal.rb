require 'test/unit'
require 'cal'

class CalTest < Test::Unit::TestCase

  def test_01_Week_has_7_days_and_inst_vars
    week = Week.new
    week.sat = 21
    week.fri = 12

    assert_equal 7, week.days.size
    assert_equal 21, week.sat
    assert_equal [21, nil, nil, nil, nil, nil, 12], week.days
  end

  def test_02_is_leap_year_calcs_leap_years_and_works_with_defaults

    m = Month.new

    assert_equal true, m.is_leap_year?( 2000 )
    assert_equal false, m.is_leap_year?( 1900 )
    assert_equal true, m.is_leap_year?( 1604 )
    assert_equal false, m.is_leap_year?( 1923 )

  end

end
