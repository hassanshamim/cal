ABOUT
=====
Cal is a ruby impelemtation of the unix 'cal' command, which displays
a calendar of the desired month or year in the shell.  Due to restrictions
of the Zeller's Congruence algorithm, cal is only accurate for the 
years 1800-3000

TO USE
======
Use ruby to run the cal.rb file, and pass it one or two arguments containing
the desired year and/or month as integers.

EXAMPLES
========
'ruby cal.rb 9 2000' 
will output:

       September 2000
    Su Mo Tu We Th Fr Sa  
                 1  2  
     3  4  5  6  7  8  9  
    10 11 12 13 14 15 16  
    17 18 19 20 21 22 23  
    24 25 26 27 28 29 30  

and 'ruby cal.rb 2000' will output:

                                  2000
          January               February               March          
    Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
                       1         1  2  3  4  5            1  2  3  4  
     2  3  4  5  6  7  8   6  7  8  9 10 11 12   5  6  7  8  9 10 11  
     9 10 11 12 13 14 15  13 14 15 16 17 18 19  12 13 14 15 16 17 18  
    16 17 18 19 20 21 22  20 21 22 23 24 25 26  19 20 21 22 23 24 25  
    23 24 25 26 27 28 29  27 28 29              26 27 28 29 30 31     
    30 31                                                             

           April                  May                   June          
    Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
                       1      1  2  3  4  5  6               1  2  3  
     2  3  4  5  6  7  8   7  8  9 10 11 12 13   4  5  6  7  8  9 10  
     9 10 11 12 13 14 15  14 15 16 17 18 19 20  11 12 13 14 15 16 17  
    16 17 18 19 20 21 22  21 22 23 24 25 26 27  18 19 20 21 22 23 24  
    23 24 25 26 27 28 29  28 29 30 31           25 26 27 28 29 30     
    30                                                                

            July                 August              September        
    Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
                       1         1  2  3  4  5                  1  2  
     2  3  4  5  6  7  8   6  7  8  9 10 11 12   3  4  5  6  7  8  9  
     9 10 11 12 13 14 15  13 14 15 16 17 18 19  10 11 12 13 14 15 16  
    16 17 18 19 20 21 22  20 21 22 23 24 25 26  17 18 19 20 21 22 23  
    23 24 25 26 27 28 29  27 28 29 30 31        24 25 26 27 28 29 30  
    30 31                                                             

          October               November              December        
    Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
     1  2  3  4  5  6  7            1  2  3  4                  1  2  
     8  9 10 11 12 13 14   5  6  7  8  9 10 11   3  4  5  6  7  8  9  
    15 16 17 18 19 20 21  12 13 14 15 16 17 18  10 11 12 13 14 15 16  
    22 23 24 25 26 27 28  19 20 21 22 23 24 25  17 18 19 20 21 22 23  
    29 30 31              26 27 28 29 30        24 25 26 27 28 29 30  
                                                31                    


