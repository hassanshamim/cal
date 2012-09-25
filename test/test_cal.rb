require 'test/unit'
require 'cal'

class CalTest < Test::Unit::TestCase

  def test_01_Week_has_7_days_and_inst_vars
    week = Week.new
  end

  def test_02_set_leap_year_calcs_leap_years_and_works_with_defaults

    m = Month.new( 0 )

    assert_equal true, m.set_leap_year( 2000 )
    assert_equal false, m.set_leap_year( 1900 )
    assert_equal true, m.set_leap_year( 1604 )
    assert_equal false, m.set_leap_year( 1923 )

  end

  def test_03_leap_year_returns_boolean

  m = Month.new( 1337 )
  end

end
