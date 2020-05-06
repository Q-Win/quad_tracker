module ApplicationHelper
  def get_date(time)
    new_time = time.to_s[0..-4].to_i
    zone = ActiveSupport::TimeZone.new("Central Time (US & Canada)")
    Time.at(new_time).in_time_zone(zone)
  end
end
