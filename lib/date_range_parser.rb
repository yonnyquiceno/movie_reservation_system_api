require 'byebug'
class DateRangeParser
  def initialize(date_range)
    @date_range = date_range.split(' - ')
  end

  def initial_date
    @date_range[0].to_date
  end

  def final_date
    @date_range[1].to_date
  end
end