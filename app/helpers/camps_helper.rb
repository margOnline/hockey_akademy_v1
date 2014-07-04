module CampsHelper
  def start_date_for(camp)
    camp.camp_sessions.min_by{|cs| cs.start_time}.start_time.strftime('%A, %d %b %Y')
  end

  def end_date_for(camp)
    camp.camp_sessions.max_by{|cs| cs.end_time}.end_time.strftime('%A, %d %b %Y')
  end

end
