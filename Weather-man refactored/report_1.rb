module Report1
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
end
