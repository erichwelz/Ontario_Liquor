module ApplicationHelper

  def time_24h(time) 
    hour = time / 60;
    mins = time % 60;
    return "#{hour}:#{sprintf"%.2d", mins}"
  end

end