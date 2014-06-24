module CampsHelper
  def start_date_for(camp)
    format(camp.campSessions.min_by{|cs| cs.start_time}.start_time)
  end

  def end_date_for(camp)
    format(camp.campSessions.max_by{|cs| cs.end_time}.end_time)
  end

  def format(time)
    time.strftime('%A, %d %b %Y')
  end
end
