require 'spec_helper'

describe CampsController do
  before do
    @camp = FactoryGirl.create(:camp)
    @camp.save
  end

  it 'assigns camps to an instance variable' do
    get :index
    expect(assigns[:camps].count).to be > 0
  end

  it 'assigns a camp to an instance variable' do
    get :show, :id => @camp.id
    expect(assigns[:camp]).to eq @camp
  end

end
