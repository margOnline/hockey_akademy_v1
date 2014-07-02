class BasketsController < ApplicationController

  def show
    @basket = current_parent.basket
  end
end
