require_relative 'report_1'
require_relative 'report_2'
require_relative 'report_3'

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

    include Report1
    include Report2
    include Report3

end

WeatherMan.new.report_1
WeatherMan.new.report_2
WeatherMan.new.report_3