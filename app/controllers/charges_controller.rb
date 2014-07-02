class ChargesController < ApplicationController

  def new

  end

  def create
    customer_email = current_parent.email
    @amount =  6000

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

  private

    def charge_params
    params.require(:charge).permit(:parent_id)
  end
end
