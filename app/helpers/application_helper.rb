module ApplicationHelper
  def get_date(time)
    new_time = time.to_s[0..-4].to_i
    Time.at(new_time)
  end
end
