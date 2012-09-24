require 'test/unit'
require 'cal'

class CalTest < Test::Unit::TestCase

  def test_01_Week_has_7_days
    week = Week.new

    assert_equal 7, week.days.size
  
  end

end
