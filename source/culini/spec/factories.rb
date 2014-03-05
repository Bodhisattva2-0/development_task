FactoryGirl.define do
  factory :customer do
    first_name "john"
    last_name  "doe"
    email "john@doe.com"
  end

    factory :charge do
      amount 13
      paid true
      refunded true
      currency  "usd"
      customer FactoryGirl.create(:customer)
   end
end
