YEAR = ARGV[1].to_i
MONTH = ARGV[0].to_i
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
    array.map { | month | month.get_title_line( 20 ) }.join('') 
    
    string = ""
    1.upto(3){ |i| string << get_title_line(20, i) }
    string
  end
  def display_three_months
      temp_ary =  @months_array.slice!(0, 3)
      month_title_string = temp_array.map do | month |
        month.get_title_line(20)
      end
      month_title_string.join('  ') + "  \n"


      master_ary = temp_ary.map do |month_obj|
        month_obj.to_ary_of_arys.map{ |week_ary| week_ary.push(nil) }
      end
      ary_of_weeks = master_ary.transpose
      ary_of_weeks #i lost my train of thought here
      
  end
 #   3_month_ary.map! do |month|
 #     month.map!{
 #   end
 #   self.transpose.each do | week |
 #   
 # end
  def display
    puts get_title_line(60, 100, @year).rstrip
  end
end


#BRAIN DUMP!!
#new_ary = month.new(1, 2000).to_ary_of_arys.map! { |week_ary| week_ary.push(nil) }
#4.times do
#  a.slice!
#end



example = Month.new(MONTH, YEAR)
puts example.get_title_line(20, MONTH, YEAR)
puts DAYNAMES
puts example.to_string
