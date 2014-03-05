require 'spec_helper'

describe Customer do
  describe "name" do
    it "returns full name of the cusomter" do
      expect(FactoryGirl.create(:customer, :first_name => "Dean", :last_name => "Martin").name).to eq "Dean Martin"
    end
  end

  describe "max_charge" do
    it "returns charge with maximum amount in name of the custmoer" do
      customer = FactoryGirl.create(:customer, :first_name => "Dean", :last_name => "Martin")
      charge_1 = FactoryGirl.create(:charge, :amount => 5000, :customer_id => customer.id)
      charge_2 = FactoryGirl.create(:charge, :amount => 50, :customer_id => customer.id)
      expect(customer.max_charge).to eq charge_1
    end
  end
end
