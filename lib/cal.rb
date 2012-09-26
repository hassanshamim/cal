YEAR = ARGV[1]
MONTH = ARGV[0]

class Month

  @month_names = %w{ January February March April May June July August September October November December }.unshift('MONTH CANNOT BE ZERO')
  @day_titles = [ 'Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa' ]

  attr_reader :leap_year, :num_days, :first_day

  def initialize( month, year )
    @year = year
    @month = month
    set_leap_year( year )
    calc_num_days( month )
    calc_start_day( year, month )
  end

  def set_leap_year( year = YEAR )
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

  def calc_num_days( month )
    months_with_31_days = [ 1, 3, 5, 7, 8, 10, 12 ]
    feb = 2

    @num_days =  months_with_31_days.include?(month) ? 31 : 30
    if month == feb then @num_days = ( @leap_year ? 29 : 28 ) end
  end



  def calc_start_day( year, month )
    if month < 3
      month += 12
      year -= 1
    end
    day_of_month = 1
   @first_day = ( day_of_month + march_offset(month) + year + leap_year_offset(year) ) % 7
  end

  def leap_year_offset( year)
    ( year/4 ) +( 6 *( year/100 ) ) + ( year/400 )
  end

  def march_offset( month )
    ( ( month + 1 ) * 26 ) / 10
  end

end
