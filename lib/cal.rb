YEAR = ARGV[1]
MONTH = ARGV[0]

class Week
end


class Month

  attr_reader :leap_year, :num_days

  def initialize( month, year )
    @year = year
    @month = month
    set_leap_year(year)
    calc_num_days( month )
 
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

  def calc_num_days(month)
    months_with_31_days = [1, 3, 5, 7, 8, 10, 12]
    feb = 2

    @days =  days_with_31_months.include?(month) ? 31 : 30
    if month == feb then @days = ( @leap_year ? 29 : 28 ) end
  end


end
