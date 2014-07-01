class BasketsController < ApplicationController

  def show
    @basket = Basket.includes(:camp_registrations).where(:parent_id => current_parent.id)
  end
end
