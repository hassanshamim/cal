DAYNAMES ='Su Mo Tu We Th Fr Sa  '
module DisplayInfo
  def get_title_line(width, month=@month, year=nil)
    month_names = %w{ January February March April May June July August September October November December }
    "#{month_names[month-1]}#{' ' + year.to_s if year}".center(width) + "  "
  end
end

class Month
  include DisplayInfo
  attr_reader :leap_year, :num_days, :first_day

  def initialize( month, year )
    @year = year.to_i
    @month = month.to_i
    calc_num_days( @month )
    calc_start_day( @month, @year )
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

  def calc_start_day( month, year, day_of_month=1 )
    if month < 3
      month += 12
      year -= 1
    end
   @first_day = ( day_of_month + march_offset(month) + year + leap_year_offset(year) ) % 7
  end

  def leap_year_offset( year)
    ( year/4 ) +( 6 * ( year/100 ) ) + ( year/400 )
  end

  def march_offset( month )
    ( ( month + 1 ) * 26 ) / 10
  end

  def date_array
    start_date = @first_day == 0 ? 6 : @first_day - 1     #start_day to accommodate cal starting on sunday
    initial_array = (1..@num_days).map{ |x| x.to_s.rjust(2) }  #creates array of dates in string format
    start_date.times{ initial_array.unshift('  ') }      #adjust spacing for start day
    display_array = Array.new(6){ initial_array.slice!(0,7) }
    #display_array = initial_array.each_slice(7).to_a
    display_array.each do |array|
      array.push('  ') until array.size == 7
    end
  end

  def to_string
    string_array.join("  \n") + '  '
  end

  def string_array
    date_array.map{ | week | week.join(" ") }
  end

  def display
    puts self.get_title_line(20, @month, @year)
    puts DAYNAMES
    puts self.to_string
  end
end

class Year
  include DisplayInfo

  def initialize ( year )
    @year = year.to_i
    @months_array = (1..12).map{ | i | Month.new( i, year ) }
  end

  def months_header_title(array)
    array.map { |month| month.get_title_line( 20 ) }.join
  end

  def display_three_months( array )
    puts months_header_title( array )
    puts DAYNAMES * 3
    array.map(&:string_array).transpose.each{ |line| puts line.join('  ') + '  ' }
    puts ''
  end

  def display
    puts get_title_line(60, 100, @year).rstrip
    @months_array.each_slice( 3 ){ | ary | display_three_months( ary ) }
  end
end
[nil, Year, Month][ARGV.size].new(*ARGV).display
