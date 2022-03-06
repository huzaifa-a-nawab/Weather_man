module Report3
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