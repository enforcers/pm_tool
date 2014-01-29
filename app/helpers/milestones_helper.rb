module MilestonesHelper
  def formatted_date_range(date1, date2)
    if date2.nil?
      date1.to_s
    else
      date1.to_s + ' to ' + date2.to_s
    end
  end
end
