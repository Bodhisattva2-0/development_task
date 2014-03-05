require 'spec_helper'

describe Charge do
  describe  "validations" do
    it "should make sure currency value is valid" do
      charge = FactoryGirl.build(:charge, :currency => "foo")
      expect(charge).to be_invalid
    end
  end
end
