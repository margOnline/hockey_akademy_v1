require 'spec_helper'

describe CampRegistrationsController do
  before do
    @parent = FactoryGirl.create(:parent)
    sign_in(@parent)
    @camp_registration = FactoryGirl.create(:camp_registration, :parent => @parent)
    @camp_registration.save
  end

  it 'assigns camp_registrations to an instance variable' do
    get :index, :parent_id => @parent.id
    expect(assigns[:camp_registrations].count).to be > 0
  end

  it 'renders the camp_registration new form for parent with players' do
    parent_with_player = FactoryGirl.create(:parent)
    player = FactoryGirl.create(:player, :parent => parent_with_player)
    get :new, :parent_id => parent_with_player.id
    response.status.should be(200)
  end

  it 'redirects to add a player form if parent has no players' do
    get :new, :parent_id => @parent.id
    response.status.should be(302)
  end

end
