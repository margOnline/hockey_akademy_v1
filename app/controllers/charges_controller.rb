class ChargesController < ApplicationController

  def new
    @crs = CampRegistration.for_parent(current_parent)
    @amount =  current_parent.camp_registrations_total_price.to_i
  end

  def create
    customer_email = current_parent.email
    @amount =  current_parent.camp_registrations_total_price.to_i
    customer = Stripe::Customer.create(
      :email => customer_email,
      :card => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => 'description',
      :currency => 'gbp'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to parent_charge_path(current_parent)
  end

end
