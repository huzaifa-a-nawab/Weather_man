module Report2
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
end