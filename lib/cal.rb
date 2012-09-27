YEAR = ARGV[1].to_i
MONTH = ARGV[0].to_i
class Month

  attr_reader :leap_year, :num_days, :first_day

  def initialize( month, year )
    @year = year
    @month = month
#    set_leap_year( year )
    calc_num_days( month )
    calc_start_day( month, year )
  end

  def leap_year?
#    false
#    true if @year % 4 == 0
#    false if @year % 100 == 0
#    true if @year % 400 == 0

    if @year % 400 == 0
      true
    elsif @year % 100 == 0
      false
    elsif @year % 4 == 0
      true
    else
      false
    end
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

  def display_title
    month_names = %w{ January February March April May June July August September October November December }.unshift(nil)
    "#{month_names[@month]} #{@year}".center(20) + "  "
  end

  def display_day_names
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
     # week.each { |date| print "#{ date.center(2) } " }
     # print "\n"
    end
    test_string.chomp!
  end
end

test = Month.new(MONTH, YEAR)
puts test.display_title
puts test.display_day_names
test.display_dates
