raise ArgumentError.new("Invalid arguments.  Use format: ruby cal.rb MONTH, YEAR") unless [1,2].include? ARGV.count
require_relative 'lib/calendar'

#if ARGV.size == 1
  #Year.new( *ARGV ).display
#elsif ARGV.size == 2
   #Month.new( *ARGV ).display
#else
  #puts "Invalid arguments.  Use format: ruby cal.rb MONTH, YEAR"
#end
