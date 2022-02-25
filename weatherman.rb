class WeatherMan
    require 'csv'
    require 'colorize'

    def initialize
        @max_temp_year = 0
        @max_temp_year_day = ""
        @min_temp_year = 100
        @min_temp_year_day = ""
        @max_humidity_year = 0
        @max_humidity_year_day = ""
        @high_avg_temp_month = 0
        @low_avg_temp_month = 100
        @avg_humidity_month = 0
        @row_count = 0
        @high_temp_day = 0
        @low_temp_day = 100
    end

    def report_1
        Dir.glob("**/*2015*.txt") do |file|
            CSV.open(file, :col_sep=>",").each do |row|
              
              if (row[1].to_i > @max_temp_year || row[1].to_i == @max_temp_year)
                @max_temp_year = row[1].to_i
                @max_temp_year_day = row[0]
              end

              if (row[3].to_i < @min_temp_year || row[3].to_i == @min_temp_year)
                @min_temp_year = row[3].to_i
                @min_temp_year_day = row[0]
              end

              if (row[8].to_i > @max_humidity_year || row[8].to_i == @max_humidity_year)
                @max_humidity_year = row[8].to_i
                @max_humidity_year_day = row[0]
              end

            end
        end

        puts "Report 1\nHighest: #{@max_temp_year}C on #{@max_temp_year_day}", "Lowest: #{@min_temp_year}C on #{@min_temp_year_day}", "Humid: #{@max_humidity_year}% on #{@max_humidity_year_day}"
    end

    def report_2
        Dir.glob("**/*May*.txt") do |file|
            CSV.open(file, :col_sep=>",").each do |row|
              
              if (row[2].to_i > @high_avg_temp_month || row[2].to_i == @high_avg_temp_month)
                @high_avg_temp_month = row[2].to_i
              end

              if (row[2].to_i < @low_avg_temp_month || row[2].to_i == @low_avg_temp_month)
                @low_avg_temp_month = row[2].to_i
              end

            @avg_humidity_month = @avg_humidity_month + row[8].to_i
            @row_count = @row_count + 1
            end
            
        end
        
        @avg_humidity_month = @avg_humidity_month / @row_count
        puts "\nReport 2\nHighest average: #{@high_avg_temp_month}C", "Lowest average: #{@low_avg_temp_month}C", "Average Humidity: #{@avg_humidity_month}%"
    end

    def bar_chart_high
        print "+".red
    end

    def bar_chart_low
        print "-".blue
    end

    def report_3
        puts "\nReport 3:"
        Dir.glob("**/*2011*Mar*.txt") do |file|
            CSV.open(file, :col_sep=>",").each do |row|
              
              if (row[1].to_i > @high_temp_day || row[1].to_i == @high_temp_day)
                @high_temp_day = row[2].to_i
              end
              
              if (row[3].to_i < @low_temp_day || row[3].to_i == @low_temp_day)
                @low_temp_day = row[2].to_i
              end
              
              puts "\nDay: #{row[0]}"
              puts "\n#{@high_temp_day.times do (bar_chart_high()) end }C"
              puts "\n#{@low_temp_day.times do (bar_chart_low()) end }C" 
            end
            
            @high_temp_day = 0
            @low_temp_day = 100
        end
    end
end

WeatherMan.new.report_1
WeatherMan.new.report_2
WeatherMan.new.report_3