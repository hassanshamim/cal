YEAR = ARGV[1]
MONTH = ARGV[0]

class Week
end


class Month

  attr_reader :leap_year

  def initialize(year )

    set_leap_year(year)
 
  end

  def set_leap_year(year = YEAR)
    if year % 400 == 0
      @leap_year = true
    elsif year % 100 == 0
      @leap_year = false
    elsif year % 4 == 0
      @leap_year = true
    else
      @leap_year = false
    end
  end



end
