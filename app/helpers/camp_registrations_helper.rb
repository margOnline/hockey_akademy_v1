# encoding: UTF-8
module CampRegistrationsHelper

  def total(camp_registrations)
    total = camp_registrations.inject(0) {|sum,cr| sum + cr.camp_session.price}
    number_to_currency(total, :unit => "£")
  end

  def format_for(time)
    time.strftime("%A, %d %b %Y %l:%M %p")
  end

end
