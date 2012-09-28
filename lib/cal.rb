YEAR = ARGV[1].to_i
MONTH = ARGV[0].to_i

module DisplayInfo
  def get_title_line(width, month, year=nil)
    month_names = %w{ January February March April May June July August September October November December }.unshift(nil)
    "#{month_names[month]} #{year}".center(width) + "  "
  end
end


class Month

  include DisplayInfo
  attr_reader :leap_year, :num_days, :first_day

  def initialize( month, year )
    @year = year
    @month = month
    calc_num_days( month )
    calc_start_day( month, year )
  end

  def leap_year?
    return true if @year % 400 == 0
    return false if @year % 100 == 0
    return true if @year % 4 == 0
    false
  end

  def calc_num_days( month )
    months_with_31_days = [ 1, 3, 5, 7, 8, 10, 12 ]
    feb = 2
    @num_days =  months_with_31_days.include?(month) ? 31 : 30
    if month == feb then @num_days = ( leap_year? ? 29 : 28 ) end
  end

  def calc_start_day( month, year )
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

  def get_day_names
    'Su Mo Tu We Th Fr Sa  '
  end

  def display_dates

    initial_array = (1..@num_days).to_a.map{|x| x.to_s}
    initial_array.map!{ |x| x.size == 1 ? ' ' + x : x }
    start_date = @first_day == 0 ? 6 : @first_day - 1  #start_day to accommodate cal starting on sunday
    start_date.times { initial_array.unshift('  ') }
    display_array = []
    6.times { display_array << initial_array.slice!(0, 7) }
    display_array.select!{ |x| x.size > 0 }
    empty = display_array.last.size
    (7 - empty).times { display_array.last.push( '  ' ) }
    test_string = ""

    display_array.each do | week |
      test_string << week.join(" ")
      test_string << "  \n"
    end
    test_string.chomp!
  end
end

class Year

  include DisplayInfo

  def initialize ( year )
    @year = year
    @months_array = []
    1.upto( 12 ) { |i| @months_array << Month.new( i, year ) }
  end
end




example = Month.new(MONTH, YEAR)
puts example.get_title_line(20, MONTH, YEAR)
puts example.get_day_names
puts example.display_dates
