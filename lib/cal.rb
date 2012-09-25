YEAR = ARGV[1]
MONTH = ARGV[0]

class Week
  attr_accessor :days, :sun, :mon, :tue, :wed, :thur, :fri, :sat

  def initialize 
    @days = [nil, nil, nil, nil, nil, nil, nil]
    @sat = days[0]
    @sun = days[1]
    @mon = days[2]
    @tues =days[3]
    @wed = days[4]
    @thur =days[5]
    @fri = days[6]
   
  end 

end


class Month

  def initialize( )

   @leap_year 
 
  end

  def is_leap_year?(year = YEAR)
    if year % 400 == 0
      true
    elsif year % 100 == 0
      false
    elsif year % 4 == 0
      true
    else
      false
    end
  end

end
