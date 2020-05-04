module ApplicationHelper
  def to_seconds(time)
    new_time = time.to_s[0..-4].to_i
  end
end
