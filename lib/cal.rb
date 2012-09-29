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


  def date_array

    initial_array = (1..@num_days).to_a.map{|x| x.to_s}   #creates array of dates in string format
    initial_array.map!{ |x| x.size == 1 ? ' ' + x : x }   #adds single space before single digits
    start_date = @first_day == 0 ? 6 : @first_day - 1     #start_day to accommodate cal starting on sunday
    start_date.times { initial_array.unshift('  ') }      #adjust spacing for start day
    display_array = []
    6.times { display_array << initial_array.slice!(0, 7) } #chunks array into an array of arrays

    display_array.each do |array| 
      ( 7 - array.size ).times { array.push( '  ' ) }    #ensures week arrays have 7 elements
    end
    display_array
  end

  def to_string
    string_array.join("  \n") + '  '
  end

  def string_array
    date_array.map{ | week | week.join(" ") }
  end
end

class Year

  include DisplayInfo

  attr_reader :months_array

  def initialize ( year )
    @year = year
    @months_array = []
    1.upto( 12 ) { |i| @months_array << Month.new( i, year ) }
  end

  def months_header_title(array)
    array.map { | month | month.get_title_line( 20 ) }.join
  end

  def display_three_months
    temp_array =  @months_array.slice!(0, 3)
    puts months_header_title(temp_array)
    puts DAYNAMES * 3

    string_arrays = temp_array.map{ |month| month.string_array }
    array_by_lines = string_arrays.transpose   
    array_by_lines.each do| line | 
      puts line.join('  ') + '  '
    end
    puts ''
  end

  def display
    puts get_title_line(60, 100, @year).rstrip
    4.times{ display_three_months}
  end

end

if ARGV.size == 1
  input_year = ARGV[0].to_i
  year = Year.new( input_year )
  year.display
elsif ARGV.size == 2
  input_month = ARGV[0].to_i
  input_year = ARGV[1].to_i
  month = Month.new( input_month, input_year )
  puts month.get_title_line(20, input_month, input_year)
  puts DAYNAMES
  puts month.to_string
else
  puts "Invalid arguments.  Use format: ruby cal.rb MONTH, YEAR"
end
