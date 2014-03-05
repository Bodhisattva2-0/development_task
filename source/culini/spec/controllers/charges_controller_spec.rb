require 'spec_helper'

describe ChargesController do
  describe "create" do
    it "creates a new charge" do
         expect { post :create,  :charge => {:amount => 15, :currency => "usd", :customer_id => FactoryGirl.create(:customer).id} }.to change {Charge.count}.by(1)
    end
  end

  describe "index" do
    it "list failed, refunded, successful charges" do
      @failed_charge = FactoryGirl.create(:charge, :paid => false, :refunded => false)
      @disputed_charge = FactoryGirl.create(:charge, :paid => true, :refunded => true)
      @successful_charge = FactoryGirl.create(:charge, :paid => true, :refunded => false)
      get :index
      expect(assigns(:failed_charges)).to include @failed_charge
      expect(assigns(:disputed_charges)).to include @disputed_charge
      expect(assigns(:successful_charges)).to include @successful_charge
    end
  end
end
