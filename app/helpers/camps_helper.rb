module CampsHelper
  def start_date_for(camp)
    format(camp.camp_sessions.min_by{|cs| cs.start_time}.start_time)
  end

  def end_date_for(camp)
    format(camp.camp_sessions.max_by{|cs| cs.end_time}.end_time)
  end

end
